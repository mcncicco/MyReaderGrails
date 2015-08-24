<%@ page import="br.ufpe.cin.User" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'user.label', default: 'User')}" />
		<title>MyReader | Editar Meu Perfil</title>
	</head>
	<body>
		<a href="#edit-user" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<!--<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="list" action="index"><g:message code="default.list.label" args="[entityName]" /></g:link></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>-->
				<li><a href="${createLink(uri: '/feed/index')}"><i class="fa fa-rss"></i> Meus Feeds</a></li>
				<li><a href="${createLink(uri: '/feed/create')}"><i class="fa fa-plus white"></i> Adicionar Feed</a></li>				
			</ul>
		</div>
		<div id="edit-user" class="content scaffold-edit" role="main">
			<h1><strong><i class="fa fa-user"></i> Editar Meu Perfil</strong></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<g:hasErrors bean="${userInstance}">
			<ul class="errors" role="alert">
				<g:eachError bean="${userInstance}" var="error">
				<li <g:if test="${error in org.springframework.validation.FieldError}">data-field-id="${error.field}"</g:if>><g:message error="${error}"/></li>
				</g:eachError>
			</ul>
			</g:hasErrors>
			<g:form url="[resource:userInstance, action:'update']" method="PUT" >
				<g:hiddenField name="version" value="${userInstance?.version}" />
				<fieldset class="form">
					<g:render template="form"/>
				</fieldset>
				<fieldset>
					<g:actionSubmit class="save" action="update" value="${message(code: 'default.button.update.label', default: 'Editar')}" />
					&nbsp;&nbsp;&nbsp;<a class="edit" href="${createLink(uri: '/feed/index')}"><i class="fa fa-ban"></i> Cancelar</a>					
				</fieldset>
			</g:form>
		</div>
	</body>
</html>
