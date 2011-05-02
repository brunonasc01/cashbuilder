<html>
    <head>
        <title>Welcome to Grails</title>
        <meta name="layout" content="main" />
    </head>
    <body>
		<div class="menu">
			<div class="green">
				<div id="slatenav">
					<ul>
						<li><g:link controller="home">home</g:link></li>
					</ul>
				</div>
			</div>
		</div>

		<div class="conteudo">
			<g:form>
				<table>
					<tbody>
						<tr class="prop">
						    <td valign="top" class="name">
						        <label for="q">Valor</label>
						    </td>
						    <td valign="top" class="value">
						        <g:textField name="q" maxlength="20" value="${params.q}" />
						    </td>
						</tr>

						<tr class="prop">
							<td valign="top" class="name">
						        <label for="q">Resultados</label>
						    </td>
						    <td valign="top" class="value">
						        <g:select name="max" from="${[1,5,10,50]}"
									value="${params.max ?:10}" />
						    </td>
						</tr>

						<tr>
							<td>
								<g:submitButton name="search" value="Buscar"></g:submitButton>
							</td>
						</tr>
					</tbody>
				</table>
			</g:form>
			
			<g:if test="${searchResult?.results }">
				<g:each var="result" in="${searchResult.results}" status="hitNum">
					<div class="searchPagamento">
						<div class="searchFrom">
							Pagamento
							<g:link controller="pagamento" 
								action="${result.id}">
								${result.id}	
							</g:link>
						</div>
						<div class="searchContent">
							${searchResult.highlights[hitNum]}
						</div>
					</div>
				</g:each>
				
				Displaying hits
				<b>${searchResult.offset+1}-
					${searchResult.offset + searchResult.max}</b> of
				<b>${searchResult.total}</b>:
				<g:set var="totalPages"
					value="${Math.ceil(searchResult.total / searchResult.max)}"/>						
				<g:if test="${totalPages == 1}">
					<span class="currentStep">1</span>
				</g:if>
				<g:else>
					<g:paginate controller="search" action="search"
					params="[q: params.q]"
					total="${searchResult.total}"
					prev="&lt; previous" next="next &gt;"/>
				</g:else>
				<p/>
			</g:if>
			<g:else>
				<g:if test="${searchResult?.suggestQuery}">
					<%@ page import="org.codehaus.groovy.grails.plugins.searchable.util.StringQueryUtils" %>
					<p>Did you mean
					<g:link controller="search" action="search"
					params="[q: searchResult.suggestQuery]">
						${StringQueryUtils.highlightTermDiffs(
						params.q.trim(), searchResult.suggestQuery)
						}
					</g:link>?
				</g:if>					
			</g:else>
		</div>
    </body>
</html>
