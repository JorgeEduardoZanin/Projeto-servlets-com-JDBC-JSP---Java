<%@page import="entities.ModelLogin"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
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
																<input type="text" name="dataNascimento"
																	id="dataNascimento" class="form-control"
																	required="required"
																	 value="<fmt:formatDate value='${modelLogin.dataNascimento}' pattern='dd/MM/yyyy'/>"><span
																	class="form-bar"></span> <label class="float-label">Dat.
																	Nascimento</label>
															</div>
															
															<div class="form-group form-default form-static-label">
																<input type="text" name="salarioMensal"
																	id="salarioMensal" class="form-control"
																	required="required"
																	value="${salario}"> <span
																	class="form-bar"></span> <label class="float-label">Salario Mensal</label>
															</div>

															<div class="form-group form-default form-static-label">
																<input onblur="pesquisaCep();" type="text" name="cep"
																	id="cep" class="form-control" required="required"
																	value="${modelLogin.cep}"> <span
																	class="form-bar"></span> <label class="float-label">CEP</label>
															</div>

															<div class="form-group form-default form-static-label">
																<input type="text" name="localidade" id="localidade"
																	class="form-control" required="required"
																	value="${modelLogin.localidade}"> <span
																	class="form-bar"></span> <label class="float-label">Cidade</label>
															</div>

															<div class="form-group form-default form-static-label">
																<input type="text" name="logradouro" id="logradouro"
																	class="form-control" required="required"
																	value="${modelLogin.logradouro}"> <span
																	class="form-bar"></span> <label class="float-label">Rua</label>
															</div>

															<div class="form-group form-default form-static-label">
																<input type="text" name="bairro" id="bairro"
																	class="form-control" required="required"
																	value="${modelLogin.bairro}"> <span
																	class="form-bar"></span> <label class="float-label">Bairro</label>
															</div>

															<div class="form-group form-default form-static-label">
																<input type="text" name="UF" id="UF"
																	class="form-control" required="required"
																	value="${modelLogin.UF}"> <span
																	class="form-bar"></span> <label class="float-label">Estado</label>
															</div>

															<div class="form-group form-default form-static-label">
																<input type="text" name="numero" id="numero"
																	class="form-control" required="required"
																	value="${modelLogin.numero}"> <span
																	class="form-bar"></span> <label class="float-label">Numero</label>
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
																	<c:if
																		test="${modelLogin.fotoUser != '' && modelLogin.fotoUser != null}">
																		<a
																			href="<%=request.getContextPath()%>/ServletUsuarioController?acao=downloadFoto&id=${modelLogin.id}">
																			<img alt="Imagem User" src="${modelLogin.fotoUser}"
																			width="70px" accept="image/*" id="fotoembase64">
																		</a>
																	</c:if>
																	<c:if
																		test="${modelLogin.fotoUser == '' || modelLogin.fotoUser == null}">
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
															<button type="button" class="btn btn-outline-warning"
																onclick="limpaTelefonesModal()" data-toggle="modal"
																data-target="#modalTelefone">Telefones</button>
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

										<nav aria-label="Page navigation example">
											<ul class="pagination">

												<%
												int totalPaginas = (int) request.getAttribute("totalPaginas");

												for (int i = 0; i < totalPaginas; i++) {
													String url = request.getContextPath() + "/ServletUsuarioController?acao=paginacao&pagina=" + (i * 5);
													out.print("<li class=\"page-item\"><a class=\"page-link\" href=\"" + url + "\">" + (i + 1) + "</a></li>");
												}
												%>


												<li class="page-item"><a class="page-link" href="#">1</a></li>
											</ul>
										</nav>

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

					<nav aria-label="Page navigation example">
						<ul class="pagination" id="paginacaoUserAjaxModal">
						</ul>
					</nav>

					<span id="totalResultados"></span>
				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-secondary"
						data-dismiss="modal">Fechar</button>
				</div>
			</div>
		</div>
	</div>


	<div class="modal fade" id="modalTelefone" tabindex="-1" role="dialog"
		aria-labelledby="exampleModalLabel" aria-hidden="true">
		<div class="modal-dialog" role="document">
			<div class="modal-content">
				<div class="modal-header">
					<h5 class="modal-title" id="exampleModalLabel">Telefones</h5>
					<button type="button" class="close" data-dismiss="modal"
						aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
				</div>
				<div class="modal-body">
					<div class="input-group mb-3">
						<input type="text" class="form-control"
							placeholder="(XX) XXXX-XXXX ou (XX) 9XXXX-XXXX"
							aria-label="Telefone" aria-describedby="basic-addon2"
							id="novoTelefone">
						<div class="input-group-append">
							<button class="btn btn-outline-success" type="button" id="addTel"
								onclick="adicionarNovoTelefone();">Adicionar</button>
						</div>
					</div>

					<div style="height: 300px; overflow: scroll;">
						<table class="table" id="resultTelList">
							<thead>
								<tr>
									<th scope="col">ID</th>
									<th scope="col">Telefone</th>
									<th scope="col">Deletar</th>
								</tr>
							</thead>
							<tbody>

							</tbody>
						</table>
					</div>

					<span id="totalTelefone"></span>
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
	

    function initMoneyInput() {
      const valorInput = document.getElementById('salarioMensal');
      
      valorInput.addEventListener('input', function(e) {
        let valorNumerico = e.target.value.replace(/\D/g, '');
 
        if (valorNumerico === '') {
          e.target.value = '';
          return;
        }

        valorNumerico = parseFloat(valorNumerico) / 100;

        e.target.value = valorNumerico.toLocaleString('pt-BR', {
          style: 'currency',
          currency: 'BRL'
        });
      });
    }
    
    
    document.addEventListener('DOMContentLoaded', initMoneyInput);


	$("#salarioMensal").maskMoney({showSymbol:true, symbol:"R$ ", thousands:"."});

 
	
	$( function() {
		  
		  $("#dataNascimento").datepicker({
			    dateFormat: 'dd/mm/yy',
			    dayNames: ['Domingo','Segunda','Terça','Quarta','Quinta','Sexta','Sábado'],
			    dayNamesMin: ['D','S','T','Q','Q','S','S','D'],
			    dayNamesShort: ['Dom','Seg','Ter','Qua','Qui','Sex','Sáb','Dom'],
			    monthNames: ['Janeiro','Fevereiro','Março','Abril','Maio','Junho','Julho','Agosto','Setembro','Outubro','Novembro','Dezembro'],
			    monthNamesShort: ['Jan','Fev','Mar','Abr','Mai','Jun','Jul','Ago','Set','Out','Nov','Dez'],
			    nextText: 'Próximo',
			    prevText: 'Anterior'
			});
	} );
	
	var phoneInput = document.getElementById('novoTelefone');
	var myForm = document.forms.myForm;

    phoneInput.addEventListener('input', function (e) {
        var digits = e.target.value.replace(/\D/g, '');
        var formatted = '';

        if (digits.length === 0) {
          formatted = '';
        } else if (digits.length < 3) {
       
          formatted = '(' + digits;
        } else if (digits.length < 7) {
          
          formatted = '(' + digits.substring(0,2) + ') ' + digits.substring(2);
        } else if (digits.length <= 10) {
         
          formatted = '(' + digits.substring(0,2) + ') ' 
                    + digits.substring(2,6) + '-' + digits.substring(6);
        } else {
         
          formatted = '(' + digits.substring(0,2) + ') ' 
                    + digits.substring(2,3) + ' ' + digits.substring(3,7) 
                    + '-' + digits.substring(7,11);
        }
        e.target.value = formatted;
      });

	
		$('#numero').keypress(function(event){
			return /\d/.test(String.fromCharCode(event.keyCode));
		});
		
		
	
		function pesquisaCep(){
			var cep = $('#cep').val();
			
			$.getJSON("https://viacep.com.br/ws/"+ cep +"/json/?callback=?",function(dados){
				if (!("erro" in dados)) {
					$("#cep").val(dados.cep);
					$("#logradouro").val(dados.logradouro);
                    $("#bairro").val(dados.bairro);
                    $("#localidade").val(dados.localidade);
                    $("#UF").val(dados.uf);
				} 
				
				
			});
		}
	
		function visualizarImagem(fotoembase64, filefoto){
			
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
	
	
		function limpaTelefonesModal(){
			$('#resultTelList > tbody > tr').remove();
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
		
		function limparFormTel() {
			  document.getElementById("novoTelefone").value = ''
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
		
		function deletarTel(id) {
		    if(confirm('Deseja realmente excluir o numero de telefone?')){
		        $.ajax({
		            method: "get",
		            url: "<%=request.getContextPath()%>/ServletTelefoneController",
		            data: "idTelefone=" + id + "&acao=deletarTel",
		            success: function(response) {  
		            	alert("Telefone deletado com sucesso!");
		                buscarTelefone();
		            }
		        }).fail(function(xhr, status, errorThrown) {
		            alert("Erro ao deletar telefone por ID: " + xhr.responseText);
		        });
		    }
		}
		
		function adicionarNovoTelefone(){
			var idUser = document.getElementById("id").value;
			var novoTelefone = document.getElementById("novoTelefone").value;
			if(novoTelefone == null || novoTelefone == '' || novoTelefone.trim()=='' && idUser != null && idUser != '' && idUser.trim()!=''){
				alert("Digite um numero de telefone!");
				return;
			}
			
			if (!idUser || idUser.trim() === '') {
		        alert("Busque pelo usuario que voce deseja adicionar um novo telefone!");
		        return; 
		    }
			
			if(novoTelefone != null && novoTelefone != '' && novoTelefone.trim()!=''){
				 var urlAction = document.getElementById("formUser").action;
				 $.ajax({
			     	method: "post",
			        url: "<%=request.getContextPath()%>/ServletTelefoneController",
			        data: "novoTelefone=" + novoTelefone + "&idPai="+idUser,
			        success: function(response){
			        	alert("Telefone adicionado com sucesso");
			        	buscarTelefone();
			        	limparFormTel();
			        }
			}).fail(function(xhr, status, errorThrown) {
	            alert("Erro ao adicionar telefone: " + xhr.responseText);
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
			        success: function(response, textStatus, xhr) {
			   			var json = JSON.parse(response);
			   			
			   			$('#resultUserList > tbody > tr').remove();
			   			$('#paginacaoUserAjaxModal > li').remove();
			   			for(var i=0; i < json.length; i++){
			   				 $('#resultUserList > tbody').append('<tr> <td>'+ json[i].id+'</td> <td>'+json[i].name+'</td> <td>'+json[i].email+'</td> <td><button onclick="verNaTela('+json[i].id+')"type="button" class="btn btn-outline-info">Ver</button></td> </tr>'); 
			   			}
			   			
			   			document.getElementById('totalResultados').textContent = 'Resultados:' +json.length;
			   			
			   			var totalPagina = xhr.getResponseHeader("totalPaginas");
			   			
			   			for(var i = 0 ; i < totalPagina ; i++){
			   				var url = "nomeBusca="+nomeBusca +"&acao=buscarUserAjaxModal&pagina="+(i*5);
			   				$('#paginacaoUserAjaxModal').append('<li class="page-item"><a class="page-link" href="#" onclick="buscaUserPaginaAjax(\''+url+'\')">'+(i+1)+'</a></li>');
			   				
			   			}
			   			
			        	}
			        }).fail(function(xhr, status, errorThrown) {
			            alert("Erro ao buscar usuario: " + xhr.responseText);
			        });
			}
		}
		
		$(document).ready(function() {
		    $('#modalTelefone').on('shown.bs.modal', function () {
		    	buscarTelefone(); 
		    });
		});
		
		function buscarTelefone(){
			var idUser = document.getElementById("id").value;
			
			if (!idUser || idUser.trim() === '') {
		        alert("Busque por um usuário para ver os telefones disponíveis!");
		        return; 
		    }
			
			if(idUser != null && idUser != '' && idUser.trim()!=''){
			var urlAction = document.getElementById("formUser").action;
			$.ajax({
				method:"get",
				url:"<%=request.getContextPath()%>/ServletTelefoneController",
				data: "idUser=" + idUser + "&acao=listarTelefone",
				success: function(response) {
					var jsonTel = JSON.parse(response);
							
					$('#resultTelList > tbody > tr').remove();
		   			$('#paginacaoUserAjaxModal > li').remove();			
		   			for(var i=0; i < jsonTel.length; i++){
		   			 $('#resultTelList > tbody').append('<tr> <td>'+ jsonTel[i].id+'</td> <td>'+ jsonTel[i].numero+'</td> <td><button onclick="deletarTel('+jsonTel[i].id+')" type="button" class="btn btn-outline-info">Excluir</button></td> </tr>'); 
		   			}
		   			
		   			document.getElementById('totalResultados').textContent = 'Resultados:' +jsonTel;
		   			
				}
			
			}).fail(function(xhr, status, errorThrown){
				 alert("Erro" + xhr.responseText);
				
			});
			}
		}
		
		function buscaUserPaginaAjax(url){
			var urlAction = document.getElementById("formUser").action;
			var nomeBusca = document.getElementById("nomeBusca").value;
			$.ajax({
		     	method: "get",
		     	url: urlAction,
		        data: url,
		        success: function(response, textStatus, xhr) {
		   			var json = JSON.parse(response);
		   			
		   			$('#resultUserList > tbody > tr').remove();
		   			$('#paginacaoUserAjaxModal > li').remove();
		   			for(var i=0; i < json.length; i++){
		   				 $('#resultUserList > tbody').append('<tr> <td>'+ json[i].id+'</td> <td>'+json[i].name+'</td> <td>'+json[i].email+'</td> <td><button onclick="verNaTela('+json[i].id+')"type="button" class="btn btn-outline-info">Ver</button></td> </tr>'); 
		   			}
		   			
		   			document.getElementById('totalResultados').textContent = 'Resultados:' +json.length;
		   			
		   			var totalPagina = xhr.getResponseHeader("totalPaginas");
		   			
		   			for(var i = 0 ; i < totalPagina ; i++){
		   			 	
		   				var url = "nomeBusca="+nomeBusca +"&acao=buscarUserAjaxModal&pagina="+(i*5);
		   				$('#paginacaoUserAjaxModal').append('<li class="page-item"><a class="page-link" href="#" onclick="buscaUserPaginaAjax(\''+url+'\')">'+(i+1)+'</a></li>');
		   				
		   			}
		   			
		        	}
		        }).fail(function(xhr, status, errorThrown) {
		            alert("Erro ao buscar usuario: " + xhr.responseText);
		        });
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