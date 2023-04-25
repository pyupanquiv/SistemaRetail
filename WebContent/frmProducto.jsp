<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>

<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!-- para dar formato a las fechas -->
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>

<!DOCTYPE html>
<html>
<head>

<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Mantenimiento Producto</title>


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
	$("#fechavencimiento").datepicker({
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
	 var url="Controlador?menu=Producto&accion=Delete&id="+codigo;
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
		<h5 class="card-header">Detalle de Producto</h5>
		<div class="card-body">
			<form action="Controlador?menu=Producto" method="POST">
				<div class="form-group" style="display:none">
					<input type="text" value="${Producto.getIdproducto()}" name="txtIdProducto" class="form-control">				
				</div>
				<div class="form-group">
					<label>Nombres</label>
					<input type="text" value="${Producto.getNombres()}" name="txtNombres" class="form-control">
				</div>
				<div class="form-group">
					<label>Precio</label>
					<input type="text" value="${Producto.getPrecio()}" name="txtPrecio" class="form-control">
				</div>
				<div class="form-group">
					<label>Fecha Vencimiento</label>
					<input type="text" value="${Producto.getFechavencimiento()}" name="txtFechaVencimiento" id="fechavencimiento" class="form-control">
				</div>
				<div class="form-group">
					<label>Stock</label>
					<input type="text" value="${Producto.getStock()}" name="txtStock" class="form-control">
				</div>
				<div class="form-group">
					<label>Estado</label>
				<select name="txtEstado" class="form-control">
				  <option value="A" ${Producto.getEstado() == 'A' ? 'selected' : ''}>Activo</option>
				  <option value="I" ${Producto.getEstado() == 'I' ? 'selected' : ''}>Inactivo</option>
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
					<form  class="form-inline my-2 my-lg-0" action="Controlador?menu=Producto" method="POST">
						<input class="form-control mr-sm-2" type="text" name="nom" value="" class="form-control" placeholder="Nombre Producto"> 
							<button class="btn btn-success my-2 my-sm-0" type="submit" name="accion" value="Buscar" class="btn btn-outline-info"><i class="bi bi-search"></i></button>
					</form>
		</div>
		<table class="table table-striped">
			<thead>
				<tr>
					<th>ID</th>
					<th>NOMBRES</th>
					<th>PRECIO</th>
					<th>FECHA VENC</th>
					<th>STOCK</th>
					<th>ESTADO</th>
					<th>ACCIONES</th>
				</tr>
			</thead>
			<tbody>
			<c:forEach var="pro" items="${producto}">
				<tr>
					<td>${pro.getIdproducto()}</td>
					<td>${pro.getNombres()}</td>
					<td>${pro.getPrecio()}</td>
					<td>${pro.getFechavencimiento()}</td>
					<td>${pro.getStock()}</td>
					<td>${pro.getEstado()}</td>
					<td>					
						<a class="btn bg-success"" href="Controlador?menu=Producto&accion=Editar&id=${pro.getIdproducto()}"><img src="Imagenes/editar.png" alt="" width="20" height="20"></a>
						<a id="eliminar" class="btn bg-warning" href="Controlador?menu=Producto&accion=Delete&id=${pro.getIdproducto()}"><img src="Imagenes/eliminar.png" alt="" width="20" height="20"></a>
						<input type="hidden" id="codigo" value="${pro.getIdproducto()}">
					</td>
				</tr>
			</c:forEach>
			</tbody>
		</table>
	</div>
	</div>
</body>
</html>