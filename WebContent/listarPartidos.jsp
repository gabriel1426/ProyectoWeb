<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<jsp:useBean id="jpro" class="util.Procesos" scope="request"></jsp:useBean>
<div>
<br>
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


					<form action="PartidoController" method="post"
						class="form-horizontal myfom-registro">
						<input type="hidden" name="metodo" value="0">
						<div class="form-group col-md-12">

							<label class="control-label col-md-2" for="nombre">Local: </label>
							<div class="col-md-9 col-sm-12">
								<select name="local" class="form-control selectpicker"
									id="local">
									<option value="0">Ninguno</option>
									<c:forEach items="${jpro.ListarGrupos()}" var="item">
										<option value="${item.idEquipo}">${item.nombre}</option>
									</c:forEach>
								</select>
							</div>
						</div>
						<div class="form-group col-md-12">

							<label class="control-label col-md-2" for="nombre">Visitante: </label>
							<div class="col-md-9 col-sm-12">
								<select name="visitante" class="form-control" id="visitante">
									<option value="0">Ninguno</option>
									<c:forEach items="${jpro.ListarGrupos()}" var="item">
										<option value="${item.idEquipo}">${item.nombre}</option>
									</c:forEach>
								</select>
							</div>
						</div>
						<div class="form-group col-md-12">

							<label class="control-label col-md-2" for="estado">Fase:
							</label>
							<div class="col-md-9 col-sm-12">

								<select name="fase" class="form-control" id="estado" required>

									<option value="Fase de Grupos">Fase de Grupos</option>
									<option value="Octavos">Octavos</option>
									<option value="Cuartos">Cuartos</option>
									<option value="Semifinal">Semifinal</option>
									<option value="3 y 4 puesto">3 y 4 puesto</option>
									<option value="Final">Final</option>
								</select> <input class="form-control" type="hidden" name="estado"
									id="estado" value="Activo">
							</div>
						</div>
						<div class="form-group col-md-12">

							<label class="control-label col-md-2" for="fecha">Fecha:
							</label>
							<div class="col-md-5 col-sm-12">
							<input class="form-control" type="date" name="fecha"
							id="fecha">
								
							</div>
							<div class="col-md-4 col-sm-12">
							<input class="form-control" type="time" name="hora" value="11:45:00" max="22:30:00" min="00:00:00" step="1">
								
							</div>
						</div>
						<div>
							<br>
							<center>
								<button class="btn btn-success">Agregar</button>
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
	
		<div class="row form-group col-md-5 linea">

			<label class="control-label col-md-2" for="fase">Fase: </label>
			<div class="col-md-6 col-sm-12">
				<select name="fase" id="myInput1" onchange="myFunction1()" class="form-control ">
					<option value="0">Todos</option>
					<option value="Fase de Grupos">Fase de Grupos</option>
					<option value="Octavos">Octavos</option>
					<option value="Cuartos">Cuartos</option>
					<option value="Semifinal">Semifinal</option>
					<option value="3 y 4 puesto">3 y 4 puesto</option>
					<option value="Final">Final</option>
				</select>
			</div>
		</div>
		<div class="row form-group col-md-5 linea">

			<label class="control-label col-md-2" for="estado">Estado </label>
			<div class="col-md-6 col-sm-12">
				<select name="estado" id="seleccion" onchange="myFunction()" class="form-control ">
					<option value="0">Todos</option>
					<option value="Activo">Activo</option>
					<option value="En curso">En curso</option>
					<option value="Finalizado">Finalizado</option>
				</select>
			</div>
		</div>
		<div class="row form-group col-md-2 text-right">
			<button style="text-align: center" type="button"
				class="btn btn-info text-right" data-toggle="modal"
				data-target="#agregarPartido">
				Agregar <span class="fas fa-edit"></span>
			</button>
		</div>
	</div>
	<div class="container">
		<table class="mytabla table" id="myTable" style="text-align: center;">


			<tr class="header">

				<th style="text-align: center;">Fecha</th>
				<th style="text-align: center;">Local</th>
				<th colspan="2" style="text-align: center;">Marcador</th>
				<th style="text-align: center;">Visitante </th>
				<th style="text-align: center;">Estado</th>
				<th style="text-align: center;">Fase</th>
				<th colspan="2" style="text-align: center;">Acciones</th>

			</tr>

			<c:forEach items="${jpro.listarPartidos()}" var="item">
				<tr>
					<td style="vertical-align: middle;"><center>
							<fmt:formatDate type="date"  value="${item.fecha}" />  ${item.hora}</center></td>
					<td style="vertical-align: middle;"><div class="text-right">
							<c:out value="${item.equipo1.nombre}" />
							<img class="img-equipos headerImg img-responsive"
							src="<c:out value="${item.equipo1.bandera}"/>" alt="" />
							</div> 
						</td>
					<td style="vertical-align: middle;"><center>
							<c:out value="${item.getGEquipo1()}" />
							<center></td>
					<td style="vertical-align: middle;"><center>
							<c:out value="${item.getGEquipo2()}" />
							<center></td>
					<td style="vertical-align: middle;">
							<img class="img-equipos headerImg img-responsive"
								src="<c:out value="${item.equipo2.bandera}"/>" alt="" />
							<c:out value="${item.equipo2.nombre}" />
						</td>

					<td style="vertical-align: middle;"><center><c:out value="${item.estado}" /></center></td>
					<td style="vertical-align: middle;"><center><c:out value="${item.fase}" /></center></td>


					<td style="vertical-align: middle;">
						<!-- Trigger the modal with a button -->
						
							<button style="margin: auto;"type="button" class="btn btn-info" data-toggle="modal"
								data-target="#${item.idPartido}1"><span class="fas fa-edit"></span></button>
						 <!-- Modal -->
						<div id="${item.idPartido}1" class="modal fade" role="dialog">
							<div class="modal-dialog">

								<!-- Modal content-->
								<div class="modal-content">
									<div class="modal-header">
										<button type="button" class="close" data-dismiss="modal">&times;</button>
										<h4 class="modal-title">Actualizar Partido</h4>
									</div>
									<div class="modal-body col-md-12 col-sm-12 col-xs-12">
										<p>Por favor completa los campos para actualizar la información del Partido</p>

										<form action="PartidoController" method="post">

											<input type="hidden" name="metodo" value="1"> <input
												type="hidden" name="idPartido" value="${item.idPartido}">
											<div class="form-group  col-md-12">
												<label for="local">Local: </label> <input
													class="form-control" type="text" name="id" id="id"
													value="${item.equipo1.nombre}" readonly>

											</div>
											<div class="form-group  col-md-12">
												<label for="glocal">Goles local: </label> <input
													class="form-control" type="number" name="glocal"
													id="glocal" value="${item.getGEquipo1()}">

											</div>
											<div class="form-group  col-md-12">
												<label for="visitante">Visitante: </label> <input
													class="form-control" type="text" name="visitante"
													id="visitante" value="${item.equipo2.nombre}" readonly>

											</div>
											<div class="form-group  col-md-12">
												<label for="gvisitante">Goles visitante: </label> <input
													class="form-control" type="number" name="gvisitante"
													id="gvisitante" value="${item.getGEquipo2()}">

											</div>
											<div class="form-group col-md-12">

												<label class="control-label col-md-2" for="estado">Estado:
												</label> <select name="estado" class="form-control" id="estado">
													
													<option value="${item.estado}">${item.estado}</option>
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
					<td style="vertical-align: middle;">
						<!-- Trigger the modal with a button -->
						<center>
							<button type="button" class="btn btn-danger" data-toggle="modal"
								data-target="#${item.idPartido}2">
								<span class="fas fa-trash-alt"></span>
							</button>
						</center> <!-- Modal -->
						<div id="${item.idPartido}2" class="modal fade" role="dialog">
							<div class="modal-dialog">
								<!-- Modal content-->
								<div class="modal-content">
									<div class="modal-header">
										<button type="button" class="close" data-dismiss="modal">&times;</button>
										<h4 class="modal-title">Eliminar Partdidor</h4>
									</div>
									<div class="modal-body col-md-12 col-sm-12 col-xs-12">
										<p>¿Estás seguro que deseas eliminar al Equipo?</p>
										<form action="PartidoController" method="post">
											<input type="hidden" name="metodo" value="2"> <input
												type="hidden" name="idPartido" value="${item.idPartido}">
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