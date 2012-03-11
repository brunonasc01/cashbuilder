package com.cashbuilder

import com.cashbuilder.beans.ListaCategoriasBean;
import com.cashbuilder.beans.orcamento.OrcamentoItemCategoriaBean;
import com.cashbuilder.beans.orcamento.OrcamentoItemSubCategoriaBean;
import com.cashbuilder.utils.Constants;
import com.cashbuilder.utils.DateUtils;

/**
 * Classe auxiliar para Orcamento e Fluxo de Caixa
 * @author nascimbr
 *
 */
class OrcamentoService {

	static transactional = true

	def serviceMethod() {
	}

	/**
	 * Calcula o total de pagamentos no mes, dado um criterio
	 * O criterio pode ser uma Categoria, Subcategoria ou Natureza do pagamento
	 * @param orcmMes o mes
	 * @param usuario o usuario
	 * @param criterio o filtro para o calculo
	 * @return o total de pagamentos no mes
	 */
	double getTotalRealizado(OrcmMes orcmMes, Usuario usuario, def criterio){

		String nomeCriterio;

		if(criterio in Categoria){
			nomeCriterio = "categoria"
		} else if(criterio in Subcategoria){
			nomeCriterio = "subcategoria"
		} else if(criterio in String){
			nomeCriterio = "natureza"
		}

		int mes = orcmMes.mes
		int ano = orcmMes.orcamento.ano
		Date primeiroDia = DateUtils.getPrimeiroDia(mes, ano)
		Date ultimoDia = DateUtils.getUltimoDia(mes, ano)

		def c =  Pagamento.createCriteria()
		
		def total = c.get {
			and {
				eq('user', usuario)
				eq(nomeCriterio, criterio)
				between('data', primeiroDia, ultimoDia)
			}
			projections { sum "valor" }
		}

		(total)? total : 0
	}

	List getOrcmItems(Usuario user, int mes, def criterio){
		
		def orcamento = Orcamento.findByAnoAndUser(DateUtils.anoAtual,user)
		def orcmMes =  OrcmMes.findByMesAndOrcamento(mes,orcamento)
		def result = []
		
		if (criterio in Boolean){			
			def list = Categoria.findAllByReceitaAndUser(criterio,user)
			
			list.each {
				result += new ListaCategoriasBean(categoria: it.nome, 
					subcategorias: OrcmItem.findAllByCategoriaAndMes(it,orcmMes,[sort:"subcategoria"]))
			}
		}
		
		result
	}
	
	List getOrcmData(Usuario user, OrcmMes mes, def criterio){
		
		def result = []
		
		if (criterio in Boolean){
			
			def fatherList = Categoria.findAllByReceitaAndUser(criterio,user)
			
			fatherList.each { categoria ->
				OrcamentoItemCategoriaBean categoryBean = new OrcamentoItemCategoriaBean()
				categoryBean.nome = categoria.nome
				categoryBean.valorPrevisto = getTotalPrevisto(mes,categoria)
				categoryBean.valorRealizado = getTotalRealizado(mes,user,categoria)
				
				if(categoryBean.valorPrevisto > 0 || categoryBean.valorRealizado > 0){
					
					def childList = []
	
					categoria.subcategorias.each { subcategoria ->
	
						OrcamentoItemSubCategoriaBean subcategoryBean = new OrcamentoItemSubCategoriaBean()
						OrcmItem childItem = OrcmItem.findBySubcategoriaAndMes(subcategoria,mes)
						subcategoryBean.orcmItem = childItem
						subcategoryBean.valorRealizado = getTotalRealizado(mes,user,subcategoria)
	
						if(subcategoryBean.valorPrevisto > 0 || subcategoryBean.valorRealizado > 0){
							childList += subcategoryBean
						}
					}
	
					categoryBean.subcategorias = childList
					result += categoryBean
				}
			}
		}
		
		result
	}
	
	/**
	 * Calcula o saldo no mes
	 * @param ormcMes o mes
	 * @param usuario o usuario
	 * @return o saldo atual
	 */
	double getSaldoRealizado(OrcmMes ormcMes,Usuario usuario){

		double entradas = getTotalRealizado(ormcMes, usuario, Constants.CREDITO)
		double saidas = getTotalRealizado(ormcMes, usuario, Constants.DEBITO)

		entradas - saidas
	}
	
	/**
	 * Calcula o saldo previsto no mes, dado um criterio
	 * O criterio pode ser uma Categoria, Subcategoria ou Natureza do pagamento
	 * @param mes o mes
	 * @param criterio o criterio de calculo
	 * @return o total previsto
	 */
	double getTotalPrevisto(OrcmMes mes, def criterio){

		double total;

		if(criterio in Categoria){
			total = OrcmItem.findAllByCategoriaAndMes(criterio,mes).sum { it.valorPrevisto }
			
		} else if(criterio in Subcategoria){
			OrcmItem item = OrcmItem.findBySubcategoriaAndMes(criterio,mes)
			total = item?.valorPrevisto

		} else if (criterio in Boolean){
			def categorias = Categoria.findAllByReceita(criterio)
		
			if(categorias){
				def c = OrcmItem.createCriteria()
				
				total = c.get {
					and {
						eq('mes', mes)
						'in'('categoria', categorias)
					}
					projections { sum "valorPrevisto" }
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
   double getSaldoPrevisto(OrcmMes mes){

	   double entradas = getTotalPrevisto(mes,true)
	   double saidas = getTotalPrevisto(mes,false)

	   entradas - saidas
   }
}
