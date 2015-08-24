
<%@ page import="br.ufpe.cin.User" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'user.label', default: 'User')}" />
		<title>MyReader | Meu Perfil</title>
	</head>
	<body>
		<a href="#show-user" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<!--<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="list" action="index"><g:message code="default.list.label" args="[entityName]" /></g:link></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>-->
				<li><a href="${createLink(uri: '/feed/index')}"><i class="fa fa-rss"></i> Meus Feeds</a></li>
				<li><a href="${createLink(uri: '/feed/create')}"><i class="fa fa-plus white"></i> Adicionar Feed</a></li>
			</ul>
		</div>
		<div id="show-user" class="content scaffold-show" role="main">
			<h1><strong><i class="fa fa-user"></i> Meu Perfil</strong></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<ol class="property-list user">
			
				<g:if test="${userInstance?.email}">
				<li class="fieldcontain">
					<span id="email-label" class="property-label"><g:message code="user.email.label" default="Email" /></span>
					
						<strong><span class="property-value" aria-labelledby="email-label"><g:fieldValue bean="${userInstance}" field="email"/></span></strong>
					
				</li>
				</g:if>
			
				<!--<g:if test="${userInstance?.feeds}">
				<li class="fieldcontain">
					<span id="feeds-label" class="property-label"><g:message code="user.feeds.label" default="Feeds" /></span>
					
						<g:each in="${userInstance.feeds}" var="f">
						<span class="property-value" aria-labelledby="feeds-label"><g:link controller="feed" action="show" id="${f.id}">${f?.encodeAsHTML()}</g:link></span>
						</g:each>
					
				</li>
				</g:if>-->
			
				<g:if test="${userInstance?.nome}">
				<li class="fieldcontain">
					<span id="nome-label" class="property-label"><g:message code="user.nome.label" default="Nome" /></span>
					
						<strong><span class="property-value" aria-labelledby="nome-label"><g:fieldValue bean="${userInstance}" field="nome"/></span></strong>
					
				</li>
				</g:if>
			
				<g:if test="${userInstance?.password}">
				<li class="fieldcontain">
					<span id="password-label" class="property-label">Senha</span>
					
						<strong><span class="property-value" aria-labelledby="password-label">******</span></strong>
					
				</li>
				</g:if>
			
			</ol>
			<g:form url="[resource:userInstance, action:'delete']" method="DELETE">
				<fieldset>
					<i class="fa fa-edit red"></i> <g:link class="edit" action="edit" resource="${userInstance}"><g:message code="default.button.edit.label" default="Editar" /></g:link>
					&nbsp;&nbsp;&nbsp;<g:actionSubmit class="delete" action="delete" value="${message(code: 'default.button.delete.label', default: 'Excluir')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Deseja realmente excluir?')}');" />
				</fieldset>
			</g:form>
		</div>
	</body>
</html>
