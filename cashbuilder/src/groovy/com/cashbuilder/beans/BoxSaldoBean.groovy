package com.cashbuilder.beans

import com.cashbuilder.OrcmMes;
import com.cashbuilder.Usuario;

class BoxSaldoBean {

	double entradas
	double saidas
	double saldoPrevisto
	double saldoRealizado
	
	public double getSaldo(){
		return entradas - saidas
	}
}
