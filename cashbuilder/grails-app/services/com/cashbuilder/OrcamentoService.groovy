package com.cashbuilder

import java.text.DecimalFormat;

import com.cashbuilder.utils.DateUtils;

class OrcamentoService {

    static transactional = true

    def serviceMethod() {

    }
	
	/**
	 * Calcula o valor total previsto para uma categoria
 	 * @param mes o mes
	 * @param categoria a categoria a ser calculada
	 * @return o valor total previsto
	 */
	String calcTotalPrevisto(OrcmMes mes, Categoria categoria){
		
		double total = 0.0
		
		def itensList = OrcmItem.findAllByCategoriaAndMes(categoria,mes)
		
		if(itensList != null){
			itensList.each{
				total += it.valorPrevisto
			}
		}

		DecimalFormat df = new DecimalFormat(DateUtils.moneyMask)
		df.format(total)
	}
	
	/**
	 * alcula o valor total realizado para uma categoria
	 * @param mes o mes
	 * @param categoria a categoria a ser calculada
	 * @return o valor total realizado 
	 */
	String calcTotalRealizado(OrcmMes mes, Categoria categoria){
		
		int _mes = mes.mes
		int _ano = mes.orcamento.ano
		Date firstDate = DateUtils.getFirstDate(_mes, _ano)
		Date lastDate = DateUtils.getLastDate(_mes,_ano)

		def pagamentos = Pagamento.createCriteria().list {
			and {
				eq('categoria', categoria)
				between('data', firstDate, lastDate)
			}
		}

		double total = 0.0
		
		if(pagamentos){
			pagamentos.each {
				total += it.valor
			}
		}
		
		DecimalFormat df = new DecimalFormat(DateUtils.moneyMask)
		df.format(total)
	}
	
	/**
	 * Verifica se existe orcamento para a subcategoria
	 * @param mes o mes
	 * @param subcategoria a subcategoria
	 * @return true se existir orcamento para essa subcategoria
	 */
	boolean possuiOrcm(OrcmMes mes, Subcategoria subcategoria){
		
		OrcmItem.findBySubcategoriaAndMes(subcategoria,mes)
	}
	
	/**
	 * Obtem o valor previsto para a subcategoria
	 * @param mes o mes
	 * @param subcategoria a subcategoria
	 * @return o valor previsto
	 */
	String getValorPrevisto(OrcmMes mes, Subcategoria subcategoria){
		
		OrcmItem item = OrcmItem.findBySubcategoriaAndMes(subcategoria,mes)
		
		DecimalFormat df = new DecimalFormat(DateUtils.moneyMask)
		df.format(item.valorPrevisto)
	}
	
	/**
	 * Calcula o total realizado para uma subcategoria
	 * @param mes o mes
	 * @param subcategoria a subcategoria
	 * @return o total realizado
	 */
	String calcSubCatRealizado(OrcmMes mes, Subcategoria subcategoria){
		
		int _mes = mes.mes
		int _ano = mes.orcamento.ano
		
		Date firstDate = DateUtils.getFirstDate(_mes, _ano)
		Date lastDate = DateUtils.getLastDate(_mes,_ano)

		def pagamentos = Pagamento.createCriteria().list {
			and {
				eq('subcategoria', subcategoria)
				between('data', firstDate, lastDate)
			}
		}

		double total = 0.0

		if(pagamentos){
			pagamentos.each {
				total += it.valor
			}
		}
		
		double totalPrev = OrcmItem.findBySubcategoriaAndMes(subcategoria,mes).valorPrevisto
		

		formatValue(totalPrev,total,subcategoria.categoria.receita)
	}
	
	private String formatValue(double prevValue, double realValue, boolean credit){
		
		DecimalFormat df = new DecimalFormat(DateUtils.moneyMask)
		String value = df.format(realValue)
		
		if(realValue > prevValue && !credit){
			value = "<span class='warning'>${value}</span>"
		}

		value
	} 
	
