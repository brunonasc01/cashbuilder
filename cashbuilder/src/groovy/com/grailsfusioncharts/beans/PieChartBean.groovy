package com.grailsfusioncharts.beans

import javax.xml.bind.JAXBContext;
import javax.xml.bind.Marshaller;

import com.grailsfusioncharts.piechart.*;

class PieChartBean {

	public static String generateGraph(def chartData){

		JAXBContext jaxbContext = JAXBContext.newInstance("com.grailsfusioncharts.piechart");
		Marshaller marshaller = jaxbContext.createMarshaller();
		ObjectFactory factory = new ObjectFactory();

		Graph graph =(Graph)(factory.createGraph());
		
		graph.setShownames '1'
		graph.setShowvalues '0'
		graph.setDecimalPrecision '2'
		graph.setCaption 'Divisao dos Gastos'
		graph.setFormatNumberScale '0'
				
		chartData.each{
			Set set = (Set) factory.createSet()
			set.setName it.categoria
			set.setValue it.total

			graph.getSet().add set
		}

		Writer wr = new StringWriter()
		marshaller.setProperty(Marshaller.JAXB_FRAGMENT, Boolean.TRUE)
		marshaller.marshal(graph, wr)
		String result = wr.toString().replace("\"","'")

		
		result
	}
}
