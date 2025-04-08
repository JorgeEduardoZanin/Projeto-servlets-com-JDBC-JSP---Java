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
									<h1 style="text-align: left; margin-top: 10px; margin-left: 15px;">Página
									Inicial</h1>
										<div class="row"></div>
										
									
											<div class="col-sm-12">
												<!-- Basic Form Inputs card start -->
												<div class="card">
											<div class="card-block">
												<h4 class="sub-title">Dados do usuário</h4>
											
											<canvas id="myChart"></canvas>
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

	<script type="text/javascript">
	
		
		  $(document).ready(function(){
		   
		    $.ajax({
		      url: "<%= request.getContextPath()%>/ServletGraficoController",
		      method: 'get', 
		      data: "acao=criarGrafico",
		      success: function(response, textStatus, xhr) {
		    	 
		   		var json = JSON.parse(response);
 
		    	const labels = [ 'Administrador', 'Financeiro', 'Secretaria',];
		  		const data = {
		  			labels : labels,
		  			datasets : [ {
		  				label : 'Média de salários por cargo',
		  				backgroundColor : 'rgb(255, 99, 132)',
		  				borderColor : 'rgb(255, 99, 132)',
		  				data : [json.mediaAdministrador,  json.mediaFinanceiro , json.mediaSecretaria],
		  			} ]
		  		};

		  		const config = {
		  			type : 'line',
		  			data : data,
		  			options : {}
		  		};

		  		var myChart = new Chart(document.getElementById('myChart'), config);
		      },
		      error: function(error) {
		        console.error("Erro na requisição AJAX:", error);
		      }
		    });
		  });
		
	
		
	</script>
</body>

</html>
