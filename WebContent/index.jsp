<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
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
	<link rel="stylesheet" href="Css/Estilo.css">

    <script>
        function mostrarDiv() {
            var div = document.getElementById("miDiv");
            div.style.display = "block";
        }
    </script>

</head>
<style>
body{
	
	background-image: url("Imagenes/fondo.png");
	text-decoration:none;
}
</style>

<body >
	<%
		//recuperamos el mensaje del archivo validar
		String nombreDeUsuario = (String) request.getAttribute("usuario");
		String mensaje = (String) request.getAttribute("mensaje");
		String men2 = "";
		//aplicamos una condicion...
		if (nombreDeUsuario != null)
			men2 = nombreDeUsuario;
		if ("true".equals(mensaje)){
			
	%>
			<script>
			$(document).ready(function() {
				  var div = $("#miDiv");
				  if (div) {
				    div.show();
				  }
				});
			</script>
	<%
		}
		System.out.println("SE CUMPLE FUNCTION ");
	%>
	
<form action="ControladorLogin" method="post">

	<div class="container mt-5">
		<div class="row justify-content-center mb-4">
			<div class="col-md-6 col-lg-4 text-center">
				<img src="Imagenes/logo_market.png" alt="Logo" class="img-fluid">
			</div>
		</div>
		<div class="row justify-content-center">
			<div class="col-md-6 col-lg-4">
				<div class="card">
					<div class="card-header text-center">
						<h4>Por favor inicia sesión</h4>
					</div>
					<div class="card-body">
						<form action="ControladorLogin" method="post">
							<div class="form-group">
							
							<div id="miDiv" class="alert alert-danger" role="alert" style="display: none;">Usuario o contraseña incorrectos</div>
								<label id="labeltest" for="username">Nombre de usuario:</label>
								<input type="text" placeholder="Usuario"  class="form-control" id="usuario" name="usuario" required>
							</div>
							<div class="form-group">
								<label for="password">Contraseña:</label>
								<input type="password" placeholder="Contraseña" class="form-control" id="password" name="password" required>
							</div>

							<button type="submit" class="btn btn-primary btn-block">Iniciar sesión</button>
							
						</form>
					</div>
				</div>
			</div>
		</div>
	</div>
</form>
	
</body>
</html>