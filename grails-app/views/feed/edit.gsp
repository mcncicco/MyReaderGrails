<%@ page import="br.ufpe.cin.Feed" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'feed.label', default: 'Feed')}" />
		<title>MyReader | Editar Feed</title>
	</head>
	<body>
		<a href="#edit-feed" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<!--<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>-->
				<li><g:link action="index"><i class="fa fa-rss"></i> Meus Feeds</g:link></li>
				<!--<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>-->
			</ul>
		</div>
		<p align="right"><a href="${createLink(uri: '/user/logout')}"><i class="fa fa-sign-out"></i> SAIR</a>&nbsp;</p>		
		<div id="edit-feed" class="content scaffold-edit" role="main">
			<h1><strong>> <g:message code="default.edit.label" args="[entityName]" /></strong></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<g:hasErrors bean="${feedInstance}">
			<ul class="errors" role="alert">
				<g:eachError bean="${feedInstance}" var="error">
				<li <g:if test="${error in org.springframework.validation.FieldError}">data-field-id="${error.field}"</g:if>><g:message error="${error}"/></li>
				</g:eachError>
			</ul>
			</g:hasErrors>
			<g:form url="[resource:feedInstance, action:'update']" method="PUT" >
				<g:hiddenField name="version" value="${feedInstance?.version}" />
				<fieldset class="form">
					<g:render template="form"/>
				</fieldset>
				<fieldset>
					<g:actionSubmit class="save" action="update" value="${message(code: 'default.button.update.label', default: 'Update')}" />
					&nbsp;&nbsp;&nbsp;<a class="edit" href="${createLink(uri: '/feed/index')}"><i class="fa fa-ban"></i> Cancelar</a>
				</fieldset>
			</g:form>
		</div>
	</body>
</html>