package com.cashbuilder

class Category {

	String name
	boolean income
	boolean custom
	double variationFactor
	
	static belongsTo = [user: User]
	static hasMany = [subcategories: Subcategory]
	
    static constraints = {
		name(blank: false, size:3..20)
		variationFactor(blank:false, scale:1)
    }
	
	static mapping = {
		subcategories sort: 'name'
		sort name: "asc"
	}
	
	String toString(){
		"${name}"
	}
}
