package com.cashbuilder

class Subcategory {

    String name
	
	static belongsTo = [category: Category]
	
    static constraints = {
		name(size:3..30,blank:false)
    }

	static mapping = {
		sort name: "asc"
	}
	
	String toString(){
		"${name}"
	}
}