	/**
	* Calcula o saldo Previsto
	* @return o saldo previsto
	*/
   String calcSaldoPrevisto(OrcmMes mes){
	   
	   double saldo = 0
	   double entradas = 0
	   double saidas = 0
	   
	   //Credito
	   def categoriasCred = Categoria.findAllByReceita(true)
	   
	   categoriasCred.each{ categoria ->
		   
		   def itensCred = OrcmItem.findAllByCategoriaAndMes(categoria,mes)
		   
		   itensCred.each{ item ->
			   entradas += item.valorPrevisto
		   }
	   }
	   
	   //Debito
	   def categoriasDeb = Categoria.findAllByReceita(false)
	   
	   categoriasDeb.each{ categoria ->
		   
		   def itensDeb = OrcmItem.findAllByCategoriaAndMes(categoria,mes)
		   
		   itensDeb.each{ item ->
			   saidas += item.valorPrevisto
		   }
	   }
	   
	   saldo = entradas - saidas
	   DecimalFormat df = new DecimalFormat(DateUtils.moneyMask)

	   df.format(saldo)
   }
   
   
   
   
   /**
   * Calcula o saldo Realizado
   * @return o saldo realizado
   */
   String calcSaldoRealizado(OrcmMes mes){
	   
	   int _mes = mes.mes
	   int _ano = mes.orcamento.ano
	   Date firstDate = DateUtils.getFirstDate(_mes, _ano)
	   Date lastDate = DateUtils.getLastDate(_mes,_ano)
	   def pagamentos = Pagamento.findAllByDataBetween(firstDate,lastDate)
	   
	   double saldo = 0
	   double entradas = 0
	   double saidas = 0
	   
	   if(pagamentos){
		   pagamentos.each { pg ->
			   if(pg.natureza.equals("C")){
				   entradas += pg.valor
			   }else {
				   saidas += pg.valor
			   }
		   }
	   }

	   saldo = entradas - saidas
	   
	   DecimalFormat df = new DecimalFormat(DateUtils.moneyMask)
	   df.format(saldo)
   }
   
   //------------------ New Methods ------------------
   
   double calcTotalRealCategoria(OrcmMes mes, Categoria categoria){

		int _mes = mes.mes
		int _ano = mes.orcamento.ano
		Date firstDate = DateUtils.getFirstDate(_mes, _ano)
		Date lastDate = DateUtils.getLastDate(_mes,_ano)

		def pagamentos = Pagamento.createCriteria().list {
			and {
				eq('categoria', categoria)
				between('data', firstDate, lastDate)
			}
		}

		double total = 0.0

		if(pagamentos){
			pagamentos.each {
				total += it.valor
			}
		}
		
		total
	}

   double calcTotalPrevCategoria(OrcmMes mes, Categoria categoria){
	   
	   double total = 0.0
	   
	   def itensList = OrcmItem.findAllByCategoriaAndMes(categoria,mes)
	   
	   if(itensList != null){
		   itensList.each{
			   total += it.valorPrevisto
		   }
	   }

	   total
   }
   
   double calcTotalPrevSubcategoria(OrcmMes mes, Subcategoria subcategoria){
	   
		OrcmItem item = OrcmItem.findBySubcategoriaAndMes(subcategoria,mes)
		
		if(item != null){
			return item.valorPrevisto
		}
		
		return 0.0
	}
   
   double calcTotalRealSubcategoria(OrcmMes mes, Subcategoria subcategoria){
	   
			   int _mes = mes.mes
			   int _ano = mes.orcamento.ano
			   Date firstDate = DateUtils.getFirstDate(_mes, _ano)
			   Date lastDate = DateUtils.getLastDate(_mes,_ano)
			   
			   def pagamentos = Pagamento.createCriteria().list {
				   and {
					   eq('subcategoria', subcategoria)
					   between('data', firstDate, lastDate)
				   }
			   }
			   
			   double total = 0.0
			   
			   if(pagamentos){
				   pagamentos.each {
					   total += it.valor
				   }
			   }
	   
			   total
   }
}
