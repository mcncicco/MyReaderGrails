<html>
  <head>
    <meta name="layout" content="main" />
    <title>MyReader | Autenticação</title>
  </head>
  <body>
    <div class="body">
      <h1><strong>&nbsp;&nbsp;&nbsp;<i class="fa fa-lock"></i> Autenticação</strong></h1>
      <g:if test="${flash.message}">
        <div class="message">${flash.message}</div>
      </g:if>
      <g:form action="authenticate" method="post" >
        <div class="dialog">
          <table>
            <tbody>
              <tr class="prop">
                <td class="name">
                  <label for="login">Email</label>
                </td>
                <td>
                  <input type="text" id="email" name="email"/>
                </td>
              </tr>

              <tr class="prop">
                <td class="name">
                  <label for="password">Senha</label>
                </td>
                <td>
                  <input type="password" id="password" name="password"/>
                </td>
              </tr>
            </tbody>
          </table>
        </div>
        <div>
          <span>
            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<input class="save" type="submit" value="Entrar" />
            &nbsp;&nbsp;&nbsp;<a class="edit" href="${createLink(uri: '/user/create')}"><i class="fa fa-edit"></i> Cadastre-se!</a>
          </span>
        </div>
      </g:form>
    </div>
  </body>
</html>