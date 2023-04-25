<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Ingreso de Proveedores</title>
<!-- Enlaces a las librerías de Bootstrap -->
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css"
	integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm"
	crossorigin="anonymous">
<script
	src="https://code.jquery.com/jquery-3.2.1.slim.min.js"
	integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN"
	crossorigin="anonymous"></script>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js"
	integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q"
	crossorigin="anonymous"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js"
	integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl"
	crossorigin="anonymous"></script>
</head>
<body>
	<div class="container">
		<h1>Ingreso de Proveedores</h1>
		<form action="guardarProveedor.jsp" method="POST">
		
			<div class="form-group">
				<label for="IdProvee">ID:</label>
			</div>	
		
				<div class="input-group mb-3">
				
				  <input type="text" class="form-control" placeholder="Escribe algo aquí" aria-label="Escribe algo aquí" aria-describedby="boton-addon" readonly>
				  <div class="input-group-append">
				    <button class="btn btn-primary" type="button" id="boton-addon">NUEVO</button>
				  </div>
				</div>
			<div class="form-group">
				<label for="rucProveedor">RUC:</label> <input type="text"
					class="form-control" id="rucProveedor" name="rucProveedor">
			</div>
			<div class="form-group">
				<label for="razonSocialProveedor">Razón Social:</label> <input
					type="text" class="form-control" id="razonSocialProveedor"
					name="razonSocialProveedor">
			</div>
			<div class="form-group">
				<label for="direccionProveedor">Dirección:</label> <input
					type="text" class="form-control" id="direccionProveedor"
					name="direccionProveedor">
			</div>
			<div class="form-group">
				<label for="telefonoProveedor">Teléfono:</label> <input
					type="text" class="form-control" id="telefonoProveedor"
					name="telefonoProveedor">
			</div>
			<div class="form-group">
				<label for="emailProveedor">Correo electrónico:</label> <input
					type="email" class="form-control" id="emailProveedor"
					name="emailProveedor">
			</div>
			<div class="form-group">
				<label for="RepresentanteLegal">Representante Legal:</label>
				<input
					type="text" class="form-control" id="repreLegal"
					name="repreLegal"">
			</div>
					
					
					<button type="button" class="btn btn-primary">Registar</button>
					<button type="button" class="btn btn-primary">Buscar</button>
					<button type="button" class="btn btn-primary">Eliminar</button>
					<button type="button" class="btn btn-primary">Actualizar</button>