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
															method="post" id="formUser">

															<input type="hidden" name="acao" id="acao" value="">
															<div class="form-group form-default form-static-label">
																<input type="text" name="id" id="id"
																	class="form-control" readonly="readonly"
																	value="${modelLogin.id}"> <span
																	class="form-bar"></span> <label class="float-label">ID</label>
															</div>
															<div class="form-group form-default form-static-label">
																<input type="text" name="name" id="name"
																	class="form-control" required="required"
																	value="${modelLogin.name}"> <span
																	class="form-bar"></span> <label class="float-label">Nome</label>
															</div>
															<div class="form-group form-default form-static-label">
																<input type="email" name="email" id="email"
																	class="form-control" required="required"
																	value="${modelLogin.email}"> <span
																	class="form-bar"></span> <label class="float-label">E-mail</label>
															</div>
															<div class="form-group form-default form-static-label">
																<input type="text" name="login" id="login"
																	class="form-control" required="required"
																	value="${modelLogin.login}"> <span
																	class="form-bar"></span> <label class="float-label">Login</label>
															</div>
															<div class="form-group form-default form-static-label">
																<input type="password" name="senha" id="senha"
																	class="form-control" required="required"
																	value="${modelLogin.senha}"> <span
																	class="form-bar"></span> <label class="float-label">Senha</label>
																<i id="eye-icon" class="fa fa-eye"
																	onclick="togglePassword()"></i>
															</div>

															<button
																class="btn waves-effect waves-light btn-primary btn-outline-primary"
																type="button" onclick="limparForm()">
																<i class="icofont icofont-user-alt-3"></i>Limpar
															</button>
															<button
																class="btn waves-effect waves-light btn-inverse btn-outline-inverse">
																<i class="icofont icofont-exchange"></i>Salvar
															</button>
															<button
																class="btn waves-effect waves-light btn-danger btn-outline-danger"
																type="button" onclick="deletarAjax()">
																<i class="icofont icofont-eye-alt"></i>Excluir
															</button>
															<button type="button" class="btn btn-outline-success"
																data-toggle="modal" data-target="#modalUser">Buscar</button>
														</form>
													</div>
												</div>
											</div>
										</div>
										<!-- Removemos o container de mensagens baseado em span -->
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

	<!-- Modal para Mensagem de Sucesso -->
	<div id="modalMsg" class="modals">
		<div class="modal-content">
			<p class="modal-text msgSucesso" id="modalMsgText"></p>
			<button onclick="closeModal('modalMsg')" class="modalButton">OK</button>
		</div>
	</div>

	<!-- Modal para Mensagem de Erro (Login Único) -->
	<div id="modalMsgLogin" class="modals">
		<div class="modal-content">
			<p class="modal-text msgErro" id="modalMsgLoginText"></p>
			<button onclick="closeModal('modalMsgLogin')" class="modalButton">OK</button>
		</div>
	</div>

	<!-- Modal para Mensagem de Exclusão via Ajax -->
	<div id="modalMsgDelAjax" class="modals">
		<div class="modal-content">
			<p class="modal-text msgErro" id="modalMsgDelAjaxText"></p>
			<button onclick="closeModal('modalMsgDelAjax')" class="modalButton">OK</button>
		</div>
	</div>
	<!-- Modal -->
	<div class="modal fade" id="modalUser" tabindex="-1" role="dialog"
		aria-labelledby="exampleModalLabel" aria-hidden="true">
		<div class="modal-dialog" role="document">
			<div class="modal-content">
				<div class="modal-header">
					<h5 class="modal-title" id="exampleModalLabel">Buscar usuário</h5>
					<button type="button" class="close" data-dismiss="modal"
						aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
				</div>
				<div class="modal-body">

					<div class="input-group mb-3">
						<input type="text" class="form-control" placeholder="Nome"
							aria-label="Nome" aria-describedby="basic-addon2" id="nomeBusca">
						<div class="input-group-append" >
							<button class="btn btn-outline-success" type="button"
								onclick="buscarUser()">Buscar</button>
						</div>
					</div>

					<table class="table">
						<thead>
							<tr>
								<th scope="col">ID</th>
								<th scope="col">Name</th>
								<th scope="col">Username</th>
								<th scope="col">Email</th>
							</tr>
						</thead>
						<tbody>

						</tbody>
					</table>

				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-secondary"
						data-dismiss="modal">Fechar</button>
				</div>
			</div>
		</div>
	</div>
	<style>
