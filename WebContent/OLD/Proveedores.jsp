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
	console.log('Se ha llamado a la función cargarContenido con el archivo ' + url);

	$('#contenido-embebido').load(url);
}


</script>

<style>
    body {
      margin: 0;
      padding: 0;
    }
    .sidebar {
      width: 200px;
      height: 100%;
      position: fixed;
      top: 0;
      left: 0;
      background-color: #3e608a;
    }
    .content {
      margin-left: 300px;
      padding: 20px;
    }
  .nav-link:hover {
    background-color: blue;
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
			usuario_apellido =apeUsu;
	%>


<div class="sidebar col-md-6" style="width: 280px;">

    <a  class="nav-link text-white">
          <img src="Imagenes/usuario.png" class="bi me-2" width="25" height="25"></img>
          Usuario: <strong><%= usuario_nombre %>  <%= usuario_apellido %></strong>
    </a>

    <div style="text-align: center; background: white; padding: 15px">
    	<img src="Imagenes/logo_supermarket.png" alt="Logo de la empresa" height="80" style="width:85%; height:85%">
    </div>
    	
    <hr>
    <ul class="nav nav-pills flex-column mb-auto">
      <li class="nav-item">
        <a href="#" class="nav-link text-white" aria-current="page">
          <img src="Imagenes/ventas.png" class="bi me-2" width="25" height="25"><use href="#"></use></img>
          Ventas
        </a>
      </li>
      <li>
        <a href="#" class="nav-link text-white">
          <img src="Imagenes/proveeedores.png" class="bi me-2" width="25" height="25"><use href="#"></use></img>
          Proveedores
        </a>
      </li>
      <li>
        <a href="#" class="nav-link text-white">
          <img src="Imagenes/clientes.png" class="bi me-2" width="25" height="25"><use href="#"></use></img>
          Clientes
        </a>
      </li>
      <li>
        <a href="#" class="nav-link text-white">
          <img src="Imagenes/almacen.png" class="bi me-2" width="25" height="25"><use href="#"></use></img>
          Almacen
        </a>
      </li>
      <li>
        <a href="#" class="nav-link text-white">
          <img src="Imagenes/productos.png" class="bi me-2" width="25" height="25"><use href="#"></use></img>
          Productos
        </a>
      </li>
      

    </ul>
 <hr>
        <a href="#" class="nav-link text-white">
          <img src="Imagenes/salir.png" class="bi me-2" width="25" height="25"><use href="#"></use></img>
          Salir
        </a>
  </div>
  <div class="content col-md-6" id="contenido-embebido">
    <!-- Aquí va el contenido principal -->
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

</body>

</html>