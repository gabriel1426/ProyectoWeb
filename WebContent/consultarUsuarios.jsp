<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<jsp:useBean id="jpro" class="util.Procesos" scope="request"></jsp:useBean>
<div>
<center>
		<h4>Listado de Usuarios</h4>
	</center>

	<div class="container">
    <div class="form-group col-md-6 linea">
    
    <label class="control-label col-md-3" for="filtro">Estado de pago: </label>
    <div class="col-md-8 col-sm-12">
    <select name="estado"  id="myInput"  onchange="myFunction()" class="linea">
	<option value="0"  >-----</option>
	<option value="pagado"  >Pagado</option>
	<option value="pendiente"  >Pendiente</option>
	<option value="faltante" >Faltante</option>
	</select>
	 </div>
	</div>
	</div>

	<div class="container" > 
	<table class="mytabla table" id="myTable">

		<tr class="header">

			<th>Nombre</th>
			<th>Telefono</th>
			<th>Cedula</th>
			<th>Estado de pago</th>
			<th>Visualizar</th>
			<th>Eliminar</th>


		</tr>

		<c:forEach items="${jpro.listarUsuarios()}" var="item">
			<tr>
				<td style="vertical-align:middle;" ><c:out value="${item.nombre}" /></td>
				<td style="vertical-align:middle;" ><c:out value="${item.telefono}" /></td>
				<td style="vertical-align:middle;" ><c:out value="${item.cedula}" /></td>
				<td style="vertical-align:middle;" ><c:out value="${item.estadoPago}" /></td>
				<td style="vertical-align:middle;" >
					<!-- Trigger the modal with a button -->
					<button type="button" class="btn btn-info" data-toggle="modal"
						data-target="#${item.cedula}1">
						Visualizar <span class="fas fa-edit"></span>
					</button> <!-- Modal -->
					<div id="${item.cedula}1" class="modal fade" role="dialog">
						<div class="modal-dialog">

							<!-- Modal content-->
							<div class="modal-content">
								<div class="modal-header">
									<button type="button" class="close" data-dismiss="modal">&times;</button>
									<h4 class="modal-title">Actualizar Partido</h4>
								</div>
								<div class="modal-body col-md-12 col-sm-12 col-xs-12">
									<p>Por favor chequea el combrobante de pago</p>

									<form action="PartidoController" method="post">

										<input type="hidden" name="metodo" value="1"> 
										
										<div class="form-group col-md-12">
											<br>
											<center>
												<button class="btn btn-success">Aprobar</button>
											</center>
										</div>
										<div class="form-group col-md-12">
											<br>
											<center>
												<button class="btn btn-success">Rechazar</button>
											</center>
										</div>

									</form>
								</div>
								<div class="modal-footer">
									<button type="button" class="btn btn-default"
										data-dismiss="modal">Close</button>
								</div>
							</div>

						</div>
					</div>
				</td>
				<td style="vertical-align:middle;" >
					<!-- Trigger the modal with a button -->
					<button type="button" class="btn btn-danger" data-toggle="modal"
						data-target="#${item.cedula}2"> Eliminar <span class="fas fa-trash-alt"></span>
					</button> 
					<!-- Modal -->
					<div id="${item.cedula}2" class="modal fade" role="dialog">
						<div class="modal-dialog">
 						<!-- Modal content-->
							<div class="modal-content">
								<div class="modal-header">
									<button type="button" class="close" data-dismiss="modal">&times;</button>
									<h4 class="modal-title">Eliminar Partdidor</h4>
							</div>
							<div class="modal-body col-md-12 col-sm-12 col-xs-12">
								<p>Estas seguro que deseas eliminar al Equipo</p>
								<form action="PartidoController" method="post">
									<input type="hidden" name="metodo" value="2"> 
									<input type="hidden" name="idPartido" value="${item.correo}">
									<div class="form-group col-md-12">
									<br>
									<center>
										<button class="btn btn-danger">Eliminar</button>
									</center>
								</div>
								</form>
								</div>
								
								
							<div class="modal-footer">
								<button type="button" class="btn btn-default"
									data-dismiss="modal">Close</button>
							</div>
						</div>

					</div>
					</div>
				</td>
			</tr>
		</c:forEach>

	</table>
	</div>
	</div>