/* Estilos para os modais */
.modals {
	display: none; /* Escondido por padrão */
	position: fixed;
	z-index: 1000;
	left: 0;
	top: 0;
	width: 100%;
	height: 100%;
	overflow: auto;
	background-color: rgba(0, 0, 0, 0.5);
}

.modal-text {
	font-size: 17px;
}

.modal-content {
	background-color: #fefefe;
	margin: 15% auto;
	padding: 20px;
	border: 1px solid #888;
	width: 80%;
	max-width: 400px;
	text-align: center;
}

.modalButton {
	margin-top: 20px;
	padding: 10px 20px;
}

.msgErro {
	color: red;
}

.msgSucesso {
	color: green;
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
		
		function showModal(modalId, messageText) {
			var modal = document.getElementById(modalId);
			var modalText = modal.querySelector('.modal-text');
			modalText.textContent = messageText;
			modal.style.display = 'block';
		}
		
		function closeModal(modalId) {
			document.getElementById(modalId).style.display = 'none';
		}
		
		function limparForm() {
			var elementos = document.getElementById("formUser").elements;
			for (var i = 0; i < elementos.length; i++){
				elementos[i].value = '';
			}
		}
		
		function deletar(){
			if(confirm('Deseja realmente excluir os dados?')){
				document.getElementById("formUser").method = 'get';
				document.getElementById("acao").value = "deletar";
				document.getElementById("formUser").submit();
			}
		}
		
		function deletarAjax() {
		    if(confirm('Deseja realmente excluir os dados?')){
		        var urlAction = document.getElementById("formUser").action;
		        var idUser = document.getElementById("id").value;
		        $.ajax({
		            method: "get",
		            url: urlAction,
		            data: "id=" + idUser + "&acao=deletarajax",
		            success: function(response) {
		                limparForm();
		                showModal('modalMsgDelAjax', response);
		            }
		        }).fail(function(xhr, status, errorThrown) {
		            alert("Erro ao deletar usuário por ID: " + xhr.responseText);
		        });
		    }
		}
		
		function buscarUser(){
			var nomeBusca = document.getElementById("nomeBusca").value;
			
			
			if(nomeBusca != null && nomeBusca != '' && nomeBusca.trim()!=''){
				 var urlAction = document.getElementById("formUser").action;
				 $.ajax({
			     	method: "get",
			        url: urlAction,
			        data: "nomeBusca=" + nomeBusca + "&acao=buscarUserAjax",
			        success: function(response) {
			   			limparForm();
			        	}
			        }).fail(function(xhr, status, errorThrown) {
			            alert("Erro ao buscar usuario: " + xhr.responseText);
			        });
			}
		}
		
		function exibirMensagem(tipo, mensagem) {
			closeModal('modalMsg');
			closeModal('modalMsgLogin');
			closeModal('modalMsgDelAjax');
			
			if (tipo === "sucesso") {
				showModal('modalMsg', mensagem);
			} else if (tipo === "erro") {
				showModal('modalMsgLogin', mensagem);
			}
		}
		
		<%String msgLoginUnico = (String) request.getAttribute("msgLoginUnico");
String msg = (String) request.getAttribute("msg");
String msgDelAjax = (String) request.getAttribute("msgDelAjax");

if (msgLoginUnico != null) {%>
				exibirMensagem("erro", "<%=msgLoginUnico%>");
		<%} else if (msg != null) {%>
				exibirMensagem("sucesso", "<%=msg%>");
		<%} else if (msgDelAjax != null) {%>
				exibirMensagem("erro", "<%=msgDelAjax%>
		");
	<%}%>
		
	</script>
</body>
</html>
