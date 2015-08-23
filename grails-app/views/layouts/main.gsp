<!DOCTYPE html>
<!--[if lt IE 7 ]> <html lang="en" class="no-js ie6"> <![endif]-->
<!--[if IE 7 ]>    <html lang="en" class="no-js ie7"> <![endif]-->
<!--[if IE 8 ]>    <html lang="en" class="no-js ie8"> <![endif]-->
<!--[if IE 9 ]>    <html lang="en" class="no-js ie9"> <![endif]-->
<!--[if (gt IE 9)|!(IE)]><!--> <html lang="en" class="no-js"><!--<![endif]-->
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
		<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
		<title><g:layoutTitle default="Grails"/></title>
		<meta name="viewport" content="width=device-width, initial-scale=1.0">
		<!--<link rel="shortcut icon" href="${assetPath(src: 'favicon.ico')}" type="image/x-icon">-->
		<link rel="shortcut icon" href="${assetPath(src: 'favicon.png')}">
		<link rel="apple-touch-icon" href="${assetPath(src: 'apple-touch-icon.png')}">
		<link rel="apple-touch-icon" sizes="114x114" href="${assetPath(src: 'apple-touch-icon-retina.png')}">
  		<asset:stylesheet src="application.css"/>
  		<!--<asset:stylesheet src="bootstrap.min.css"/>
  		<asset:stylesheet src="style.css"/>-->
  		<asset:stylesheet src="estilo.css"/>
  		<asset:stylesheet src="font-awesome.min.css"/>
		<asset:javascript src="application.js"/>
		<g:layoutHead/>
	</head>
	<body>

		<div id="grailsLogo" role="banner" align="center"><a href=".."><asset:image src="logo.png" alt="MyReader" title="MyReader"/></a><h4 class='text-center white'><i class="fa fa-leanpub"></i> Leitor de feed de notícias no formato RSS. Um "substituto" ao Google Reader.</h4>
		<br />
		</div>		
		<!--<p class='text-center'><a href='..'><img src="/assets/logo.png" alt="MyReader" title='MyReader' /></a></p>-->
		<div class="nav" role="navigation">
			<ul>
				<g:if test="${session.user == null}">
					<li><a class="save" href="../user/login">Login</a></a></li>
					<li><a class="save" href="../user/create">Criar Usuario</a></a></li>
				</g:if>
				<g:else>
					<li><a class="save" href="../user/logout">logout</a></a></li>
					<li>Bem vindo, ${session.user.nome}</li>
				</g:else>

				
				
			</ul>
		</div>

		<g:layoutBody/>

		<div class="footer" role="contentinfo" align="center"><small class='white'><strong>My<i class="fa fa-rss fa-2x"></i>Reader</strong> - Projetado por: Iuri | Marcelo Cicco | Marcelo Gomes | Menino | Rivaldo | Sandro</small></p></div>
		<div id="spinner" class="spinner" style="display:none;"><g:message code="spinner.alt" default="Loading&hellip;"/></div>

	</body>
</html>