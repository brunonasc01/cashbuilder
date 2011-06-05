package com.cashbuilder

import java.text.DecimalFormat;
import java.text.NumberFormat;
import java.util.Date;

import com.cashbuilder.utils.DateUtils;

class OrcmMes {

	Integer mes
	
	static hasMany = [itens: OrcmItem]
	
	static belongsTo = [orcamento: Orcamento]
	
    static constraints = {
		mes(size:0..11,unique:true)
    }
	
	String toString(){
		"${DateUtils.getMonth(mes)}"
	}
	
	static mapping = {
		
		sort mes: "asc" 
	}
}
