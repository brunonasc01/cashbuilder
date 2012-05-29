package com.cashbuilder

class Category {

	String name
	boolean income
	boolean custom
	
	static belongsTo = [user: User]
	static hasMany = [subcategories: Subcategory]
	
    static constraints = {
		name(blank: false, size:3..20)
    }
	
	static mapping = {
		subcategories sort: 'name'
		sort name: "asc"
	}
	
	String toString(){
		"${name}"
	}
}
