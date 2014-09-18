package com.cashbuilder

import java.util.List;

import com.cashbuilder.beans.CategoriesListBean;
import com.cashbuilder.budget.BudgetItemCategoryBean;
import com.cashbuilder.budget.BudgetItemSubcategoryBean;

class BudgetService {

	static transactional = true

	def serviceMethod() {
	}

	double verifyBudgetOverflow(User user, BudgetMonth budgetMonth, Category category){
		double overflow = 0

		double totalIncome = getRealizedTotal(budgetMonth,user,Constants.CREDITO)
		double totalCategory = getRealizedTotal(budgetMonth,user,category)

		if(totalIncome > 0 && totalCategory > 0 && category.variationFactor > 0){
			double categoryPercent = category.variationFactor
			double maxValue = totalIncome * categoryPercent

			if(totalCategory - maxValue > 10){
				overflow =  totalCategory - maxValue
			}
		}

		overflow
	}
 	
	/**
	 * 
	 * @param budgetMonth
	 * @param user
	 * @param criteria
	 * @return
	 */
	double getRealizedTotal(BudgetMonth budgetMonth, User user, def criteria){

		String searchCriteria;

		if(criteria in Category){
			searchCriteria = "category"
		} else if(criteria in Subcategory){
			searchCriteria = "subcategory"
		} else if(criteria in String){
			searchCriteria = "nature"
		}

		int month = budgetMonth.month
		int year = budgetMonth.budget.year
		Date firstDay = DateUtils.getFirstDay(month, year)
		Date lastDay = DateUtils.getLastDay(month, year)

		def c =  Transaction.createCriteria()
		
		def total = c.get {
			and {
				eq('user', user)
				eq(searchCriteria, criteria)
				between('date', firstDay, lastDay)
			}
			projections { sum "value" }
		}

		(total)? total : 0
	}

	/**
	 *
	 * @param budgetMonth
	 * @param user
	 * @param criteria
	 * @return
	 */
	double getRealizedTotalByRange(BudgetMonth budgetMonth, User user, def criteria){

		String searchCriteria;

		if(criteria in Category){
			searchCriteria = "category"
		} else if(criteria in Subcategory){
			searchCriteria = "subcategory"
		} else if(criteria in String){
			searchCriteria = "nature"
		}

		int month = budgetMonth.month
		int year = budgetMonth.budget.year
		
		//First Day of Year
		Date firstDay = DateUtils.getFirstDay(0, year)
		Date lastDay = DateUtils.getLastDay(month, year)

		def c =  Transaction.createCriteria()
		
		def total = c.get {
			and {
				eq('user', user)
				eq(searchCriteria, criteria)
				between('date', firstDay, lastDay)
			}
			projections { sum "value" }
		}

		(total)? total : 0
	}
	
	List getBudgetItems(User user, int month, int year, def criteria){
		
		def budget = Budget.findByYearAndUser(year,user)
		def budgetMonth = BudgetMonth.findByMonthAndBudget(month,budget)
		def result = []

		if (criteria in Boolean){
			def categories = Category.findAllByIncomeAndUser(criteria,user)

			categories.each { category ->
				result += new CategoriesListBean (category: category.name,
					subcategories: BudgetItem.findAllByCategoryAndMonth(category,budgetMonth,[sort:"subcategory"]))
			}
		}

		result
	}
	
	List getBudgetData(User user, BudgetMonth month, def criteria){
		
		def result = []
		
		if (criteria in Boolean){
			
			def fatherList = Category.findAllByIncomeAndUser(criteria,user)
			
			fatherList.each { category ->
				BudgetItemCategoryBean categoryBean = new BudgetItemCategoryBean()
				categoryBean.name = category.name
				categoryBean.budgetedValue = getBudgetedTotal(month,category)
				categoryBean.realizedValue = getRealizedTotal(month,user,category)
				
				setBudgetBarLayout(categoryBean)

				if(categoryBean.budgetedValue > 0 || categoryBean.realizedValue > 0){
					
					def childList = []
	
					category.subcategories.each { subcategory ->
	
						BudgetItemSubcategoryBean subcategoryBean = new BudgetItemSubcategoryBean()
						BudgetItem childItem = BudgetItem.findBySubcategoryAndMonth(subcategory,month)
						subcategoryBean.budgetItem = childItem
						subcategoryBean.realizedValue = getRealizedTotal(month,user,subcategory)
	
						setBudgetBarLayout(subcategoryBean)
						
						if(subcategoryBean.budgetedValue > 0 || subcategoryBean.realizedValue > 0){
							childList += subcategoryBean
						}
					}
	
					categoryBean.subcategories = childList
					result += categoryBean
				}
			}
		}
		
		result
	}
	
