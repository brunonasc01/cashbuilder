package com.cashbuilder

class CustomElementsTagLib {
	
	/**
	 * Tag para renderizacao do elemento select com suporte a internacionalizacao
	 * das opcoes
	 * 
	 * @attr name O nome do elemento select
     * @attr id O id do elemento select
     * @attr from A lista de valores para montar o select
     * @attr currentValue O valor da opcao ja selecionada
     * @attr optionKey Se nao definido, o valor da opcao sera um toString() no elemento da lista. Caso definido ira obter o valor da propriedade em cada elemento da lista 
     * @attr optionValue Se nao definido, o texto da opcao sera um toString() no elemento da lista. Caso definido ira obter o valor da propriedade em cada elemento da lista
     * @attr nameDisplayPrefix Ao definir o prefixo, o texto de exibicao sera obtido atraves da propriedade ${nameDisplayPrefix}.valor, que deve ser definida no arquivo i18n
     * @attr defaultOption Opcao padrao para quando nao existir uma opcao pre-selecionada
     * @attr disabled se true, o select ficara desabilitado (padrao, false)
	 */
	def comboBox = { attrs ->
		def id = attrs.id
		def name = attrs.name
		def from = attrs.from
		def currentValue = attrs.value
		def optionKey = attrs.optionKey
		def optionValue = attrs.optionValue
		def disabled = attrs.disabled?: "false"
		
		def nameDisplayPrefix = attrs.nameDisplayPrefix
		def defaultOption = attrs.defaultOption?: ["":"Selecione"]
		
		defaultOption = defaultOption.entrySet().iterator().next()
		
		def paramId = id? "id=${id}" : ""
		def paramName = name? "name=${name}" : ""
		def paramDisabled = disabled == "true"? "disabled" : ""
		
		out << "<select ${paramId} ${paramName} ${paramDisabled}>"
		out << "<option value=${defaultOption.key}>${defaultOption.value}</option>"
		
		if(from && !from.empty){
			from.each { option ->

				String key = optionKey? option."${optionKey}" : option
				String value = optionValue? option."${optionValue}" : option
				String selected = (key == currentValue.toString())? "selected" : "";

				if(nameDisplayPrefix){
					String message = g.message(code:"${nameDisplayPrefix}.${value}")

					if(message != "${nameDisplayPrefix}.${value}"){
						value = message
					}
				}
				out << "<option value=${key} ${selected}>${value}</option>"
			}
		}
		
		out << "</select>"
	}
	
	def customLabel = { attrs ->
		String value = attrs.value
		String prefix = attrs.prefix

		if(prefix){
			String message = g.message(code:"${prefix}.${value}")
			
			if(message != "${prefix}.${value}"){
				value = message
			}
		}
		out << value
	}
}
