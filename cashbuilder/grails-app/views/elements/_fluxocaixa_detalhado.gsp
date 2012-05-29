<%@page import="com.cashbuilder.utils.Constants"%>

<g:if test="${cashFlow}">
	<g:javascript>
	$(function() {
		ajaxSubmit('editButton','modal','edit');
	});
	</g:javascript>
			
	<div class="span-17 last">
   		<div id="rbox">
			<div class="inside cashflow">
				<ul class="legend">
					<li class="buttons">
					
					</li>
					<li class="day first-line">
					Dia
					</li>
					<li class="income">
					Entrada
					</li>
					<li class="expense">
					Saida
					</li>
					<li class="category">
					Categoria
					</li>
					<li class="description">
					Descricao
					</li>
				</ul>
				
				<g:each var="transaction" in="${cashFlow.transactions}" status="counter">
					<ul class="${counter == cashFlow.transactions.size() - 1? 'last' : ''  }">
						<li class="buttons">
							 <g:form name="formEdit" controller="pagamento">
			                    <g:hiddenField name="id" value="${transaction.id}" />
			                    <g:submitButton name="editButton" class="bt_edit" value="" title="editar"/>
			                    <input type="submit" name="_action_delete" class="bt_delete" value="" title="excluir" onclick="return confirm('Tem Certeza?');" />
			                </g:form>
						</li>
						<li class="day">
							<g:formatDate format="dd" date="${transaction.date}"></g:formatDate>
						</li>
						<li class="income">
							<g:if test="${transaction.nature.equals('C')}">
								<g:formatNumber number="${transaction.value}" format="${Constants.FORMATO_MOEDA}"></g:formatNumber>
							</g:if>
							<g:else>
								<g:formatNumber number="${0 }" format="${Constants.FORMATO_MOEDA}"></g:formatNumber>
							</g:else>
						</li>
						<li class="expense">
							<g:if test="${transaction.nature.equals('D')}">
							  <g:formatNumber number="${transaction.value}" format="${Constants.FORMATO_MOEDA}"></g:formatNumber>
							</g:if>
							<g:else>
								<g:formatNumber number="${0 }" format="${Constants.FORMATO_MOEDA}"></g:formatNumber>
							</g:else>
						</li>
						<li class="category">
							${transaction.subcategory}
						</li>
						<li class="description">
							${transaction.description}
						</li>
					</ul>
				</g:each>
				
				<div class="clear"></div>
			</div>
		</div>
	</div>	
</g:if>