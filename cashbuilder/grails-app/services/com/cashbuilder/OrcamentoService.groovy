package com.cashbuilder

import java.text.DecimalFormat;

import com.cashbuilder.utils.Constants;
import com.cashbuilder.utils.DateUtils;

class OrcamentoService {

    static transactional = true

    def serviceMethod() {

    }

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
   
   /**
   * Calcula o saldo Previsto
   * @return o saldo previsto
   */
  double calcSaldoPrevisto(OrcmMes mes){
	  
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
	 
	  return saldo
  }

  /**
  * Calcula o saldo Realizado
  * @return o saldo realizado
  */
  double calcSaldoRealizado(OrcmMes mes){
	  
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
	  
	 return saldo
  }
  
  double calcTotalPrev(OrcmMes mes, boolean receita){
	  
	  double total = 0.0
	  
	  def itensList = OrcmItem.findAllByMes(mes)
	  
	  if(itensList != null){
		  itensList.each{

			  if(it.categoria.receita == receita){
				  total += it.valorPrevisto
			  }
		  }
	  }

	  total
  }
}
