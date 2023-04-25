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

<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/css/bootstrap.min.css"
	integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm"
	crossorigin="anonymous">
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/js/bootstrap.min.js"
	integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl"
	crossorigin="anonymous"></script>
<link rel="stylesheet" href="css/Estilo.css">
<script>
	function cargarContenido(url) {
		console
				.log('Se ha llamado a la función cargarContenido con el archivo '
						+ url);

		$('#contenido-embebido').load(url);
	}

	function actualizarReloj() {
		// Obtenemos la hora actual
		var fecha = new Date();
		var horas = fecha.getHours();
		var minutos = fecha.getMinutes();
		var segundos = fecha.getSeconds();

		// Añadimos un cero delante de los números menores de 10
		horas = (horas < 10 ? "0" : "") + horas;
		minutos = (minutos < 10 ? "0" : "") + minutos;
		segundos = (segundos < 10 ? "0" : "") + segundos;

		// Actualizamos el span con la hora actual
		document.getElementById("reloj").innerHTML = horas + ":" + minutos
				+ ":" + segundos;
	}

	setInterval(actualizarReloj, 1000);
</script>

<style>
body {
	margin: 0;
	padding: 0;
}

.sidebar {

	background-color: #3e608a;
}


.nav-link:hover {
	background-color: blue;
}

.list-group-item.list-group-item-action:hover {
	background-color: blue;
}

.bg-secondary {
	background-color: #3e608a !important;
	color: white !important;
}
</style>

</head>
<body bgcolor="#c5dec9">
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

	<div class="content">
		<div class="row">
			<div class="col-3">
				<div class="sidebar col-md-6" style="width: 280px;">

					<a class="nav-link text-white"> <img src="Imagenes/usuario.png"
						class="bi me-2" width="25" height="25"></img> Usuario: <strong><%=usuario_nombre%>
							<%=usuario_apellido%></strong>
					</a>

					<div style="text-align: center; background: white; padding: 0px">
						<img src="Imagenes/logo_supermarket_V2.png"
							alt="Logo de la empresa" height="80"
							style="width: 100%; height: 100%">
					</div>

					<hr>
					<ul class="nav nav-pills flex-column mb-auto">
						<li class="nav-item"><a href="#" class="nav-link text-white"
							aria-current="page"> <img src="Imagenes/ventas.png"
								class="bi me-2" width="25" height="25">
							<use href="#"></use></img> Ventas
						</a></li>
						<li><a href="#" class="nav-link text-white"
							onclick="cargarContenido('frm_Proveedores.jsp')"> <img
								src="Imagenes/proveeedores.png" class="bi me-2" width="25"
								height="25">
							<use href="#"></use></img> Proveedores
						</a></li>
						<li><a href="#" class="nav-link text-white"> <img
								src="Imagenes/clientes.png" class="bi me-2" width="25"
								height="25">
							<use href="#"></use></img> Clientes
						</a></li>
						<li><a href="#" class="nav-link text-white"> <img
								src="Imagenes/almacen.png" class="bi me-2" width="25"
								height="25">
							<use href="#"></use></img> Almacen
						</a></li>
						<li><a href="#" class="nav-link text-white"> <img
								src="Imagenes/productos.png" class="bi me-2" width="25"
								height="25">
							<use href="#"></use></img> Productos
						</a></li>


					</ul>
					<hr>
					<a href="#" class="nav-link text-white"> <img
						src="Imagenes/salir.png" class="bi me-2" width="25" height="25">
					<use href="#"></use></img> Salir
					</a>
				</div>
			</div>
			<div class="col-9">
				<div class="content" id="contenido-embebido">
					<div class="row">
						<div class="col-6">
							<h1>Dashboard</h1>
						</div>
						<div class="col-6" style="text-align: end;">
							<h1>
								<span id="reloj" class="badge bg-secondary">New</span>
							</h1>
						</div>
					</div>

					<!-- Aquí va el contenido principal -->
					<div class="row">
						<div class="col-6">
							<div class="bg-light">
								<h5 class="text-center my-3">Información General</h5>
								<ul class="list-group">
									<li class="list-group-item">Ventas Hoy: S/500</li>
									<li class="list-group-item">Ventas Semana: S/3,500</li>
									<li class="list-group-item">Productos Vendidos Hoy: 10</li>
									<li class="list-group-item">Productos en Stock: 100</li>
									<li class="list-group-item">Cantidad de Clientes: 50</li>
								</ul>
							</div>
						</div>

						<div class="col-6">
							<div class="bg-light">
								<h5 class="text-center my-3">Alertas de Stock</h5>
								<div class="list-group">
									<a href="#" class="list-group-item list-group-item-action"
										aria-current="true"
										style="background-color: #5bb85f; color: white; border-color: transparent">
										<div class="d-flex w-100 justify-content-between">
											<h5 class="mb-1">Stock Minimo</h5>
											<small style="font-size: 150%">5</small>
										</div>
										<p class="mb-1">Verificar productos que cuentan con stock
											minimo.</p> <small>Click para ver reporte.</small>
									</a> <a href="#" class="list-group-item list-group-item-action"
										aria-current="true"
										style="background-color: #da534f; color: white; border-color: transparent">
										<div class="d-flex w-100 justify-content-between">
											<h5 class="mb-1">Productos proximos a vencer</h5>
											<small style="font-size: 150%">3</small>
										</div>
										<p class="mb-1">Verificar el Listado de los productos
											proximos a vencer.</p> <small>Click para ver reporte.</small>
									</a> <a href="#" class="list-group-item list-group-item-action"
										aria-current="true"
										style="background-color: #ff8e00; color: white; border-color: transparent">
										<div class="d-flex w-100 justify-content-between">
											<h5 class="mb-1">Productos vencidos</h5>
											<small style="font-size: 150%">2</small>
										</div>
										<p class="mb-1">Verificar productos que se encuentran
											vencidos a la fecha.</p> <small>Click para ver reporte.</small>
									</a>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
</body>

</html>