<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>

<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!-- para dar formato a las fechas -->
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>

<!DOCTYPE html>
<html>
<head>

<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Mantenimiento Cliente</title>

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



<link rel="stylesheet" href="css/Estilo.css">
<style>
	@media print{
		.parte01, .btn, .accion{
			display: none;
		}
	}
</style>

</head>
<body>
	<div class="d-flex">
		<div class="col-sm-5 parte01">
			<div class="card">
			<h5 class="card-header">Ingreso de Productos</h5>
				<form action="Controlador?menu=NuevaVenta" method="POST">
				<div class="card-body">
					<div class="form-group">
						<label><b>Datos del Cliente</b></label>
					</div>
					<div class="form-group d-flex">
						<div class="col-sm-6 d-flex">
							<input type="text" name="codigocliente" value="${c.getDni()}" class="form-control" placeholder="codigo"> 
							<input type="submit" name="accion" value="BuscarCliente" class="btn btn-outline-info">
						</div>
						<div class="col-sm-6">
							<input type="text" name="nombrescliente" value="${c.getNombres()}" class="form-control">
						</div>
					</div>
					<div class="form-group">
						<label><b>Datos Producto</b></label>
					</div>
					<div class="form-group d-flex">
					
						<div class="col-sm-6 d-flex">
							<input type="text" name="codigoproducto" value="${producto.getIdproducto()}" class="form-control" placeholder="codigo"> 
							<button type="submit" name="accion" value="BuscarProducto" class="btn btn-outline-info">Buscar</button>
						</div>
						<div class="col-sm-6">
							<input type="text" name="nomproducto" value="${producto.getNombres()}" placeholder="Datos Producto" class="form-control">
						</div>
					
					</div>
					<div class="form-group d-flex">
					
						<div class="col-sm-6 d-flex">
							<input type="text" name="precio" value="${producto.getPrecio()}" class="form-control" placeholder="S/.0.00"> 
						</div>
						
						<div class="col-sm-3">
							<input type="number" value="1" name="cant" placeholder="Datos Producto" class="form-control">
						</div>
						
						
						<div class="col-sm-3">
							<input type="text" name="stock"  value="${producto.getStock()}" placeholder="Stock" class="form-control">
						</div>
					</div>
					<div class="form-group">
						<button type="submit" name="accion" value="Agregar" class="btn btn-outline-success""><i class="bi bi-bag-fill"></i>
						Agregar</button>
					</div>
					
				</div>
				</form>
			</div>
		</div>
		<div class="col-sm-7">
			<div class="card">
			<h5 class="card-header">Detalle de Venta</h5>
				<div class="card-body col-sm-4">
					<div class="d-flex align-items-center">
						<label style="margin-right: 20px; margin-bottom:0px"><b>NumeroSerie:</b></label>
						<input type="text" name="NroSerie" value="${nserie}" class="text-center font-weight-bold">
					</div>
				</div>
				<br>
					<table class="table table-striped">
						<thead>
							<tr>
								<th>NRO</th>
								<th>CODIGO</th>
								<th>DESCRIPCION</th>
								<th>PRECIO</th>
								<th>CANTIDAD</th>
								<th>SUBTOTAL</th>
								<th class="accion">ACCIONES</th>
							</tr>
						</thead>
						<tbody>
							<c:forEach var="list" items="${lista}">
								<tr>
									<td>${list.getItem()}</td>
									<td>${list.getIdproducto()}</td>
									<td>${list.getDEscripcionP()}</td>
									<td>${list.getPrecio()}</td>
									<td>${list.getCantidad()}</td>
									<td>${list.getSubtotal()}</td>
									<td class="d-flex">
										<a class="btn btn-warning" href="#">Editar</a>
										<a class="btn btn-danger" href="#" style="margin-left:10px">Eliminar</a>
									</td>
								</tr>
							</c:forEach>
						</tbody>
					</table>
			
			</div>
			<div class="card-footer d-flex">
					<div class="col-sm-5">
					  <a href="Controlador?menu=NuevaVenta&accion=GenerarVenta" onclick="print()" class="btn btn-success">
					    <i class="bi bi-file-earmark-plus"></i> Generar Venta
					  </a>
					  <a href="#" class="btn btn-danger">
					    <i class="bi bi-file-earmark-plus"></i> Cancelar
					  </a>
					</div>
						<div class="col-sm-3 d-flex align-items-center text-right">
						  <label style="margin-bottom:0px"><b>Total a Pagar: </b></label>
						</div>
									
				<div class="col-sm-4 ml-auto d-flex align-items-center">
					
					<input type="text" name="txtTotal" value="S/. ${totalpagar}0" class="form-control text-center font-weight-bold">
				</div>
				
			</div>
			
			<div>
				
			</div>
		
		</div>

	</div>
</body>
</html>