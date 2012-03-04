package com.grailsfusioncharts.beans

import javax.xml.bind.JAXBContext;
import javax.xml.bind.Marshaller;

import com.grailsfusioncharts.column3d.*;

class Column3dChartBean {

	public static String generateGraph(def chartData){

		JAXBContext jaxbContext = JAXBContext.newInstance("com.grailsfusioncharts.column3d")
		Marshaller marshaller = jaxbContext.createMarshaller()
		ObjectFactory factory = new ObjectFactory()

		Graph graph =(Graph)(factory.createGraph())

		graph.setNumberPrefix("R\$")
		graph.setDecimalPrecision '2'
		graph.setThousandSeparator '.'
		graph.setDecimalSeparator ','
				
		chartData.each{
			Set set = (Set) factory.createSet()
			set.setName it.name
			set.setValue it.value

			graph.getSet().add set
		}

		Writer wr = new StringWriter()
		marshaller.setProperty(Marshaller.JAXB_FRAGMENT, Boolean.TRUE)
		marshaller.marshal(graph, wr)
		String result = wr.toString().replace("\"","'")

		result
	}
}
