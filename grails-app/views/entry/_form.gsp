<%@ page import="br.ufpe.cin.Entry" %>



<div class="fieldcontain ${hasErrors(bean: entryInstance, field: 'feed', 'error')} required">
	<label for="feed">
		<g:message code="entry.feed.label" default="Feed" />
		<span class="required-indicator">*</span>
	</label>
	<g:select id="feed" name="feed.id" from="${br.ufpe.cin.Feed.list()}" optionKey="id" required="" value="${entryInstance?.feed?.id}" class="many-to-one"/>

</div>

<div class="fieldcontain ${hasErrors(bean: entryInstance, field: 'nome', 'error')} required">
	<label for="nome">
		<g:message code="entry.nome.label" default="Nome" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="nome" required="" value="${entryInstance?.nome}"/>

</div>

<div class="fieldcontain ${hasErrors(bean: entryInstance, field: 'url', 'error')} required">
	<label for="url">
		<g:message code="entry.url.label" default="Url" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="url" required="" value="${entryInstance?.url}"/>

</div>

