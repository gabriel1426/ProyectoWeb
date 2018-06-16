<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<jsp:useBean id="jpro" class="util.Procesos" scope="request"></jsp:useBean>
<jsp:useBean id="apro" class="util.ProcesosApuesta" scope="request"></jsp:useBean>

<div>
	<br>
	<center>
		<h4>Mis Apuestas</h4>
	</center>

	<div class="container">
		<table class="mytabla table" id="myTable" style="text-align: center;">


			<tr class="header">

				
				<th style="text-align: center;">Id apueta</th>
				<th style="text-align: center;">Id partido</th>
				<th colspan="3" style="text-align: center;">Apuesta</th>
				<th style="text-align: center;">.</th>
			</tr>

			<c:forEach items="${apro.listarApustasCliente(sessionScope.correo)}" var="item">
				<tr>
					
					<td style="vertical-align: middle;"><center>
							<c:out value="${item.idApuesta}" /></center></td>
							
					<td style="vertical-align: middle;"><center>
							<c:out value="${item.partido.idPartido}" /> <center></td>
					
					<c:choose>
    				<c:when test="${item.tipoApuesta.idTipo=='1'}">
    				
     				<td style="vertical-align: middle;"><div class="text-right">
     						<c:out value="${item.partido.equipo1.nombre}" />
							<img class="img-equipos headerImg img-responsive"
							src="<c:out value="${item.partido.equipo1.bandera}"/>" alt="" /> 
							  <c:out value="  ${item.getGEquipo1()}"/> </div></td>
							
					<td style="vertical-align: middle;"> <center>  -  vs   -  </center></td>
					<td style="vertical-align: middle;">
					<c:out value="${item.getGEquipo2()}" /> 
					<img class="img-equipos headerImg img-responsive"
							src="<c:out value="${item.partido.equipo2.bandera}"/>" alt="" />
					<c:out value="${item.partido.equipo2.nombre}" />
							</td>
							
       				 
    				</c:when>    
   			 		<c:otherwise>
        			<td colspan="3" style="vertical-align: middle;"><center>
							 Apostaste por <c:out value="${item.equipo}" /><center></td>
    				</c:otherwise>
					</c:choose>
		

					<td style="vertical-align: middle;">
					<c:choose>
					<c:when test="${item.estado.equals('Activo')}">
    				<button style="margin: auto;" type="button" class="btn btn-info"
							data-toggle="modal" data-target="#${item.idApuesta}1" >
							<span class="fas fa-edit">Actualizar</span>
					</button> <!-- Modal -->
 					</c:when>
 					<c:otherwise>
 					<button style="margin: auto;" type="button" class="btn btn-info"
							data-toggle="modal" data-target="#${item.idApuesta}1" disabled>
							<span class="fas fa-edit">Actualizar</span>
					</button> <!-- Modal -->
					</c:otherwise>			
					</c:choose>				
			
						<!-- Trigger the modal with a button -->
						
						<div id="${item.idApuesta}1" class="modal fade" role="dialog">
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
													onclick="openApuesta('${item.partido.idPartido}2')">Adivina el
													marcador final</button></center>
												<center><button class="w3-bar-item w3-button"
													onclick="openApuesta('${item.partido.idPartido}3')">Adivina el equipo ganador</button></center>
											</div>
											<br>

											<div style="display: none;" id="${item.partido.idPartido}2"
												class=" w3-container w3-display-container apuesta">
												<form action="ApuestaController" method="post">
													<input type="hidden" name="metodo" value="1"> 
													<input type="hidden" name="apuesta2" value="${item.idApuesta}"> 
													<input type="hidden" name="idPartido1" value="${item.partido.idPartido}">
													
													
													<h3>Marcador</h3>
													<div class="form-group  col-md-12">
														<label for="glocal22">${item.partido.equipo1.nombre}: </label> <input
															class="form-control" type="number" name="glocal22"
															id="glocal22">

													</div>
													<div class="form-group  col-md-12">
														<label for="gvisitante22">${item.partido.equipo2.nombre} </label> <input
															class="form-control" type="number" name="gvisitante22"
															id="gvisitante22">

													</div>
													<br>
													
 										<center>
														<button class="btn btn-success">Apostar</button>
														<center>
												</form>
											</div>

											<div style="display: none;" id="${item.partido.idPartido}3"
												class="w3-container w3-display-container  apuesta">
												<form action="ApuestaController" method="post">
													<input type="hidden" name="metodo" value="2"> 
													<input type="hidden" name="apuesta2" value="${item.idApuesta}">
													<input type="hidden" name="idPartido2" value="${item.partido.idPartido}">
													
													<h3>Equipos</h3>
													<div class="form-group  col-md-12">
														<input type="radio"
															id="${item.partido.idPartido}4" name="apuesta" value="${item.partido.equipo1.nombre}">
														  <img class="img-equipos headerImg img-responsive"
														src="<c:out value="${item.partido.equipo1.bandera}"/>" alt="" style="border-style:solid;border-width:1px;"/><label for="${item.partido.idPartido}4"">  ${item.partido.equipo1.nombre}</label> <br>
														
														
														<input type="radio" id="${item.partido.idPartido}5" name="apuesta"
															value="Empate"> <img class="img-equipos  img-responsive"
														src="https://as01.epimg.net/img/comunes/fotos/fichas/paises/svg/unk.svg" alt="" style="border-style:solid;border-width:1px;"><label for="${item.partido.idPartido}5">Empate</label><br>
															
														<input type="radio" id="${item.partido.idPartido}6" name="apuesta"
															value="${item.partido.equipo2.nombre}"> <img class="img-equipos headerImg img-responsive"
														src="<c:out value="${item.partido.equipo2.bandera}"/>" alt="" style="border-style:solid;border-width:1px;" /><label for="${item.partido.idPartido}6"> ${item.partido.equipo2.nombre}</label>

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