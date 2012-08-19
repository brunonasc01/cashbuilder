package com.grailsfusioncharts.beans

import javax.xml.bind.JAXBContext;
import javax.xml.bind.Marshaller;

import com.grailsfusioncharts.multiserie.ObjectFactory;
import com.grailsfusioncharts.multiserie.*;

class MultiBarChartBean {

	
	public static String generateChart(def dataChart){

		JAXBContext jaxbContext = JAXBContext.newInstance("com.grailsfusioncharts.multiserie");
		Marshaller marshaller = jaxbContext.createMarshaller();
		ObjectFactory factory = new ObjectFactory();

		Graph graph =(Graph)(factory.createGraph());
		
		graph.setDecimalPrecision '2'
		graph.setFormatNumberScale '0'
		graph.setThousandSeparator '.'
		graph.setDecimalSeparator ','
		graph.setRotateNames '0'

		Categories cts = (Categories) factory.createCategories()
		cts.setFont 'Arial'
		cts.setFontSize '11'
		cts.setFontColor '000000'
		
		dataChart.each {
			Category ct = (Category) factory.createCategory()
			ct.setName it.mes
			cts.getCategory().add ct
		}
		
		graph.setCategories cts

		//entradas
		Dataset dataset = (Dataset)factory.createDataset()
		dataset.setSeriesname 'Entrada'
		dataset.setColor '00642D'
		
		dataChart.each {
			Set set = (Set) factory.createSet()
			set.setValue((String)it.entradas)
			dataset.getSet().add(set)
		}
		
		graph.getDataset().add dataset
		
		//saidas
		Dataset dataset2 = (Dataset)factory.createDataset()
		dataset2.setSeriesname 'Saida'
		dataset2.setColor 'E40101'
		
		dataChart.each {
			Set set = (Set) factory.createSet()
			set.setValue((String)it.saidas)
			dataset2.getSet().add(set)
		}

		graph.getDataset().add dataset2
		
		Writer wr = new StringWriter()
		marshaller.setProperty(Marshaller.JAXB_FRAGMENT, Boolean.TRUE)
		marshaller.marshal(graph, wr)

		String result = wr.toString().replace("\"","'")


		result
	}
}
