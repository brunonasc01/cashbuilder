<%--
	/*
	 * Works with all jdk versions >=1.4.
	 * Creates the JavaScript + HTML code required to embed a chart.<br>
	 * Uses the javascript FusionCharts class to create the chart by supplying <br>
	 * the required parameters to it.<br>
	 * Note: Only one of the parameters strURL or strXML has to be non-empty for this<br>
	 * method to work. If both the parameters are provided then strURL is used for further processing.<br>
	 * 
	 * @param chartSWF -
	 *                SWF File Name (and Path) of the chart which you intend
	 *                to plot
	 * @param strURL -
	 *                If you intend to use dataURL method for this chart,
	 *                pass the URL as this parameter. Else, set it to "" (in
	 *                case of dataXML method)
	 * @param strXML -
	 *                If you intend to use dataXML method for this chart,
	 *                pass the XML data as this parameter. Else, set it to ""
	 *                (in case of dataURL method)
	 * @param chartId -
	 *                Id for the chart, using which it will be recognized in
	 *                the HTML page. Each chart on the page needs to have a
	 *                unique Id.
	 * @param chartWidth -
	 *                Intended width for the chart (in pixels)
	 * @param chartHeight -
	 *                Intended height for the chart (in pixels)
  	 * @param debugMode -
   	 *                Whether to start the chart in debug mode 
     * @param registerWithJS -
     *                Whether to ask chart to register itself with
     *                JavaScript	
	 */
--%>

<g:set var="chartSWF" value="${chartSWF}" />
<g:set var="strURL" value="${strURL}" />
<g:set var="strXML" value="${strXML}" />
<g:set var="chartId" value="${chartId}" />
<g:set var="chartWidth" value="${chartWidth? chartWidth : 600}" />
<g:set var="chartHeight" value="${chartHeight? chartHeight : 300}" />
<g:set var="debugModeInt" value="${debugMode? debugMode : 0}" />
<g:set var="regWithJSInt" value="${registerWithJS? registerWithJS : 0}" />

<%-- div to apply the chart --%>
<div id='${chartId }Div' align='center'>Chart.</div>
		
<%-- script to make the chart --%>		
<script type='text/javascript'>
	var chart_${chartId} = new FusionCharts("${chartSWF }", "${chartId}", "${chartWidth }", "${ chartHeight}", "${ debugModeInt}", "${ regWithJSInt}");

	chart_${chartId}.setDataXML("${ strXML}");

	chart_${chartId}.render("${chartId}Div");
</script>
