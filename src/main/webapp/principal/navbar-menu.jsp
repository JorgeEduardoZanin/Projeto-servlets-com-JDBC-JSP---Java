<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<nav class="pcoded-navbar">
	<div class="sidebar_toggle">
		<a href="#"><i class="icon-close icons"></i></a>
	</div>
	<div class="pcoded-inner-navbar main-menu">
		<div class="">
			<div class="main-menu-header">




				<c:if test="${fotoUser != '' && fotoUser != null}">


					<img alt="User-Profile-Image" src="${fotoUser}" class="img-80 img-radius" >

				</c:if>
				<c:if test="${fotoUser == '' || fotoUser == null}">
					<img alt="User-Profile-Image"
						src="<%=request.getContextPath()%>/assets/images/avatar-4.jpg" class="img-80 img-radius">
				</c:if>


				<div class="user-details">
					<span id="more-details"><%=session.getAttribute("usuario")%><i
						class="fa fa-caret-down"></i></span>
				</div>
			</div>

			<div class="main-menu-content">
				<ul>
					<li class="more-details"><a href="user-profile.html"><i
							class="ti-user"></i>View Profile</a> <a href="#!"><i
							class="ti-settings"></i>Settings</a> <a
						href="ServletLogin?acao=logout"><i
							class="ti-layout-sidebar-left"></i>Logout</a></li>
				</ul>
			</div>
		</div>
		<div class="p-15 p-b-0"></div>
		<ul class="pcoded-item pcoded-left-item">
			<li class="active"><a
				href="<%=request.getContextPath()%>/principal/principal.jsp"
				class="waves-effect waves-dark"> <span class="pcoded-micon"><i
						class="ti-home"></i><b>D</b></span> <span class="pcoded-mtext"
					data-i18n="nav.dash.main">Página Inicial</span> <span
					class="pcoded-mcaret"></span>
			</a></li>
			<c:if test="${cargo == 'Administrador'}">
			<li class="pcoded-hasmenu"><a href="javascript:void(0)"
				class="waves-effect waves-dark"> <span class="pcoded-micon"><i
						class="ti-layout-grid2-alt"></i></span> <span class="pcoded-mtext"
					data-i18n="nav.basic-components.main">Cadastros</span> <span
					class="pcoded-mcaret"></span>
			</a>
				<ul class="pcoded-submenu">
					
						<li class=" "><a
							href="<%=request.getContextPath()%>/ServletUsuarioController?acao=listaUsers"
							class="waves-effect waves-dark"> <span class="pcoded-micon"><i
									class="ti-angle-right"></i></span> <span class="pcoded-mtext"
								data-i18n="nav.basic-components.alert">Cadastro</span> <span
								class="pcoded-mcaret"></span>
						</a></li>
					</c:if>


				</ul></li>
		</ul>

		<div class="pcoded-navigation-label" data-i18n="nav.category.forms">Relatórios</div>
		<ul class="pcoded-item pcoded-left-item">
			<li><a href="<%=request.getContextPath()%>/principal/relatorio-usuario.jsp" class="waves-effect waves-dark"> <span
					class="pcoded-micon"><i class="ti-layers"></i><b>FC</b></span> <span
					class="pcoded-mtext" data-i18n="nav.form-components.main">
						Usuário</span> <span class="pcoded-mcaret"></span>
			</a></li>
		</ul>



	</div>
</nav>