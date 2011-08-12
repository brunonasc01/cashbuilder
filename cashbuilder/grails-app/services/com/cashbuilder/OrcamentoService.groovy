package com.cashbuilder

import com.cashbuilder.utils.Constants;
import com.cashbuilder.utils.DateUtils;

/**
 * Classe utilizada para calculo de totais realizados e previsto
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

		double total = Pagamento.createCriteria().get {
			and {
				eq('user', usuario)
				eq(nomeCriterio, criterio)
				between('data', primeiroDia, ultimoDia)
			}
			projections { sum "valor" }
		}

		(total)? total : 0
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
				total = OrcmItem.createCriteria().get {
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
