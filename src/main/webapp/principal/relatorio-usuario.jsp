<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>

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
															action="<%=request.getContextPath()%>/ServletRelatorioController?acao=criarForm"
															method="post" id="formUser">

															<div class="form-row">
																<div class="form-group col-md-6">
																	<label >Data Inicial</label> <input 
																		type="text" class="form-control" id="dataInicial">
																</div>
																<div class="form-group col-md-6">
																	<label for="inputEmail4">Data Final</label> <input
																		type="text" class="form-control"
																		id="dataFinal">
																</div>
															</div>
															<div class="form-group">
																<label for="inputAddress">Address</label> <input
																	type="text" class="form-control" id="inputAddress"
																	placeholder="1234 Main St">
															</div>
															<div class="form-group">
																<label for="inputAddress2">Address 2</label> <input
																	type="text" class="form-control" id="inputAddress2"
																	placeholder="Apartment, studio, or floor">
															</div>
															<div class="form-row">
																<div class="form-group col-md-6">
																	<label for="inputCity">City</label> <input type="text"
																		class="form-control" id="inputCity">
																</div>
																<div class="form-group col-md-4">
																	<label for="inputState">State</label> <select
																		id="inputState" class="form-control">
																		<option selected>Choose...</option>
																		<option>...</option>
																	</select>
																</div>
																<div class="form-group col-md-2">
																	<label for="inputZip">Zip</label> <input type="text"
																		class="form-control" id="inputZip">
																</div>
															</div>

															<button type="button" class="btn btn-outline-success">Imprimir relatório</button>
														</form>
													</div>
												</div>
											</div>

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


	<jsp:include page="javascript.jsp"></jsp:include>
	<script>
	
	$( function() {
		  
		  $("#dataInicial").datepicker({
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
	
	$( function() {
		  
		  $("#dataFinal").datepicker({
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
	
	document.getElementById('dataFinal').addEventListener('input', function(e) {
		  let input = e.target.value;
		  
		  
		  let digits = input.replace(/\D/g, '');
		  
		
		  if(digits.length > 8) {
		    digits = digits.substring(0,8);
		  }
		  
		 
		  if(digits.length > 4) {
		  
		    digits = digits.substring(0,2) + '/' + digits.substring(2,4) + '/' + digits.substring(4);
		  } else if(digits.length > 2) {
		
		    digits = digits.substring(0,2) + '/' + digits.substring(2);
		  }
		  
		
		  e.target.value = digits;
		});
	
	
	document.getElementById('dataInicial').addEventListener('input', function(e) {
		  let input = e.target.value;
		  
		
		  let digits = input.replace(/\D/g, '');
		  
		
		  if(digits.length > 8) {
		    digits = digits.substring(0,8);
		  }
		  
		
		  if(digits.length > 4) {
		   
		    digits = digits.substring(0,2) + '/' + digits.substring(2,4) + '/' + digits.substring(4);
		  } else if(digits.length > 2) {
		  
		    digits = digits.substring(0,2) + '/' + digits.substring(2);
		  }
		  
		
		  e.target.value = digits;
		});
	
	</script>
</body>

</html>
