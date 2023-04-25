<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>

<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!-- para dar formato a las fechas -->
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>

<!DOCTYPE html>
<html>
<head>

<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Principal</title>
<script src="https://code.jquery.com/jquery-3.6.0.js"></script>
<script src="https://cdn.jsdelivr.net/npm/sweetalert2@11"></script>

<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.3.1/dist/css/bootstrap.min.css" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
<link rel="stylesheet" href="Css/Estilo.css">

<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/js/bootstrap.min.js"
	integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl"
	crossorigin="anonymous"></script>

<link rel="stylesheet" href="css/Estilo.css">

</head>
<body>

	<%
		//recuperamos el mensaje del archivo validar
		String nombreDeUsuario = (String) request.getAttribute("usuario");
		String nomUsu = (String) request.getAttribute("nombre");
		String apeUsu = (String) request.getAttribute("apellido");

		String usuario_logeado = "";
		String usuario_nombre = "";
		String usuario_apellido = "";
		//aplicamos una condicion...
		if (nombreDeUsuario != null)
			usuario_logeado = nombreDeUsuario;
		usuario_nombre = nomUsu;
		usuario_apellido = apeUsu;
	%>


<nav class="navbar navbar-expand-lg navbar-light bg-primary bg-custom">
	<div class="collapse navbar-collapse" id="navbarNav">
		<ul class="navbar-nav">
			<li class="nav-item">
				<img alt="40" width="40" src="Imagenes/logo_carrito.png">
			</li>
			<li class="nav-item active"><a
				style="margin-left: 10px; border: none"
				class="btn btn-outline-light" href="frmDashboard.jsp" target="myFrame">Home</a></li>
			<li class="nav-item">
				<a style="margin-left: 10px; border: none" class="btn btn-outline-light" href="Controlador?menu=Producto&accion=Listar" target="myFrame">Producto</a></li>
			<li class="nav-item">
				<a style="margin-left: 10px; border: none" class="btn btn-outline-light" href="Controlador?menu=Usuario&accion=Listar" target="myFrame">Usuario</a></li>
			<li class="nav-item">
				<a style="margin-left: 10px; border: none" class="btn btn-outline-light" href="Controlador?menu=Cliente&accion=Listar" target="myFrame">Cliente</a></li>
			<li class="nav-item">
				<a style="margin-left: 10px; border: none" class="btn btn-outline-light" href="Controlador?menu=NuevaVenta&accion=default" target="myFrame">Nueva Venta</a></li>
		</ul>
		<div class="ml-auto mr-10" style="margin-right: 20px !important">
			<div class="dropdown">
				<button class="btn btn-outline-light dropdown-toggle" type="button"
					data-toggle="dropdown" aria-expanded="false" style="border:none"><%=usuario_nombre%> <%=usuario_apellido%></button>
				<div class="dropdown-menu text-center">
					<a class="dropdown-item" href="#">
						<img alt="60" width="60" src="Imagenes/usuario.png">
					</a> 
					<a	class="dropdown-item" href="#">Usuario</a> 
					<a	class="dropdown-divider"></a>
					<form action="index.jsp" method="POST">
						<button name="accion" value="Salir" class="dropdown-item" href="#">Salir</button>
					</form>
				</div>
			</div>
		</div>
	</div>
</nav>

<div class="m-4" style="height: 850px;">
	<iframe name="myFrame" style="height:100%; width: 100%; border:none;">
	
	</iframe>
</div>

</body>
</html>