//
// This file was generated by the JavaTM Architecture for XML Binding(JAXB) Reference Implementation, vJAXB 2.1.10 in JDK 6 
// See <a href="http://java.sun.com/xml/jaxb">http://java.sun.com/xml/jaxb</a> 
// Any modifications to this file will be lost upon recompilation of the source schema. 
// Generated on: 2011.07.28 at 07:34:24 PM BRT 
//


package com.grailsfusioncharts.multiserie;

import javax.xml.bind.JAXBElement;
import javax.xml.bind.annotation.XmlElementDecl;
import javax.xml.bind.annotation.XmlRegistry;
import javax.xml.namespace.QName;


/**
 * This object contains factory methods for each 
 * Java content interface and Java element interface 
 * generated in the com.grailsfusioncharts.multiserie package. 
 * <p>An ObjectFactory allows you to programatically 
 * construct new instances of the Java representation 
 * for XML content. The Java representation of XML 
 * content can consist of schema derived interfaces 
 * and classes representing the binding of schema 
 * type definitions, element declarations and model 
 * groups.  Factory methods for each of these are 
 * provided in this class.
 * 
 */
@XmlRegistry
public class ObjectFactory {

    private final static QName _Category_QNAME = new QName("", "category");
    private final static QName _Graph_QNAME = new QName("", "graph");
    private final static QName _Set_QNAME = new QName("", "set");
    private final static QName _Categories_QNAME = new QName("", "categories");

    /**
     * Create a new ObjectFactory that can be used to create new instances of schema derived classes for package: com.grailsfusioncharts.multiserie
     * 
     */
    public ObjectFactory() {
    }

    /**
     * Create an instance of {@link Set }
     * 
     */
    public Set createSet() {
        return new Set();
    }

    /**
     * Create an instance of {@link Dataset }
     * 
     */
    public Dataset createDataset() {
        return new Dataset();
    }

    /**
     * Create an instance of {@link Category }
     * 
     */
    public Category createCategory() {
        return new Category();
    }

    /**
     * Create an instance of {@link Categories }
     * 
     */
    public Categories createCategories() {
        return new Categories();
    }

    /**
     * Create an instance of {@link Graph }
     * 
     */
    public Graph createGraph() {
        return new Graph();
    }

    /**
     * Create an instance of {@link JAXBElement }{@code <}{@link Category }{@code >}}
     * 
     */
    @XmlElementDecl(namespace = "", name = "category")
    public JAXBElement<Category> createCategory(Category value) {
        return new JAXBElement<Category>(_Category_QNAME, Category.class, null, value);
    }

    /**
     * Create an instance of {@link JAXBElement }{@code <}{@link Graph }{@code >}}
     * 
     */
    @XmlElementDecl(namespace = "", name = "graph")
    public JAXBElement<Graph> createGraph(Graph value) {
        return new JAXBElement<Graph>(_Graph_QNAME, Graph.class, null, value);
    }

    /**
     * Create an instance of {@link JAXBElement }{@code <}{@link Set }{@code >}}
     * 
     */
    @XmlElementDecl(namespace = "", name = "set")
    public JAXBElement<Set> createSet(Set value) {
        return new JAXBElement<Set>(_Set_QNAME, Set.class, null, value);
    }

    /**
     * Create an instance of {@link JAXBElement }{@code <}{@link Categories }{@code >}}
     * 
     */
    @XmlElementDecl(namespace = "", name = "categories")
    public JAXBElement<Categories> createCategories(Categories value) {
        return new JAXBElement<Categories>(_Categories_QNAME, Categories.class, null, value);
    }

}
