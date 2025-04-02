<%@page import="entities.ModelLogin"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html lang="en">

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
										<div class="row">
											<div class="col-sm-12">
												<!-- Basic Form Inputs card start -->
												<div class="card">
													<div class="card-block">
														<h4 class="sub-title">Dados do usuário</h4>
														<form class="form-material"
															action="<%=request.getContextPath()%>/ServletRelatorioController"
															method="get" id="formUser">

															<div class="form-row">
																<div class="form-group col-md-6">
																	<label>Data Inicial</label> <input type="text"
																		class="form-control" id="dataInicial"
																		name="dataInicial" value="${dataInicial}">
																</div>
																<div class="form-group col-md-6">
																	<label for="inputEmail4">Data Final</label> <input
																		type="text" class="form-control" id="dataFinal"
																		name="dataFinal" value="${dataFinal}">
																</div>
															</div>
															<input type="hidden" name="acao" value="criarRelatorio">

															<button type="submit" class="btn btn-outline-success">Imprimir
																relatório</button>
														</form>
													</div>
												</div>
											</div>

										</div>
										<div style="height: 300px; overflow: scroll;">
											<table class="table" id="listaUsers">
												<thead>
													<tr>
														<th scope="col">Nome</th>
														<th scope="col">Salario Mensal</th>
														<th scope="col">Cargo</th>
														<th scope="col">Dat. Nascimento</th>
														<th scope="col">E-mail</th>
														<th scope="col">Numeros de telefone</th>

													</tr>
												</thead>
												<tbody>
													<c:forEach items="${listaUsers}" var="lu">
														<tr>
																
															<td><c:out value="${lu.name}"></c:out></td>
															<td><c:out value="${lu.salarioMensal}"></c:out></td>
															<td><c:out value="${lu.cargo}"></c:out></td>
															<td class="date-cell"><c:out value="${lu.dataNascimento}" /></td>
															<td><c:out value="${lu.email}"></c:out></td>
															<td>
																 <button type="button" class="btn btn-outline-warning"
                    data-userid="${lu.id}"
                    onclick="abreModalTelefone(this)"
                    data-toggle="modal"
                    data-target="#modalTelefone">
                Telefones
            </button>
															</td>

														</tr>

													</c:forEach>
												</tbody>
											</table>
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

	<div class="modal fade" id="modalTelefone" tabindex="-1" role="dialog"
		aria-labelledby="exampleModalLabel" aria-hidden="true">
		<div class="modal-dialog" role="document" style="max-width: 450px;">
			<div class="modal-content">
				<div class="modal-header">
					<h5 class="modal-title" id="exampleModalLabel">Telefones</h5>
					<button type="button" class="close" data-dismiss="modal"
						aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
				</div>
				<div class="modal-body">
					<div style="height: 300px; overflow: scroll;">
						<table class="table" id="resultTelList">
							<thead>
								<tr>
									<th scope="col">ID</th>
									<th scope="col">Telefone</th>
									
								</tr>
								
								
							</thead>
							<tbody>
							
							</tbody>
						</table>
					</div>

					<span id="telUnico"></span>
				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-secondary"
						data-dismiss="modal">Fechar</button>
				</div>
			</div>
		</div>
	</div>


	<jsp:include page="javascript.jsp"></jsp:include>
	<script>
	
	function limpaTelefonesModal(){
		$('#resultTelList > tbody > tr').remove();
	}
	
	function abreModalTelefone(button) {
		 $('#modalTelefone').modal('show');
		limpaTelefonesModal();
	    var idUser = button.getAttribute("data-userid");
	    if(idUser != null && idUser != '' && idUser.trim()!=''){
	    	$.ajax({
	    		method:"get",
	    		url:"<%=request.getContextPath()%>/ServletTelefoneController",
	    		data:"idUser="+idUser+"&acao=listarTelefone",
	    		success: function(response) {    					
					var jsonTel = JSON.parse(response);
									
					$('#resultTelList > tbody > tr').remove();
		   			$('#paginacaoUserAjaxModal > li').remove();			
		   			for(var i=0; i < jsonTel.length; i++){
		   			 $('#resultTelList > tbody').append('<tr> <td>'+ jsonTel[i].id+'</td> <td>'+ jsonTel[i].numero+'</td> </tr>'); 
		   			}
		   			
				}
	    	}).fail(function(xhr, status, errorThrown){
	    		setTimeout(function () {
	                alert("Erro ao carregar os dados: " + xhr.responseText);
	            }, 500);
				
			});
	    }
	   
	}
	
		window.addEventListener('DOMContentLoaded', function() {

			var dateCells = document.querySelectorAll('.date-cell');

			dateCells.forEach(function(cell) {
				var dateStr = cell.textContent.trim();

				if (dateStr) {

					var parts = dateStr.split("-");
					if (parts.length === 3) {

						var formattedDate = parts[2] + "/" + parts[1] + "/"
								+ parts[0];
						cell.textContent = formattedDate;
					}
				}
			});
		});

		$(function() {

			$("#dataInicial")
					.datepicker(
							{
								dateFormat : 'dd/mm/yy',
								dayNames : [ 'Domingo', 'Segunda', 'Terça',
										'Quarta', 'Quinta', 'Sexta', 'Sábado' ],
								dayNamesMin : [ 'D', 'S', 'T', 'Q', 'Q', 'S',
										'S', 'D' ],
								dayNamesShort : [ 'Dom', 'Seg', 'Ter', 'Qua',
										'Qui', 'Sex', 'Sáb', 'Dom' ],
								monthNames : [ 'Janeiro', 'Fevereiro', 'Março',
										'Abril', 'Maio', 'Junho', 'Julho',
										'Agosto', 'Setembro', 'Outubro',
										'Novembro', 'Dezembro' ],
								monthNamesShort : [ 'Jan', 'Fev', 'Mar', 'Abr',
										'Mai', 'Jun', 'Jul', 'Ago', 'Set',
										'Out', 'Nov', 'Dez' ],
								nextText : 'Próximo',
								prevText : 'Anterior'
							});
		});

		$(function() {

			$("#dataFinal")
					.datepicker(
							{
								dateFormat : 'dd/mm/yy',
								dayNames : [ 'Domingo', 'Segunda', 'Terça',
										'Quarta', 'Quinta', 'Sexta', 'Sábado' ],
								dayNamesMin : [ 'D', 'S', 'T', 'Q', 'Q', 'S',
										'S', 'D' ],
								dayNamesShort : [ 'Dom', 'Seg', 'Ter', 'Qua',
										'Qui', 'Sex', 'Sáb', 'Dom' ],
								monthNames : [ 'Janeiro', 'Fevereiro', 'Março',
										'Abril', 'Maio', 'Junho', 'Julho',
										'Agosto', 'Setembro', 'Outubro',
										'Novembro', 'Dezembro' ],
								monthNamesShort : [ 'Jan', 'Fev', 'Mar', 'Abr',
										'Mai', 'Jun', 'Jul', 'Ago', 'Set',
										'Out', 'Nov', 'Dez' ],
								nextText : 'Próximo',
								prevText : 'Anterior'
							});
		});

		document.getElementById('dataFinal').addEventListener(
				'input',
				function(e) {
					let input = e.target.value;

					let digits = input.replace(/\D/g, '');

					if (digits.length > 8) {
						digits = digits.substring(0, 8);
					}

					if (digits.length > 4) {

						digits = digits.substring(0, 2) + '/'
								+ digits.substring(2, 4) + '/'
								+ digits.substring(4);
					} else if (digits.length > 2) {

						digits = digits.substring(0, 2) + '/'
								+ digits.substring(2);
					}

					e.target.value = digits;
				});

		document.getElementById('dataInicial').addEventListener(
				'input',
				function(e) {
					let input = e.target.value;

					let digits = input.replace(/\D/g, '');

					if (digits.length > 8) {
						digits = digits.substring(0, 8);
					}

					if (digits.length > 4) {

						digits = digits.substring(0, 2) + '/'
								+ digits.substring(2, 4) + '/'
								+ digits.substring(4);
					} else if (digits.length > 2) {

						digits = digits.substring(0, 2) + '/'
								+ digits.substring(2);
					}

					e.target.value = digits;
				});
	</script>
</body>

</html>
