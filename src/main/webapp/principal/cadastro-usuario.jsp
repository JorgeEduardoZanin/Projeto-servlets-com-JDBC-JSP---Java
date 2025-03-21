<%@page import="entities.ModelLogin"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
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

										<h1>Cadastro de usu�rios</h1>
										<div class="row">
											<div class="col-sm-12">
												<!-- Basic Form Inputs card start -->
												<div class="card">
													<div class="card-block">
														<h4 class="sub-title">Dados do usu�rio</h4>
														<form class="form-material" enctype="multipart/form-data"
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
																<select class="form-control"
																	arial-label="Default select example" name="cargo">
																	<option value="" disabled selected>Cargo</option>
																	<option value="Administrador"
																		<%ModelLogin modelLogin = (ModelLogin) request.getAttribute("modelLogin");

if (modelLogin != null && modelLogin.getCargo().equals("Administrador")) {
	out.print("");
	out.print("selected=\"selected\"");
	out.print("");
}%>>Administrador</option>
																	<option value="Secretaria"
																		<%modelLogin = (ModelLogin) request.getAttribute("modelLogin");

if (modelLogin != null && modelLogin.getCargo().equals("Secretaria")) {
	out.print("");
	out.print("selected=\"selected\"");
	out.print("");
}%>>Secretaria</option>
																	<option value="Financeiro"
																		<%modelLogin = (ModelLogin) request.getAttribute("modelLogin");

if (modelLogin != null && modelLogin.getCargo().equals("Financeiro")) {
	out.print("");
	out.print("selected=\"selected\"");
	out.print("");
}%>>Financeiro</option>
																</select>
															</div>

															<div class="form-group form-default form-static-label">
																<input type="email" name="email" id="email"
																	class="form-control" required="required"
																	value="${modelLogin.email}"> <span
																	class="form-bar"></span> <label class="float-label">E-mail</label>
															</div>

															<div class="form-group form-default form-static-label">
																<input type="radio" name="sexo" value="Masculino"
																	<%modelLogin = (ModelLogin) request.getAttribute("modelLogin");

if (modelLogin != null && modelLogin.getSexo().equals("Masculino")) {
	out.print("");
	out.print("checked=\"checked\"");
	out.print("");
}%>>
																Masculino</> <input type="radio" name="sexo"
																	value="Feminino"
																	<%modelLogin = (ModelLogin) request.getAttribute("modelLogin");

