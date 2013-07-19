package com.cashbuilder

import java.text.DecimalFormat;
import java.text.DecimalFormatSymbols;
import java.text.NumberFormat;

import com.cashbuilder.beans.CategoriesListBean;
import org.codehaus.groovy.grails.web.util.WebUtils

class GeneralService {
	
	static transactional = true
	
    def serviceMethod() {

    }
	
	/**
	 * 
	 * @param user
	 * @return
	 */
	CategoriesListBean getCategoriesList(User user){
		
		def categories = Category.findAllByUser(user)
		def c =  Subcategory.createCriteria()
		def subcategories = c.list{
			'in'('category', categories)
		}
		
		new CategoriesListBean(categories:categories, subcategories:subcategories)
	}
	
	/**
	 * 
	 * @return
	 */
	DecimalFormat getNumberFormatter(){
		NumberFormat cf = NumberFormat.getCurrencyInstance()
		DecimalFormat df = (DecimalFormat) cf
		DecimalFormatSymbols dfs = df.getDecimalFormatSymbols()
		dfs.setCurrencySymbol ""
		df.setDecimalFormatSymbols dfs
		
		df
	}
	
	void buildMessage(String type, String message){
		def flashScope = WebUtils.retrieveGrailsWebRequest().flashScope
		
		flashScope.message = message
		flashScope.msg_type = type
	}
}
