<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'feed.label', default: 'Feed')}" />
		<title><g:message code="default.create.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#create-feed" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<!--<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>-->
				<li><g:link action="index"><i class="fa fa-rss"></i> Meus Feeds</g:link></li>
			</ul>
		</div>
		<p align="right"><a href="${createLink(uri: '/user/logout')}"><i class="fa fa-sign-out"></i> SAIR</a>&nbsp;</p>		
		<div id="create-feed" class="content scaffold-create" role="main">
			<h1><strong>> Adicionar Feed</strong></h1>
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
			<g:form url="[resource:feedInstance, action:'save']" >
				<fieldset class="form">
					<g:render template="form"/>
				</fieldset>
				<fieldset>
					<g:submitButton name="create" class="save" value="Cadastrar" />
					&nbsp;&nbsp;&nbsp;<a class="edit" href="${createLink(uri: '/feed/index')}"><i class="fa fa-ban"></i> Cancelar</a>
				</fieldset>
			</g:form>
		</div>
	</body>
</html>