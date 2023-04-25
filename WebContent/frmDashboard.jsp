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
<script src="https://code.jquery.com/jquery-3.6.0.js"></script>
<script src="https://cdn.jsdelivr.net/npm/sweetalert2@11"></script>

<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.3.1/dist/css/bootstrap.min.css" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
<link rel="stylesheet" href="Css/Estilo.css">

  <script src="https://code.jquery.com/jquery-3.6.0.js"></script>
  <script src="https://code.jquery.com/ui/1.13.2/jquery-ui.js"></script>

<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/js/bootstrap.min.js"
	integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl"
	crossorigin="anonymous"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-datepicker/1.9.0/js/bootstrap-datepicker.min.js" integrity="sha512-4F9RttxsSLtOu/Nm8LkEnod+V7a3nt3q3V7cPI+BlTQmkL6Gq3q3HQhOoHfQ2RcZ0vlP+oO7hBBFnBf9pU6FAw==" crossorigin="anonymous"></script>


<link rel="stylesheet" href="css/Estilo.css">

</head>
<body>
	
	<div class="content">
		<div class="row">

			<div class="col-12">
				<div class="content" id="contenido-embebido">
					<div class="row">
						<div class="col-6">
							<h1>Dashboard</h1>
						</div>
						<div class="col-6" style="text-align: end;">

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
									<a href="#" data-toggle="modal" data-target="#exampleModalCenter" class="list-group-item list-group-item-action aria-current="true" style="background-color: #5bb85f; color: white; border-color: transparent">
										<div class="d-flex w-100 justify-content-between" >
											<h5 class="mb-1">Stock Minimo</h5>
											<small style="font-size: 150%">5</small>
										</div>
										<p class="mb-1">Verificar productos que cuentan con stock
											minimo.</p> <small>Click para ver reporte.</small>
									</a> 
									
										<div class="modal fade" id="exampleModalCenter" tabindex="-1" role="dialog" aria-labelledby="exampleModalCenterTitle" aria-hidden="true">
											  <div class="modal-dialog modal-dialog-centered" role="document">
											    <div class="modal-content">
											      <div class="modal-header">
											        <h5 class="modal-title" id="exampleModalCenterTitle">Modal title</h5>
											        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
											          <span aria-hidden="true">&times;</span>
											        </button>
											      </div>
											      <div class="modal-body">
											        ...
											      </div>
											    </div>
											  </div>
										</div>
									<br>
									<a href="#" class="list-group-item list-group-item-action"
										aria-current="true"
										style="background-color: #da534f; color: white; border-color: transparent">
										<div class="d-flex w-100 justify-content-between">
											<h5 class="mb-1">Productos proximos a vencer</h5>
											<small style="font-size: 150%">3</small>
										</div>
										<p class="mb-1">Verificar el Listado de los productos
											proximos a vencer.</p> <small>Click para ver reporte.</small>
									</a><br> <a href="#" class="list-group-item list-group-item-action"
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