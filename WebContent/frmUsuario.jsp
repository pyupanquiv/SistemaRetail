<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>

<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!-- para dar formato a las fechas -->
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>

<!DOCTYPE html>
<html>
<head>

<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Mantenimiento Usuario</title>

<!-- Bootstrap -->
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.3.1/dist/css/bootstrap.min.css" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
<link rel="stylesheet" href="Css/Estilo.css">

<!-- Datepicker y jquery -->
<link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
<script src="//code.jquery.com/jquery-1.12.4.js"></script>
<script src="//code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
<!-- Ajax mensajes de confirmacion eliminacion -->
<script src="https://cdn.jsdelivr.net/npm/sweetalert2@11"></script>

<!-- <link rel="stylesheet" href="css/Estilo.css"> -->

<!--Iconos Bootstrap-->
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.5.0/font/bootstrap-icons.css">

<script>
$(function(){
	$("#fechaingreso").datepicker({
		dateFormat:'yy-mm-dd'
	});
	
})   //fin de query...

$(document).ready(function(){
	
	//cuando hacemos el evento click
	$("tr #eliminar").click(function(y){
		y.preventDefault();
		var cod=$(this).parent().find("#codigo").val();	
		Swal.fire({
			  title: 'Eliminar Registro',
			  text: "¿Usted Desea Eliminar el Registro?",
			  icon: 'warning',
			  showCancelButton: true,
			  confirmButtonColor: '#3085d6',
			  cancelButtonColor: '#d33',
			  confirmButtonText: 'SI,ELIMINAR REGISTRO!',
			  cancelButtonText:'¿Desea Cancelar?'
			}).then((result) => {
			  if (result.isConfirmed) {
			    //invocamos a la funcion...
			    eliminaritem(cod);
			    //reiniciamos el navegador...
			    setTimeout(function(){
			    	location.reload();
			    },1000)
			  }  //fin de la condicion...
			})  //fin de la notificacion	
		
	})  //fin del evento click...
	
 //creamos una funcion que permita capturar el codigo
 function eliminaritem(cod){
	 //recibimos el codigo
	 var codigo=Number(cod);
	 var url="Controlador?menu=Usuario&accion=Delete&id="+codigo;
	 $.ajax({
		url:url,
		async:true,
		success:function(r){
			console.log(r)
		}		 
	 })	 
 }
 
}) 
</script>

</head>
<body>

	<div class="d-flex">
	<div class="card col-sm-4" >
	<h5 class="card-header">Detalle de Usuario</h5>
		<div class="card-body">
			<form action="Controlador?menu=Usuario" method="POST">
				<div class="form-group" style="display:none">
					<input type="text" value="${usuario.getId()}" name="txtIde" class="form-control">
				</div>
				<div class="form-group">
					<label>Usuario</label>
					<input type="text" value="${usuario.getUsuario()}" name="txtUsuario" class="form-control">
				</div>
				<div class="form-group">
					<label>Password</label>
					<input type="password" value="${usuario.getPassword()}" name="txtPassword" class="form-control">
				</div>
				<div class="form-group">
					<label>Nombre</label>
					<input type="text" value="${usuario.getNombre()}" name="txtNombre" class="form-control">
				</div>
				<div class="form-group">
					<label>Apellido</label>
					<input type="text" value="${usuario.getApellido()}" name="txtApellido" class="form-control">
				</div>
				<div class="form-group">
					<label>Dni</label>
					<input type="text" value="${usuario.getDni()}" name="txtDni" class="form-control">
				</div>
				<div class="form-group">
					<label>FechaIngreso</label>
					<input type="text" value="${usuario.getFechaingr()}" name="txtFechaIngreso" id="fechaingreso" class="form-control datepicker">
				</div>
				<div class="form-group">
				   	<label>Perfil</label>
				   	
					<select class="form-control" name="Perfiles">
					  <c:forEach var="perfil" items="${listadoperfil}">
					    <option value='<c:out value="${perfil.idperfil}"></c:out>' ${perfil.idperfil == usuario.getPerfil_id() ? 'selected' : ''}>
					      <c:out value="${perfil.nomperfil}"></c:out>
					    </option>
					  </c:forEach>
					</select>
				    
				    
				  </div>
				<input type="submit" name="accion" value="Agregar" class="btn btn-info">
				<input type="submit" name="accion" value="Actualizar" class="btn btn-success">
			</form>
		</div>
	</div>
	<div class="col-sm-8">
		<div class="container mb-3">
		<!-- Boton BUSCAR -->
					<form  class="form-inline my-2 my-lg-0" action="Controlador?menu=Usuario" method="POST">
						<input class="form-control mr-sm-2" type="text" name="usuario_nom" value="" class="form-control" placeholder="Ingresar User"> 
							<button class="btn btn-success my-2 my-sm-0" type="submit" name="accion" value="Buscar" class="btn btn-outline-info"><i class="bi bi-search"></i></button>
					</form>
		</div>
	
		<table class="table table-striped">
			<thead>
				<tr>
					<th>ID</th>
					<th>USUARIO</th>
					<!--  <th>PASSWORD</th>-->
					<th>NOMBRE</th>
					<th>APELLIDO</th>
					<th>DNI</th>
					<th>FECHA INGRESO</th>
					<th>PERFIL</th>
					<th>ACCIONES</th>
				</tr>
			</thead>
			<tbody>
			<c:forEach var="usu" items="${usuarios}">
				<tr>
					<td>${usu.getId()}</td>
					<td>${usu.getUsuario()}</td>
					<!-- <td>${usu.getPassword()}</td> -->
					<td>${usu.getNombre()}</td>
					<td>${usu.getApellido()}</td>
					<td>${usu.getDni()}</td>
					<td>${usu.getFechaingr()}</td>
					<td>${usu.getPerfil_id()}</td>
					<td>
						<a class="btn bg-success" href="Controlador?menu=Usuario&accion=Editar&id=${usu.getId()}"><img src="Imagenes/editar.png" alt="" width="20" height="20"></a>
						<a id="eliminar" class="btn bg-warning" href="Controlador?menu=Usuario&accion=Delete&id=${usu.getId()}"><img src="Imagenes/eliminar.png" alt="" width="20" height="20"></a>
						<input type="hidden" id="codigo" value="${usu.getId()}">
					</td>
				</tr>
			</c:forEach>
			</tbody>
		</table>
	</div>
	</div>
</body>
</html>