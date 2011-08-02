package com.grailsfusioncharts.beans

import javax.xml.bind.JAXBContext;
import javax.xml.bind.Marshaller;

import com.grailsfusioncharts.multiline.*;

class MultiLineChartBean {

	public static String generateGraph(def chartData){

		JAXBContext jaxbContext = JAXBContext.newInstance("com.grailsfusioncharts.multiline");
		Marshaller marshaller = jaxbContext.createMarshaller();
		ObjectFactory factory = new ObjectFactory();

		Graph graph =(Graph)(factory.createGraph());
		
		graph.setShownames '1'
		graph.setDecimalPrecision '2'
		graph.setCaption 'Evolucao dos Gastos'
		graph.setYAxisMinValue '1000'
		graph.setYAxisMaxValue '1800'
		graph.setNumberPrefix 'R$'
		graph.setFormatNumberScale '0'

		Categories categories = (Categories) factory.createCategories()
		
		chartData.each{
			Category category = (Category) factory.createCategory()
			category.setName it.mes
			
			categories.getCategory().add category
		}
		
		graph.setCategories categories
		
		Dataset dataSet = (Dataset) factory.createDataset()
		dataSet.setSeriesName "Saidas"
		dataSet.setColor "E40101"
		
		chartData.each{
			Set set = (Set) factory.createSet()
			set.setValue((String)it.saidas)
			
			dataSet.getSet().add set
		}
		graph.getDataset().add dataSet
		
		Dataset dataSet2 = (Dataset) factory.createDataset()
		dataSet2.setSeriesName "Entradas"
		dataSet2.setColor "00642D"
		
		chartData.each{
			Set set = (Set) factory.createSet()
			set.setValue((String)it.entradas)
			
			dataSet2.getSet().add set
		}
		graph.getDataset().add dataSet2
		
		Writer wr = new StringWriter()
		marshaller.setProperty(Marshaller.JAXB_FRAGMENT, Boolean.TRUE)
		marshaller.marshal(graph, wr)
		String result = wr.toString().replace("\"","'")

		
		result
	}
}
