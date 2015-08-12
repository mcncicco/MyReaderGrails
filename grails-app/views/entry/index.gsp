
<%@ page import="br.ufpe.cin.Entry" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'entry.label', default: 'Entry')}" />
		<title><g:message code="default.list.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#list-entry" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="list-entry" class="content scaffold-list" role="main">
			<h1><g:message code="default.list.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
				<div class="message" role="status">${flash.message}</div>
			</g:if>
			<table>
			<thead>
					<tr>
					
						<th><g:message code="entry.feed.label" default="Feed" /></th>
					
						<g:sortableColumn property="nome" title="${message(code: 'entry.nome.label', default: 'Nome')}" />
					
						<g:sortableColumn property="url" title="${message(code: 'entry.url.label', default: 'Url')}" />
					
					</tr>
					<th></th><th></th>
				</thead>
				<tbody>
				<g:each in="${entryInstanceList}" status="i" var="entryInstance">
					<tr class="${(i % 2) == 0 ? 'even' : 'odd'}">
					
						<td><g:link action="show" id="${entryInstance.id}">${fieldValue(bean: entryInstance, field: "feed")}</g:link></td>
					
						<td>${fieldValue(bean: entryInstance, field: "nome")}</td>
					
						<td>${fieldValue(bean: entryInstance, field: "url")}</td>
					

					<td>
						    <g:form url="[resource:entryInstance, action:'update']" method="PUT">
						        <fieldset class="buttons">
						            <g:actionSubmit class="update" action="edit" value="${message(code: 'default.button.update.label', default: 'Update')}" />
						        </fieldset>
						    </g:form>
						</td>

						<td>
						    <g:form url="[resource:entryInstance, action:'delete']" method="DELETE">
						        <fieldset class="buttons">
						            <g:actionSubmit class="delete" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />
						        </fieldset>
						    </g:form>
						</td>
					</tr>
				</g:each>
				</tbody>
			</table>
			<div class="pagination">
				<g:paginate total="${entryInstanceCount ?: 0}" />
			</div>
		</div>
	</body>
</html>
