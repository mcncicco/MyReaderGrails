<%@ page import="br.ufpe.cin.Feed" %>



<!-- div class="fieldcontain ${hasErrors(bean: feedInstance, field: 'entrys', 'error')} ">
	<label for="entrys">
		<g:message code="feed.entrys.label" default="Entrys" />
		
	</label>
	
<ul class="one-to-many">
<g:each in="${feedInstance?.entrys?}" var="e">
    <li><g:link controller="entry" action="show" id="${e.id}">${e?.encodeAsHTML()}</g:link></li>
</g:each>
<li class="add">
<g:link controller="entry" action="create" params="['feed.id': feedInstance?.id]">${message(code: 'default.add.label', args: [message(code: 'entry.label', default: 'Entry')])}</g:link>
</li>
</ul>


</div -->

<div class="fieldcontain ${hasErrors(bean: feedInstance, field: 'nome', 'error')} required">
	<label for="nome">
		<g:message code="feed.nome.label" default="Nome" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="nome" required="" value="${feedInstance?.nome}"/>

</div>

<div class="fieldcontain ${hasErrors(bean: feedInstance, field: 'url', 'error')} required">
	<label for="url">
		<g:message code="feed.url.label" default="Url" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="url" required="" value="${feedInstance?.url}"/>

</div>

<div class="fieldcontain ${hasErrors(bean: feedInstance, field: 'user', 'error')} required not">
	<label for="user">
		<g:message code="feed.user.label" default="User" />
		<span class="required-indicator">*</span>
	</label>
	<g:select id="user" name="user.id" from="${session.user}" optionKey="id" required="" value="${feedInstance?.user?.id}" class="many-to-one"/>

</div>

