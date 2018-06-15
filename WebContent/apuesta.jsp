<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<jsp:useBean id="jpro" class="util.Procesos" scope="request"></jsp:useBean>


<div>
	<br>
	<center>
		<h4>Listado de Partidos</h4>
	</center>



	<div class="container">

		<div class="row form-group col-md-5 linea">

			<label class="control-label col-md-2" for="fase">Fase: </label>
			<div class="col-md-6 col-sm-12">
				<select name="fase" id="myInput1" onchange="myFunction1()"
					class="form-control ">
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
				<select name="estado" id="seleccion" onchange="myFunction()"
					class="form-control ">
					<option value="0">Todos</option>
					<option value="Activo">Activo</option>
					<option value="En curso">En curso</option>
					<option value="Finalizado">Finalizado</option>
				</select>
			</div>
		</div>
		
	</div>
	<div class="container">
		<table class="mytabla table" id="myTable" style="text-align: center;">


			<tr class="header">

				<th style="text-align: center;">Fecha</th>
				<th style="text-align: center;">Local</th>
				<th colspan="2" style="text-align: center;">Marcador</th>
				<th style="text-align: center;">Visitantev</th>
				<th style="text-align: center;">Estado</th>
				<th style="text-align: center;">Fase</th>
				<th style="text-align: center;"></th>

			</tr>

			<c:forEach items="${jpro.listarPartidos()}" var="item">
				<tr>
					<td style="vertical-align: middle;"><center>
							<fmt:formatDate type="date"  value="${item.fecha}" />  ${item.hora}</center></td>
						</center></td>
					<td style="vertical-align: middle;"><div class="text-right">
							<c:out value="${item.equipo1.nombre}" />
							<img class="img-equipos headerImg img-responsive"
								src="<c:out value="${item.equipo1.bandera}"/>" alt="" style="border-style:solid;border-width:1px;"/>
						</div></td>
					<td style="vertical-align: middle;"><center>
							<c:out value="${item.getGEquipo1()}" />
							<center></td>
					<td style="vertical-align: middle;"><center>
							<c:out value="${item.getGEquipo2()}" />
							<center></td>
					<td style="vertical-align: middle;"><img
						class="img-equipos headerImg img-responsive"
						src="<c:out value="${item.equipo2.bandera}"/>" alt="" style="border-style:solid;border-width:1px;"/> <c:out
							value="${item.equipo2.nombre}" /></td>

					<td style="vertical-align: middle;"><center>
							<c:out value="${item.estado}" />
						</center></td>
					<td style="vertical-align: middle;"><center>
							<c:out value="${item.fase}" />
						</center></td>

					
					<td style="vertical-align: middle;">
					
					<c:choose>
					<c:when test="${sessionScope.estado.equals('faltante')}">
    				Falta el comprobante de pago
 					</c:when>
 					<c:when test="${sessionScope.estado.equals('revision')}">
    				comprobante de en revision
 					</c:when>
 					<c:otherwise>
 					<c:choose>
					<c:when test="${item.estado.equals('Finalizado')}">
    				<button style="margin: auto;" type="button" class="btn btn-info"
							data-toggle="modal" data-target="#${item.idPartido}1" disabled>
							<span class="fas fa-edit">Apostar</span>
							
					</button> <!-- Modal -->
 					</c:when>
 					<c:otherwise>
 					<button style="margin: auto;" type="button" class="btn btn-info"
							data-toggle="modal" data-target="#${item.idPartido}1" >
							<span class="fas fa-edit">Apostar</span>
					</button> <!-- Modal -->
 					
 					</c:otherwise>			
					</c:choose>
					</c:otherwise>	
					</c:choose>
						<!-- Trigger the modal with a button -->
						
						<div id="${item.idPartido}1" class="modal fade" role="dialog">
							<div class="modal-dialog">

								<!-- Modal content-->
								<div class="modal-content">
									<div class="modal-header">
										<button type="button" class="close" data-dismiss="modal">&times;</button>
										<h4 class="modal-title">Apuesta</h4>
									</div>
									<div class="modal-body col-md-12 col-sm-12 col-xs-12">
										
										<div class="form-group  col-md-12">
											<label for="local">Tipo de apuesta: </label>
											<div class="w3-bar w3-default">

												<center><button class="w3-bar-item w3-button"
													onclick="openApuesta('${item.idPartido}2')">divina al
													marcador</button></center>
												<center><button class="w3-bar-item w3-button"
													onclick="openApuesta('${item.idPartido}3')">Adivina el equipo ganador</button></center>
											</div>
											<br>

											<div id="${item.idPartido}2"
												class=" w3-container w3-display-container apuesta">
												<form action="ApuestaController" method="post">
													<input type="hidden" name="metodo" value="3"> 
													<input type="hidden" name="apuesta2" value="0">
													<input type="hidden" name="idPartido1" value="${item.idPartido}">
													
													<h3>Marcador</h3>
													<div class="form-group  col-md-12">
														<label for="glocal22">${item.equipo1.nombre}: </label> <input
															class="form-control" type="number" name="glocal22"
															id="glocal22">

													</div>
													<div class="form-group  col-md-12">
														<label for="gvisitante22">${item.equipo2.nombre}: </label> <input
															class="form-control" type="number" name="gvisitante22"
															id="gvisitante22">

													</div>
													<br>
													
 										<center>
														<button class="btn btn-success">Apostar</button>
														<center>
												</form>
											</div>

											<div style="display: none;" id="${item.idPartido}3"
												class="w3-container w3-display-container  apuesta">
												<form action="ApuestaController" method="post">
													<input type="hidden" name="metodo" value="4"> 
													<input type="hidden" name="apuesta2" value="0">
													<input type="hidden" name="idPartido2" value="${item.idPartido}">
													
													<h3>Equipos</h3>
													<div class="form-group  col-md-12">
														<input type="radio"
															id="${item.idPartido}4" name="apuesta" value="${item.equipo1.nombre}">
														  <img class="img-equipos headerImg img-responsive"
														src="<c:out value="${item.equipo1.bandera}"/>" alt="" style="border-style:solid;border-width:1px;"/><label for="${item.idPartido}4"">  ${item.equipo1.nombre}</label> <br>
														
														
														<input type="radio" id="${item.idPartido}5" name="apuesta"
															value="Empate"> <img class="img-equipos  img-responsive"
														src="https://as01.epimg.net/img/comunes/fotos/fichas/paises/svg/unk.svg" alt="" style="border-style:solid;border-width:1px;"><label for="${item.idPartido}5">Empate</label><br>
															
														<input type="radio" id="${item.idPartido}6" name="apuesta"
															value="${item.equipo2.nombre}"> <img class="img-equipos headerImg img-responsive"
														src="<c:out value="${item.equipo2.bandera}"/>" alt="" style="border-style:solid;border-width:1px;" /><label for="${item.idPartido}6"> ${item.equipo2.nombre}</label>

													</div>
													
													<br>
													<center>
													<button class="btn btn-success">Apostar</button>
													<center>
												</form>
											</div>

										</div>

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