package com.grailsfusioncharts.beans

import javax.xml.bind.JAXBContext;
import javax.xml.bind.Marshaller;

import com.cashbuilder.Constants;
import com.grailsfusioncharts.column3d.*;

class Column3dChartBean {

	public static String generateGraph(def chartData){

		JAXBContext jaxbContext = JAXBContext.newInstance("com.grailsfusioncharts.column3d")
		Marshaller marshaller = jaxbContext.createMarshaller()
		ObjectFactory factory = new ObjectFactory()

		Graph graph =(Graph)(factory.createGraph())
		
		graph.setDecimalPrecision '2'
		graph.setThousandSeparator '.'
		graph.setDecimalSeparator ','
		graph.setFormatNumberScale '0'
				
		chartData.eachWithIndex{ data, index ->
			Set set = (Set) factory.createSet()
			set.setName data.name
			set.setValue data.value
			set.setColor(Constants.graphColors[index])
			
			graph.getSet().add set
		}

		Writer wr = new StringWriter()
		marshaller.setProperty(Marshaller.JAXB_FRAGMENT, Boolean.TRUE)
		marshaller.marshal(graph, wr)
		String result = wr.toString().replace("\"","'")

		result
	}
}
