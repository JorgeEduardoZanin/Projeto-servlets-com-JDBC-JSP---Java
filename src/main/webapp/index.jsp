<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="ISO-8859-1">
 <meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/assets/css/index.css">

 
  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
<title>Projeto jsp</title>
</head>
<body>
<h1 id="h1-login">Login</h1>

<form id="login" action="ServletLogin" method="post"  class="row g-3 needs-validation"  novalidate>

<% 
    HttpSession sessao = request.getSession(false);
    if (sessao != null) {
        sessao.invalidate();
    }
%>
<div class="row g-3">
  <div class="col">
    <input  name="login" type="text" class="form-control" placeholder="Login" aria-label="First name" required>
    <div class="invalid-feedback">
       Informe o login.
      </div>
  </div>
  <div class="col">
    <input name="senha" type="password" class="form-control" placeholder="Senha" aria-label="Last name" required>
    <div class="invalid-feedback">
        Informe a senha.
      </div>
  </div>
</div>


<button id="enviar" type="submit" class="btn btn-light" value="<%= request.getParameter("url") %>">Login</button>
<p id="msg">${msg}</p>


</form>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz" crossorigin="anonymous"></script>
<script type="text/javascript">
(() => {
  'use strict'

 
  const forms = document.querySelectorAll('.needs-validation')

 
  Array.from(forms).forEach(form => {
    form.addEventListener('submit', event => {
      if (!form.checkValidity()) {
        event.preventDefault()
        event.stopPropagation()
      }

      form.classList.add('was-validated')
    }, false)
  })
})()
</script>

</body>
</html>