	void setBudgetBarLayout(def category){
	
		if(category.budgetedValue > 0 && category.realizedValue > 0){
			
			if((category.realizedValue - category.budgetedValue).abs() < 0.5){
				category.barSize = 100
			} else {
				category.barSize = (category.realizedValue / category.budgetedValue) * 100
			}
			
			if(category.barSize == 100){
				category.barClass = "full"

			} else if(category.barSize < 50){
				category.barClass = "low"
				 
			} else if(category.barSize > 75){
				category.barClass = "high"
			}

			if(category.barSize > 100){
				category.barSize = 100
			}
			
		} else {
			category.barSize = 0
		}
	}
	
	/**
	 * 
	 * @param ormcMes
	 * @param usuario
	 * @return
	 */
	double getBalance(BudgetMonth month,User user){

		double entradas = getRealizedTotal(month, user, Constants.CREDITO)
		double saidas = getRealizedTotal(month, user, Constants.DEBITO)

		entradas - saidas
	}
	
	/**
	 * Calcula o saldo de protecao para o mes
	 * @param month orcamento do mes
	 * @return
	 */
	double getProtectionBalance(BudgetMonth month, User user){
		double total;
		
		def allCategories = Category.findAllByUser(user)
		
		allCategories.each{ category ->
			if(category.variationFactor > 0){
				double budgetTotal = getBudgetedTotal(month,category)
				total += budgetTotal * category.variationFactor
			}
		} 
		
		(total)? total : 0
	}
	
	/**
	 * Calcula o saldo previsto no mes, dado um criterio
	 * O criterio pode ser uma Categoria, Subcategoria ou Natureza do pagamento
	 * @param mes o mes
	 * @param criterio o criterio de calculo
	 * @return o total previsto
	 */
	double getBudgetedTotal(BudgetMonth month, def criteria){

		double total;
		
		if(criteria in Category){
			total = BudgetItem.findAllByCategoryAndMonth(criteria,month).sum { it.budgetedValue }
			
		} else if(criteria in Subcategory){
			BudgetItem item = BudgetItem.findBySubcategoryAndMonth(criteria,month)
			total = item?.budgetedValue

		} else if (criteria in Boolean){
			def categories = Category.findAllByIncome(criteria)
		
			if(categories){
				def c = BudgetItem.createCriteria()
				
				total = c.get {
					and {
						eq('month', month)
						'in'('category', categories)
					}
					projections { sum "budgetedValue" }
				}
			}
		}

		(total)? total : 0
	}
	
	/**
	* Calcula o saldo previsto em um mes
	* @param mes o mes
	* @return o saldo previsto
	*/
	double getBudgetedBalance(BudgetMonth month){

		double entradas = getBudgetedTotal(month,true)
		double saidas = getBudgetedTotal(month,false)

		entradas - saidas
	}
   
	/**
	* Cria um novo orcamento (a cada ano novo)
	* @param user Usuario
	* @param year o ano do orcamento a ser criado
	*/
	void createNewBudget(User user, int year){

		Budget budget = new Budget(year: year,user: user, calculated:true)

		if(budget.save()){
			Budget oldBudget = Budget.findByYearAndUser(year-1,user)

			if(oldBudget){
				def oldBudgetMonthsList = BudgetMonth.findAllByBudget(oldBudget)

				oldBudgetMonthsList.each{ budgetMonth ->
					def newBudgetMonth = new BudgetMonth(month:budgetMonth.month,budget:budget)

					if(newBudgetMonth.save()){
						def oldBudgetMonthItems = budgetMonth.itens

						oldBudgetMonthItems.each{ item ->
							new BudgetItem(category:item.category,subcategory:item.subcategory,month:newBudgetMonth).save()
						}
					}
				}
			}
		}
	}
  
	boolean saveFullBudget(User user, String saveType, Map params){
		if(user){
			def budgetMonth = BudgetMonth.get(params.id)
		  
			if(budgetMonth){
				def budget = budgetMonth.budget
				budget.calculated = true;
							  
				if(saveType.equals("month")){
					budgetMonth.properties = params

				} else if(saveType.equals("year")){
					BudgetMonth.findAllByBudget(budget).each {
						it.properties = params
					}
				}
			}
		} 
	}
}

