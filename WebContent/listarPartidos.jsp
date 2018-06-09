<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<jsp:useBean id="jpro" class="util.Procesos" scope="request"></jsp:useBean>
<div>
	<center>
		<h4>Listado de Partidos</h4>
	</center>

   
	<!-- Modal -->
	<div id="agregarPartido" class="modal fade" role="dialog">
		<div class="modal-dialog">
			<!-- Modal content-->
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal">&times;</button>
					<h4 class="modal-title">Agregar Partido</h4>
				</div>
				<div class="modal-body col-md-12 col-sm-12 col-xs-12">
					<p>Por favor completa los campos para agregar un nuevo Partido</p>


					<form action="PartidoController" method="post" class="form-horizontal myfom-registro">
						<input type="hidden" name="metodo" value="0">
						<div class="form-group col-md-12">

							<label class="control-label col-md-2" for="nombre">Equipo local: </label>
							<div class="col-md-9 col-sm-12">
								<select name="local" class="form-control selectpicker" id="local">
									<option value="0">-----</option>
									<c:forEach items="${jpro.ListarGrupos()}" var="item">
										<option value="${item.idEquipo}">${item.nombre}</option>
									</c:forEach>
								</select>
							</div>
						</div>
						<div class="form-group col-md-12">

							<label class="control-label col-md-2" for="nombre">Equipo Vicitante: </label>
							<div class="col-md-9 col-sm-12">
								<select name="vicitante" class="form-control" id="vicitante">
									<option value="0">-----</option>
									<c:forEach items="${jpro.ListarGrupos()}" var="item">
										<option value="${item.idEquipo}">${item.nombre}</option>
									</c:forEach>
								</select>
							</div>
						</div>
						<div class="form-group col-md-12">

							<label class="control-label col-md-2" for="estado">Estado: </label>
							<div class="col-md-9 col-sm-12">
								<input class="form-control" type="text" name="estado" id="estado" value="Activo" readonly>
							</div>
						</div>
						<div>
							<br>
							<center>
								<button class="btn btn-success">Ingresar</button>
							</center>
						</div>

					</form>
				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
				</div>
			</div>

		</div>
	</div>
	
	
	<div class="container">
    <div class="form-group col-md-6 linea">
    
    <label class="control-label col-md-2" for="filtro">Estado: </label>
    <div class="col-md-9 col-sm-12">
    <select name="estado"  id="myInput"  onchange="myFunction()" class="linea">
	<option value="0"  >-----</option>
	<option value="Activo"  >Activo</option>
	<option value="En curso"  >En curso</option>
	<option value="Finalizado" >Finalizado</option>
	</select>
	 </div>
	</div><div class="form-group col-md-6 text-right">
	<button style="text-align:center" type="button" class="btn btn-info text-right" data-toggle="modal"
		data-target="#agregarPartido"> Agregar <span class="fas fa-edit"></span>
	</button>
	</div>
	</div>
	<div class="container" > 
	<table class="mytabla table" id="myTable">

		<tr class="header">

			<th>Equipo 1</th>
			<th colspan="2">Marcador</th>
			<th>Equipo 2</th>
			<th>Estado</th>
			<th>Modificar</th>
			<th>Eliminar</th>


		</tr>

		<c:forEach items="${jpro.listarPartidos()}" var="item">
			<tr>
				<td style="vertical-align:middle;" ><img class="img-equipos headerImg img-responsive"
				src="<c:out value="${item.equipo1.bandera}"/>" alt="" /><c:out value="${item.equipo1.nombre}" /></td>
				<td style="vertical-align:middle;" ><center><c:out value="${item.getGEquipo1()}" /><center></td>
				<td style="vertical-align:middle;" ><center><c:out value="${item.getGEquipo2()}" /><center></td>
				<td style="vertical-align:middle;" ><img class="img-equipos headerImg img-responsive"
				src="<c:out value="${item.equipo2.bandera}"/>" alt="" /><c:out value="${item.equipo2.nombre}" /></td>
				
				<td style="vertical-align:middle;" ><c:out value="${item.estado}" /></td>


				<td style="vertical-align:middle;" >
					<!-- Trigger the modal with a button -->
					<button type="button" class="btn btn-info" data-toggle="modal"
						data-target="#${item.idPartido}1">
						Modificar <span class="fas fa-edit"></span>
					</button> <!-- Modal -->
					<div id="${item.idPartido}1" class="modal fade" role="dialog">
						<div class="modal-dialog">

							<!-- Modal content-->
							<div class="modal-content">
								<div class="modal-header">
									<button type="button" class="close" data-dismiss="modal">&times;</button>
									<h4 class="modal-title">Actualizar Partido</h4>
								</div>
								<div class="modal-body col-md-12 col-sm-12 col-xs-12">
									<p>Por favor completa los campos para actualizar la
										infomacion del Partido</p>

									<form action="PartidoController" method="post">

										<input type="hidden" name="metodo" value="1">
										<input type="hidden" name="idPartido" value="${item.idPartido}">
										<div class="form-group  col-md-12">
											<label for="local">Equipo local: </label> <input
												class="form-control" type="text" name="id" id="id"
												value="${item.equipo1.nombre}" readonly>

										</div>
										<div class="form-group  col-md-12">
											<label for="glocal">Goles local: </label> <input
												class="form-control" type="number" name="glocal" id="glocal"
												value="${item.getGEquipo1()}">

										</div>
										<div class="form-group  col-md-12">
											<label for="vicitante">Equipo vicitante: </label> <input
												class="form-control" type="text" name="vicitante"
												id="vicitante" value="${item.equipo2.nombre}" readonly>

										</div>
										<div class="form-group  col-md-12">
											<label for="gvicitante">Goles vicitante: </label> <input
												class="form-control" type="number" name="gvicitante"
												id="gvicitante" value="${item.getGEquipo2()}">

										</div>
										<div class="form-group col-md-12">

											<label class="control-label col-md-2" for="estado">Estado:
											</label>
												<select name="estado" class="form-control"
													id="estado">
													<option value="0">-----</option>
													<option value="Activo">Activo</option>
													<option value="En curso">En curso</option>
													<option value="Finalizado">Finalizado</option>

												</select>
											</div>
										
										<div class="form-group col-md-12">
											<br>
											<center>
												<button class="btn btn-success">Actualizar</button>
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
						data-target="#${item.idPartido}2"> Eliminar <span class="fas fa-trash-alt"></span>
					</button> 
					<!-- Modal -->
					<div id="${item.idPartido}2" class="modal fade" role="dialog">
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
									<input type="hidden" name="idPartido" value="${item.idPartido}">
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