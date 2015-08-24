
<%@ page import="br.ufpe.cin.Feed" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'feed.label', default: 'Feed')}" />
		<title>MyReader | Meus Feeds</title>
	</head>
	<body>
		<a href="#list-feed" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<!--<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>-->
				<li><g:link action="create"><i class="fa fa-plus white"></i> Adicionar Feed</g:link></li>
			</ul>
		</div>
		<p align="right"><a href="${createLink(uri: '/user/logout')}"><i class="fa fa-sign-out"></i> SAIR</a>&nbsp;</p>
		<div id="list-feed" class="content scaffold-list" role="main">
			<h1><strong><i class="fa fa-rss"></i> Meus Feeds</strong></h1>
			<g:if test="${flash.message}">
				<div class="message" role="status">${flash.message}</div>
			</g:if>
			<table>
			<thead>
					<tr>
					
						<g:sortableColumn property="nome" title="${message(code: 'feed.nome.label', default: 'Título')}" />
					
						<g:sortableColumn property="url" title="${message(code: 'feed.url.label', default: 'Url')}" />
					
						<!--<th><g:message code="feed.user.label" default="User" /></th>-->

						<th></th><th></th>
					
					</tr>
					
				</thead>
				<tbody>
				<g:each in="${feedInstanceList}" status="i" var="feedInstance">
					<g:if test="${feedInstance.user.id == session.user.id}">
						<tr class="${(i % 2) == 0 ? 'even' : 'odd'}">
						
							<td><g:link action="show" id="${feedInstance.id}"><i class="fa fa-rss-square"></i> ${fieldValue(bean: feedInstance, field: "nome")}</g:link></td>
						
							<td><i class="fa fa-globe"></i> ${fieldValue(bean: feedInstance, field: "url")}</td>
						
							<!--<td>${fieldValue(bean: feedInstance, field: "user")}</td>-->
						

						<td>
							    <g:form url="[resource:feedInstance, action:'update']" method="PUT">
							        <fieldset class="buttons">
							            <g:actionSubmit class="edit" action="edit" value="${message(code: 'default.button.update.label', default: 'Update')}" />
							        </fieldset>
							    </g:form>
							</td>

							<td>
							    <g:form url="[resource:feedInstance, action:'delete']" method="DELETE">
							        <fieldset class="buttons">
							            <g:actionSubmit class="delete" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />
							        </fieldset>
							    </g:form>
							</td>
						</tr>
					</g:if>
				</g:each>
				</tbody>
			</table>
			<div class="pagination">
				<g:paginate total="${feedInstanceCount ?: 0}" />
			</div>
		</div>
	</body>
</html>