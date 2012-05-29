package com.cashbuilder

class CategoryController {

    def selectedCategory = {
		
		def id = params.id
		
		if(id){
			def category = Category.findById(params.id)
			render g.select(optionKey: 'id', from: category.subcategories, id: "subcategoriesCombo", name: "subcategory.id")
		}
	}
	
	def selectedMultipleCategories = {
		
		def id = params.id
		
		if(id){
			def category = Category.findById(params.id)
			render g.select(optionKey: 'id', from: category.subcategories, id: "subcategoriesCombo", name: "subcategories[0].id")
		}
	}
}
