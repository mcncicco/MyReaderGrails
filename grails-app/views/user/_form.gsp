<%@ page import="br.ufpe.cin.User" %>



<div class="fieldcontain ${hasErrors(bean: userInstance, field: 'email', 'error')} required">
	<label for="email">
		<g:message code="user.email.label" default="Email" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="email" required="" value="${userInstance?.email}"/>

</div>

<!-- div class="fieldcontain ${hasErrors(bean: userInstance, field: 'feeds', 'error')} ">
	<label for="feeds">
		<g:message code="user.feeds.label" default="Feeds" />
		
	</label>
	
<ul class="one-to-many">
<g:each in="${userInstance?.feeds?}" var="f">
    <li><g:link controller="feed" action="show" id="${f.id}">${f?.encodeAsHTML()}</g:link></li>
</g:each>
<li class="add">
<g:link controller="feed" action="create" params="['user.id': userInstance?.id]">${message(code: 'default.add.label', args: [message(code: 'feed.label', default: 'Feed')])}</g:link>
</li>
</ul>


</div -->

<div class="fieldcontain ${hasErrors(bean: userInstance, field: 'nome', 'error')} required">
	<label for="nome">
		<g:message code="user.nome.label" default="Nome" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="nome" required="" value="${userInstance?.nome}"/>

</div>

<div class="fieldcontain ${hasErrors(bean: userInstance, field: 'password', 'error')} required">
	<label for="password">
		Senha
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="password" required="" value="${userInstance?.password}"/>

</div>