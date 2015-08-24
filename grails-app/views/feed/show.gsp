
<%@ page import="br.ufpe.cin.Feed" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'feed.label', default: 'Feed')}" />
		<title>MyReader | Detalhes do Feed</title>
	</head>
	<body>
		<a href="#show-feed" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<!--<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>-->
				<li><g:link action="index"><i class="fa fa-rss"></i> Meus Feeds</g:link></li>
				<li><g:link action="create"><i class="fa fa-plus white"></i> Adicionar Feed</g:link></li>
			</ul>
		</div>
		<p align="right"><a href="${createLink(uri: '/user/logout')}"><i class="fa fa-sign-out"></i> SAIR</a>&nbsp;</p>
		<div id="show-feed" class="content scaffold-show" role="main">
			<h1><strong><i class="fa fa-rss-square"></i> Detalhes do Feed</strong></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<ol class="property-list feed">
			
				<g:if test="${feedInstance?.entrys}">
				<li class="fieldcontain">
					<span id="entrys-label" class="property-label"><g:message code="feed.entrys.label" default="Entrys" /></span>
					
						<g:each in="${feedInstance.entrys}" var="e">
						<span class="property-value" aria-labelledby="entrys-label"><g:link controller="entry" action="show" id="${e.id}">${e?.encodeAsHTML()}</g:link></span>
						</g:each>
					
				</li>
				</g:if>
			
				<g:if test="${feedInstance?.nome}">
				<li class="fieldcontain">
					<span id="nome-label" class="property-label">Título:</span>
					
						<strong><span class="property-value" aria-labelledby="nome-label"><g:fieldValue bean="${feedInstance}" field="nome"/></span></strong>
					
				</li>
				</g:if>
			
				<g:if test="${feedInstance?.url}">
				<li class="fieldcontain">
					<span id="url-label" class="property-label"><g:message code="feed.url.label" default="Url" />:</span>
					
						<strong><span class="property-value" aria-labelledby="url-label"><g:fieldValue bean="${feedInstance}" field="url"/></span></strong>
					
				</li>
				</g:if>
			
				<!--<g:if test="${feedInstance?.user}">
				<li class="fieldcontain">
					<span id="user-label" class="property-label"><g:message code="feed.user.label" default="User" /></span>
					
						<span class="property-value" aria-labelledby="user-label"><g:link controller="user" action="show" id="${feedInstance?.user?.id}">${feedInstance?.user?.encodeAsHTML()}</g:link></span>
					
				</li>
				</g:if>-->
				<%

// A variável "url" irá receber o endereço do feed...

def url = feedInstance.url

// Na variável "rss" o xml do feed é lido...

def rss = new XmlSlurper().parse(url) 

// Agora os objetos do xml (feed) estão acessíveis...

%>

<br /><hr /><br />

<% rss.channel.item.each { %>

<h3 align="justify"><i class="fa fa-globe"></i> <a href="${it.link}" target="_blank">${it.title}</a></h3><br />

<!--<p align="justify"><small>${it.description}</small></p>-->

<% } %>
			
			</ol>

			<g:form url="[resource:feedInstance, action:'delete']" method="DELETE">
				<fieldset>
					<g:link class="edit" action="edit" resource="${feedInstance}"><i class="fa fa-edit"></i> Editar</g:link>
					&nbsp;&nbsp;&nbsp;<g:actionSubmit class="delete" action="delete" value="${message(code: 'default.button.delete.label', default: 'Excluir')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Deseja realmente excluir?')}');" />
				</fieldset>
			</g:form>
		</div>

	</body>
</html>