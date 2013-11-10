package com.cashbuilder

import com.cashbuilder.cmd.CategoryCommand;
import com.cashbuilder.cmd.CategoryDeleteCommand;
import com.cashbuilder.cmd.SubcategoryCommand;

class CategoryController {
	
	def generalService

	def categoryService

	static allowedMethods = [save_category: "POST", selectedCategory: "POST", selectedMultipleCategories: "POST",
		 add_subcategory: "POST", remove_subcategory: "POST", update: "POST", update_deletion: "POST", delete_all: "POST"]
	
    def selectedCategory() {
		
		def id = params.id
		
		if(id){
			def category = Category.findById(params.id)
			render g.select(optionKey: 'id', from: category.subcategories, name: "subcategory.id")
		}
	}
	
	def selectedMultipleCategories() {
		
		def id = params.id
		def name = params.name
		
		if(id){
			def category = Category.findById(params.id)
			render g.select(optionKey: 'id', from: category.subcategories, name: name)
		}
	}
	
	def new_category() {
		def user = session.user.attach()
		def customCategories = Category.findAllByUserAndCustom(user,true);
		
		CategoryCommand cCategory = new CategoryCommand()
		cCategory.subcategories = []
		cCategory.subcategories += new SubcategoryCommand()
		
		[adm: true, category: cCategory, editCategories: customCategories]
	}
	
	def add_subcategory(CategoryCommand ccmd){
		def user = session.user.attach()
		def customCategories = Category.findAllByUserAndCustom(user,true);
		
		ccmd.subcategories += new Subcategory(name:"")
		render(view: "new_category",model:[category: ccmd, editCategories: customCategories, adm: true])
	}
	
	def remove_subcategory(CategoryCommand ccmd){
		def user = session.user.attach()
		def customCategories = Category.findAllByUserAndCustom(user,true);
		
		def subcategoriesToRemove = []

		ccmd.subcategories.eachWithIndex { obj, i ->
			def checks = params."remove_${i}"

			if(checks){
				subcategoriesToRemove += obj
			}
		}
		ccmd.subcategories.removeAll(subcategoriesToRemove)

		render(view: "new_category",model:[category: ccmd, editCategories: customCategories, adm: true])
	}
	
	def save_category(CategoryCommand ccmd){
		def user = session.user.attach()
		Category nCategory = categoryService.saveCategory(user, ccmd)
			
		if(nCategory.hasErrors()){
			def customCategories = Category.findAllByUserAndCustom(user,true);
			
			generalService.buildMessage(Constants.MSG_ERROR,"manager.category.save.error")
			render(view: "new_category",model:[errorBean: nCategory, category: ccmd, editCategories: customCategories, adm: true])
			
		} else {
			generalService.buildMessage(Constants.MSG_SUCCESS,"manager.category.save.success")
			redirect(action: "new_category")
		}
	}
	
	def edit_modal(){
		def category = Category.get(params.id)
			
		render(view: "edit_modal",model:[category:category])
	}

	def edit(){
		def category = Category.get(params.id)

		[adm: true, category: category]
	}
	
	def update(){
		def uCategory = categoryService.updateCategory(params)
		
		if(uCategory.hasErrors()){
			flash.errors = g.renderErrors(bean: uCategory)
			generalService.buildMessage(Constants.MSG_ERROR,"manager.category.update.error.message")

		} else {
			generalService.buildMessage(Constants.MSG_SUCCESS,"manager.category.update.success.message")
		}

		boolean full_scr = params.full_scr
		
		if(full_scr && uCategory.hasErrors()){
			render(view: "edit", model:[adm: true, category:uCategory])
		} else {
			redirect(action: "new_category")
		}
	}
	
	def delete_modal(){
		def category = Category.get(params.id)

		def user = session.user.attach()
		def categoriesList = generalService.getCategoriesList(user)
		
		render(view: "delete_modal",model:[oldCategory:category, categoriesList: categoriesList])
	}
	
	def delete(){
		def category = Category.get(params.id)

		def user = session.user.attach()
		def categoriesList = generalService.getCategoriesList(user)

		[adm: true, oldCategory:category, categoriesList: categoriesList]
	}
	
	def update_deletion(CategoryDeleteCommand cdc){

		if(cdc.validate()){
			categoryService.deleteCustomCategory(params, cdc, false);
			generalService.buildMessage(Constants.MSG_SUCCESS,"manager.category.delete.success.message")

		} else {
			generalService.buildMessage(Constants.MSG_ERROR,"manager.category.delete.error.message")
		}
		
		boolean full_scr = params.full_scr
		
		if(full_scr && !cdc.validate()){
			def category = Category.get(params.id)
			
			def user = session.user.attach()
			def categoriesList = generalService.getCategoriesList(user)
			
			render(view: "delete", model: [adm:true, oldCategory:category, categoriesList: categoriesList])
		} else {
			redirect(action: "new_category")
		}		
	}
	
	def delete_all(CategoryDeleteCommand cdc){

		categoryService.deleteCustomCategory(params, cdc, true);
		generalService.buildMessage(Constants.MSG_SUCCESS,"manager.category.deleteall.success.message")

		redirect(action: "new_category")
	}

}
