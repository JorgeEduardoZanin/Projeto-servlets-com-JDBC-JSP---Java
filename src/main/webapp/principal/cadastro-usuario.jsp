<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html lang="en">
<link
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css"
	rel="stylesheet">

<jsp:include page="head.jsp"></jsp:include>

<body>
	<!-- Pre-loader start -->
	<jsp:include page="theme-loader.jsp"></jsp:include>
	<!-- Pre-loader end -->
	<div id="pcoded" class="pcoded">
		<div class="pcoded-overlay-box"></div>
		<div class="pcoded-container navbar-wrapper">
			<jsp:include page="navbar.jsp"></jsp:include>

			<div class="pcoded-main-container">
				<div class="pcoded-wrapper">
					<jsp:include page="navbar-menu.jsp"></jsp:include>
					<div class="pcoded-content">
						<!-- Page-header start -->
						<jsp:include page="page-header.jsp"></jsp:include>
						<!-- Page-header end -->
						<div class="pcoded-inner-content">
							<!-- Main-body start -->
							<div class="main-body">
								<div class="page-wrapper">
									<!-- Page-body start -->
									<div class="page-body">

										<h1>Cadastro de usuários</h1>
										<div class="row">
											<div class="col-sm-12">
												<!-- Basic Form Inputs card start -->
												<div class="card">
													<div class="card-block">
														<h4 class="sub-title">Dados do usuário</h4>
														<form class="form-material"
															action="<%=request.getContextPath()%>/ServletUsuarioController"
															method="post">
															<div class="form-group form-default">
																<input type="text" name="id" id="id"
																	class="form-control" readonly="readonly"
																	value="${modelLogin.id}"> <span
																	class="form-bar"></span> <label class="float-label">ID</label>
															</div>
															<div class="form-group form-default">
																<input type="text" name="name" id="name"
																	class="form-control" required="required"
																	value="${modelLogin.name}"> <span
																	class="form-bar"></span> <label class="float-label">Nome</label>
															</div>
															<div class="form-group form-default">
																<input type="email" name="email" id="email"
																	class="form-control" required="required"
																	value="${modelLogin.email}"> <span
																	class="form-bar"></span> <label class="float-label">E-mail</label>
															</div>
															<div class="form-group form-default">
																<input type="text" name="login" id="login"
																	class="form-control" required="required"
																	value="${modelLogin.login}"> <span
																	class="form-bar"></span> <label class="float-label">Login</label>
															</div>
															<div class="form-group form-default">
																<input type="password" name="senha" id="senha"
																	class="form-control" required="required"
																	value="${modelLogin.senha}"> <span
																	class="form-bar"></span> <label class="float-label">Senha</label>
																<i id="eye-icon" class="fa fa-eye"
																	onclick="togglePassword()"></i>
															</div>


															<button
																class="btn waves-effect waves-light btn-primary btn-outline-primary">
																<i class="icofont icofont-user-alt-3"></i>Enviar
															</button>
															<button
																class="btn waves-effect waves-light btn-inverse btn-outline-inverse">
																<i class="icofont icofont-exchange"></i>Editar
															</button>
															<button
																class="btn waves-effect waves-light btn-danger btn-outline-danger">
																<i class="icofont icofont-eye-alt"></i>Excluir
															</button>
														
														</form>

													</div>
												</div>
											</div>
										</div>
										<div class="msg-container">
										<span id="msg" class="msgs">${msg}</span>
										<span id="msgLoginUnico" class="msgs">${msgLoginUnico}</span>
										</div>
									</div>
									<!-- Page-body end -->
								</div>
								<div id="styleSelector"></div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>

	<style>
	
	.msg-container {
    position: relative; 
	}
	
	.msgs {
    position: absolute; 
    top: 0;
    left: 0;
    visibility: hidden; 
	}
	
	#msg {
			 color: green;
            font-size: 20px;
            padding: 10px;
            border-radius: 5px;
            margin-top: 20px;
            transition: opacity 3s ease-out; /
            opacity: 1;
	}
	
	#msgLoginUnico{
			color: red;
            font-size: 20px;
            padding: 10px;
            border-radius: 5px;
            margin-top: 20px;
            transition: opacity 3s ease-out; /
            opacity: 1;
	}
	</style>

	<jsp:include page="javascript.jsp"></jsp:include>
	<script>
		function togglePassword() {
			var senhaInput = document.getElementById("senha");
			var eyeIcon = document.getElementById("eye-icon");

			if (senhaInput.type === "password") {
				senhaInput.type = "text"; 
				eyeIcon.classList.remove("fa-eye");
				eyeIcon.classList.add("fa-eye-slash");
			} else {
				senhaInput.type = "password";
				eyeIcon.classList.remove("fa-eye-slash");
				eyeIcon.classList.add("fa-eye"); 
			}
		}
		
		 function showMessage() {
	            var msgElement = document.getElementById('msg');
	            msgElement.style.display = 'block';

	         
	            setTimeout(function() {
	                msgElement.style.opacity = 0; 
	            }, 5000);  
	        }

	        window.onload = showMessage;
	        
	        
	        function showMessageLoginUnico() {
	            var msgElement = document.getElementById('msgLoginUnico');
	            msgElement.style.display = 'block';

	         
	            setTimeout(function() {
	                msgElement.style.opacity = 0; 
	            }, 5000);  
	        }

	        window.onload = showMessageLoginUnico;
	        
	       
	        function exibirMensagem(tipo) {
	           
	            document.getElementById("msg").style.visibility = "hidden";
	            document.getElementById("msgLoginUnico").style.visibility = "hidden";

	            if (tipo === "sucesso") {
	               
	                document.getElementById("msg").style.visibility = "visible";
	            } else if (tipo === "erro") {
	                
	                document.getElementById("msgLoginUnico").style.visibility = "visible";
	            }
	        }

	     
	        <%
	            String msgLoginUnico = (String) request.getAttribute("msgLoginUnico");
	            String msg = (String) request.getAttribute("msg");

	            if (msgLoginUnico != null) {
	        %>
	                exibirMensagem("erro");
	        <%
	            } else if (msg != null) {
	        %>
	                exibirMensagem("sucesso");
	        <%
	            }
	        %>
	</script>
</body>

</html>