if (modelLogin != null && modelLogin.getSexo().equals("Feminino")) {
	out.print("");
	out.print("checked=\"checked\"");
	out.print("");
}%>>Feminino</>
															</div>


															<div class="form-group form-default form-static-label">
																<input type="text" name="login" id="login"
																	class="form-control" required="required"
																	value="${modelLogin.login}"> <span
																	class="form-bar"></span> <label class="float-label">Login</label>
															</div>

															<div
																class="form-group form-default form-static-label input-group mb-3">

																<div class="input-group-prepend">
																	<c:if test="${modelLogin.fotoUser != '' && modelLogin.fotoUser != null}">
																		<img alt="Imagem User" src="${modelLogin.fotoUser}"
																			width="70px" accept="image/*" id="fotoembase64">
																	</c:if>
																	<c:if test="${modelLogin.fotoUser == '' || modelLogin.fotoUser == null}">
																		<img alt="Imagem User" src="assets/images/faq_man.png"
																			width="70px" accept="image/*" id="fotoembase64">
																	</c:if>
																	
																	
																</div>
																<input type="file"
																	class="form-control-file imagem-input" name="filefoto"
																	id="filefoto"
																	onchange="visualizarImagem('fotoembase64','filefoto')">
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

										<div style="height: 300px; overflow: scroll;">
											<table class="table" id="resultUserListView">
												<thead>
													<tr>
														<th scope="col">ID</th>
														<th scope="col">Name</th>
														<th scope="col">Email</th>
														<th scope="col">Ver</th>

													</tr>
												</thead>
												<tbody>
													<c:forEach items="${modelLogins}" var="ml">
														<tr>
															<td><c:out value="${ml.id}"></c:out></td>
															<td><c:out value="${ml.name}"></c:out></td>
															<td><c:out value="${ml.email}"></c:out></td>
															<td><button onclick="verNaTela('${ml.id}')"
																	type="button" class="btn btn-outline-info">Ver</button></td>

														</tr>

													</c:forEach>
												</tbody>
											</table>
										</div>

									</div>

								</div>
								<div id="styleSelector"></div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>


	<div id="modalMsg" class="modals">
		<div class="modal-content">
			<p class="modal-text msgSucesso" id="modalMsgText"></p>
			<button onclick="closeModal('modalMsg')" class="modalButton">OK</button>
		</div>
	</div>


	<div id="modalMsgLogin" class="modals">
		<div class="modal-content">
			<p class="modal-text msgErro" id="modalMsgLoginText"></p>
			<button onclick="closeModal('modalMsgLogin')" class="modalButton">OK</button>
		</div>
	</div>


	<div id="modalMsgDelAjax" class="modals">
		<div class="modal-content">
			<p class="modal-text msgErro" id="modalMsgDelAjaxText"></p>
			<button onclick="closeModal('modalMsgDelAjax')" class="modalButton">OK</button>
		</div>
	</div>

	<div class="modal fade" id="modalUser" tabindex="-1" role="dialog"
		aria-labelledby="exampleModalLabel" aria-hidden="true">
		<div class="modal-dialog" role="document">
			<div class="modal-content">
				<div class="modal-header">
					<h5 class="modal-title" id="exampleModalLabel">Buscar usu�rio</h5>
					<button type="button" class="close" data-dismiss="modal"
						aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
				</div>
				<div class="modal-body">

					<div class="input-group mb-3">
						<input type="text" class="form-control" placeholder="Nome"
							aria-label="Nome" aria-describedby="basic-addon2" id="nomeBusca">
						<div class="input-group-append">
							<button class="btn btn-outline-success" type="button"
								onclick="buscarUser()">Buscar</button>
						</div>
					</div>
					<div style="height: 300px; overflow: scroll;">
						<table class="table" id="resultUserList">
							<thead>
								<tr>
									<th scope="col">ID</th>
									<th scope="col">Name</th>
									<th scope="col">Email</th>
									<th scope="col">Ver</th>
								</tr>
							</thead>
							<tbody>

							</tbody>
						</table>
					</div>
					<span id="totalResultados"></span>
				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-secondary"
						data-dismiss="modal">Fechar</button>
				</div>
			</div>
		</div>
	</div>
	<style>
.modals {
	display: none;
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

.imagem-input {
	margin: 20px;
}
</style>

	<jsp:include page="javascript.jsp"></jsp:include>

	<script>
	
		function visualizarImagem(fotoembase64, filefoto){
			
			alert("teste");
			var preview = document.getElementById(fotoembase64);
			var fileUser = document.getElementById(filefoto).files[0];
			var reader = new FileReader();
			
			reader.onloadend = function(){
				preview.src = reader.result;//carrega a imagem na tela	
			}
			
			if(fileUser){
				reader.readAsDataURL(fileUser);//preview da imagem
				 
			}else{
				preview.src='';
			}
		}
	
	
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
		            alert("Erro ao deletar usu�rio por ID: " + xhr.responseText);
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
			   			var json = JSON.parse(response);
			   			
			   			$('#resultUserList > tbody > tr').remove();
			   			
			   			for(var i=0; i < json.length; i++){
			   				 $('#resultUserList > tbody').append('<tr> <td>'+ json[i].id+'</td> <td>'+json[i].name+'</td> <td>'+json[i].email+'</td> <td><button onclick="verNaTela('+json[i].id+')"type="button" class="btn btn-outline-info">Ver</button></td> </tr>'); 
			   			}
			   			
			   			document.getElementById('totalResultados').textContent = 'Resultados:' +json.length;
			        	}
			        }).fail(function(xhr, status, errorThrown) {
			            alert("Erro ao buscar usuario: " + xhr.responseText);
			        });
			}
		}
		
		function verNaTela(id){
			 
			var urlAction = document.getElementById("formUser").action;
			
			window.location.href =urlAction + '?acao=verNaTela&id='+id;
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
