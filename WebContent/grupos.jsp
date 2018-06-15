
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<jsp:useBean id="jPro" class="util.Procesos" scope="request"></jsp:useBean>
<br>
<div class="w3-container"> 

<div class="w3-bar w3-black">

  <button class="w3-bar-item w3-button" onclick="openCity('A')">Grupo A</button>
  <button class="w3-bar-item w3-button" onclick="openCity('B')">Grupo B</button>
  <button class="w3-bar-item w3-button" onclick="openCity('C')">Grupo C</button>
  <button class="w3-bar-item w3-button" onclick="openCity('D')">Grupo D</button>
  <button class="w3-bar-item w3-button" onclick="openCity('E')">Grupo E</button>
  <button class="w3-bar-item w3-button" onclick="openCity('F')">Grupo F</button>
  <button class="w3-bar-item w3-button" onclick="openCity('G')">Grupo G</button>
  <button class="w3-bar-item w3-button" onclick="openCity('H')">Grupo H</button>
  
</div>

<div id="A" class="w3-container w3-display-container city">
  
		<table id="tablaGrupo" class="table ">
		<tr>

			<th style="text-align: center;">Nombre Equipo</th>
			<th style="text-align: center;">Puntos</th>
			<th style="text-align: center;">Fase</th>
			<th style="text-align: center;">Estado</th>
			<th style="text-align: center;"></th>
		</tr>
  
  <c:forEach items="${jPro.ListarGrupos()}" var="item">
	<c:if test="${item.grupo.equals('A')}">
		
	<tr>
		<td style="text-align: center;" ><img class="img-equipos headerImg img-responsive"
			src="<c:out value="${item.bandera}"/>" alt="" /> <c:out value="${item.nombre}" /></td>
		<td style="text-align: center;" ><c:out value="${item.puntos}" /></td>
		<td style="text-align: center;" ><c:out value="${item.fase}" /></td>
        <td style="text-align: center;" >${item.estado}</td>
		<td style="text-align: center;">
		<c:choose> 
		<c:when test="${item.estado.equals('Eliminado')}">
		<button style="text-align: center" type="button"
				class="btn btn-info text-right" data-toggle="modal"
				data-target="#${item.idEquipo}" disabled>
				Actualizar <span class="fas fa-edit" ></span>
		</button>
		</c:when>
		<c:otherwise>
		<button style="text-align: center;" type="button"
				class="btn btn-info text-right" data-toggle="modal"
				data-target="#${item.idEquipo}">
				Actualizar <span class="fas fa-edit"></span>
		</button>
		</c:otherwise>
		</c:choose>
		<!-- Modal -->
	<div id="${item.idEquipo}" class="modal fade" role="dialog">
		<div class="modal-dialog">
			<!-- Modal content-->
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal">&times;</button>
					<h4 class="modal-title">Actualizar un equipo</h4>
				</div>
				<div class="modal-body col-md-12 col-sm-12 col-xs-12">
					

					<form action="GruposController" method="post"
						class="form-horizontal myfom-registro">
						<input type="hidden" name="idGrupo" value="${item.idEquipo}">
						<div class="form-group col-md-12">

							<label class="control-label col-md-2" for="puntos">Puntos: </label>
							<div class="col-md-9 col-sm-12">
								<input type="number" name="puntos" id="puntos" class="form-control" value="${item.puntos}" required>
							</div>
						</div>
						
						<div class="form-group col-md-12">

							<label class="control-label col-md-2" for="faseGrupo">Fase: </label>
							<div class="col-md-9 col-sm-12">
								<select name="faseGrupo" class="form-control" id="faseGrupo" required>
									
									<option value="${item.fase}">${item.fase}</option>
									<option value="Fase de Grupos">Fase de Grupos</option>
									<option value="Octavos">Octavos</option>
									<option value="Cuartos">Cuartos</option>
									<option value="Semifinal">Semifinal</option>
									<option value="3 y 4 puesto">3 y 4 puesto</option>
									<option value="Final">Final</option>
								</select> 
							</div>
						</div>
						<div class="form-group col-md-12">

							<label class="control-label col-md-2" for="estadoGrupo">Estado:
							</label>
							<div class="col-md-9 col-sm-12">

								<select name="estadoGrupo" class="form-control" id="estadoGrupo" required>

									<option value="Activo">Activo</option>
									<option value="Eliminado">Eliminado</option>
									
								</select> <input class="form-control" type="hidden" name="estado"
									id="estado" value="Activo">
							</div>
						</div>
						
						<div>
							<br>
							<center>
								<button class="btn btn-success">Actualizar</button>
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
		
		</td>
	</tr>
	
	</c:if>
	</c:forEach>
	</table>
</div>

<div id="B" class="w3-container w3-display-container city" style="display:none">
  
  
		<table id="tablaGrupo" class="table ">
		<tr>

			<th>Nombre Equipo</th>
			<th>Puntos</th>
			<th>Fase</th>
			<th>Estado</th>
		</tr>
  
  <c:forEach items="${jPro.ListarGrupos()}" var="item">
	<c:if test="${item.grupo.equals('B')}">
		
	<tr>
		<td style="vertical-align:middle;" ><img class="img-equipos headerImg img-responsive"
			src="<c:out value="${item.bandera}"/>" alt="" /> <c:out
				value="${item.nombre}" /></td>
		<td style="vertical-align:middle;" ><c:out value="${item.puntos}" /></td>
		<td style="vertical-align:middle;" ><c:out value="${item.fase}" /></td>
		<td style="text-align: center;" >${item.estado}</td>
		<td style="text-align: center;">
		<c:choose> 
		<c:when test="${item.estado.equals('Eliminado')}">
		<button style="text-align: center" type="button"
				class="btn btn-info text-right" data-toggle="modal"
				data-target="#${item.idEquipo}" disabled>
				Actualizar <span class="fas fa-edit" ></span>
		</button>
		</c:when>
		<c:otherwise>
		<button style="text-align: center;" type="button"
				class="btn btn-info text-right" data-toggle="modal"
				data-target="#${item.idEquipo}">
				Actualizar <span class="fas fa-edit"></span>
		</button>
		</c:otherwise>
		</c:choose>
		<!-- Modal -->
	<div id="${item.idEquipo}" class="modal fade" role="dialog">
		<div class="modal-dialog">
			<!-- Modal content-->
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal">&times;</button>
					<h4 class="modal-title">Actualizar un equipo</h4>
				</div>
				<div class="modal-body col-md-12 col-sm-12 col-xs-12">
					

					<form action="GruposController" method="post"
						class="form-horizontal myfom-registro">
						<input type="hidden" name="idGrupo" value="${item.idEquipo}">
						<div class="form-group col-md-12">

							<label class="control-label col-md-2" for="puntos">Puntos: </label>
							<div class="col-md-9 col-sm-12">
								<input type="number" name="puntos" id="puntos" class="form-control" value="${item.puntos}" required>
							</div>
						</div>
						
						<div class="form-group col-md-12">

							<label class="control-label col-md-2" for="faseGrupo">Fase: </label>
							<div class="col-md-9 col-sm-12">
								<select name="faseGrupo" class="form-control" id="faseGrupo" required>
									
									<option value="${item.fase}">${item.fase}</option>
									<option value="Fase de Grupos">Fase de Grupos</option>
									<option value="Octavos">Octavos</option>
									<option value="Cuartos">Cuartos</option>
									<option value="Semifinal">Semifinal</option>
									<option value="3 y 4 puesto">3 y 4 puesto</option>
									<option value="Final">Final</option>
								</select> 
							</div>
						</div>
						<div class="form-group col-md-12">

							<label class="control-label col-md-2" for="estadoGrupo">Estado:
							</label>
							<div class="col-md-9 col-sm-12">

								<select name="estadoGrupo" class="form-control" id="estadoGrupo" required>

									<option value="Activo">Activo</option>
									<option value="Eliminado">Eliminado</option>
									
								</select> <input class="form-control" type="hidden" name="estado"
									id="estado" value="Activo">
							</div>
						</div>
						
						<div>
							<br>
							<center>
								<button class="btn btn-success">Actualizar</button>
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
		
		</td>
	</tr>
	
	</c:if>
	</c:forEach>
	</table>
</div>

<div id="C" class="w3-container w3-display-container city" style="display:none">
 
  
  
		<table id="tablaGrupo" class="table ">
		<tr>

			<th>Nombre Equipo</th>
			<th>Puntos</th>
			<th>Fase</th>
			<th>Estado</th>
		</tr>
  
  <c:forEach items="${jPro.ListarGrupos()}" var="item">
	<c:if test="${item.grupo.equals('C')}">
		
	<tr>
		<td style="vertical-align:middle;" ><img class="img-equipos headerImg img-responsive"
			src="<c:out value="${item.bandera}"/>" alt="" /> <c:out
				value="${item.nombre}" /></td>
		<td style="vertical-align:middle;" ><c:out value="${item.puntos}" /></td>
		<td style="vertical-align:middle;" ><c:out value="${item.fase}" /></td>
		<td style="text-align: center;" >${item.estado}</td>
		<td style="text-align: center;">
		<c:choose> 
		<c:when test="${item.estado.equals('Eliminado')}">
		<button style="text-align: center" type="button"
				class="btn btn-info text-right" data-toggle="modal"
				data-target="#${item.idEquipo}" disabled>
				Actualizar <span class="fas fa-edit" ></span>
		</button>
		</c:when>
		<c:otherwise>
		<button style="text-align: center;" type="button"
				class="btn btn-info text-right" data-toggle="modal"
				data-target="#${item.idEquipo}">
				Actualizar <span class="fas fa-edit"></span>
		</button>
		</c:otherwise>
		</c:choose>
		<!-- Modal -->
	<div id="${item.idEquipo}" class="modal fade" role="dialog">
		<div class="modal-dialog">
			<!-- Modal content-->
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal">&times;</button>
					<h4 class="modal-title">Actualizar un equipo</h4>
				</div>
				<div class="modal-body col-md-12 col-sm-12 col-xs-12">
					

					<form action="GruposController" method="post"
						class="form-horizontal myfom-registro">
						<input type="hidden" name="idGrupo" value="${item.idEquipo}">
						<div class="form-group col-md-12">

							<label class="control-label col-md-2" for="puntos">Puntos: </label>
							<div class="col-md-9 col-sm-12">
								<input type="number" name="puntos" id="puntos" class="form-control" value="${item.puntos}" required>
							</div>
						</div>
						
						<div class="form-group col-md-12">

							<label class="control-label col-md-2" for="faseGrupo">Fase: </label>
							<div class="col-md-9 col-sm-12">
								<select name="faseGrupo" class="form-control" id="faseGrupo" required>
									
									<option value="${item.fase}">${item.fase}</option>
									<option value="Fase de Grupos">Fase de Grupos</option>
									<option value="Octavos">Octavos</option>
									<option value="Cuartos">Cuartos</option>
									<option value="Semifinal">Semifinal</option>
									<option value="3 y 4 puesto">3 y 4 puesto</option>
									<option value="Final">Final</option>
								</select> 
							</div>
						</div>
						<div class="form-group col-md-12">

							<label class="control-label col-md-2" for="estadoGrupo">Estado:
							</label>
							<div class="col-md-9 col-sm-12">

								<select name="estadoGrupo" class="form-control" id="estadoGrupo" required>

									<option value="Activo">Activo</option>
									<option value="Eliminado">Eliminado</option>
									
								</select> <input class="form-control" type="hidden" name="estado"
									id="estado" value="Activo">
							</div>
						</div>
						
						<div>
							<br>
							<center>
								<button class="btn btn-success">Actualizar</button>
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
		
		</td>
	</tr>
	
	</c:if>
	</c:forEach>
	</table>
  
</div>
<div id="D" class="w3-container w3-display-container city" style="display:none">
  
  
  
		<table id="tablaGrupo" class="table ">
		<tr>

			<th>Nombre Equipo</th>
			<th>Puntos</th>
			<th>Fase</th>
			<th>Estado</th>
		</tr>
  
  <c:forEach items="${jPro.ListarGrupos()}" var="item">
	<c:if test="${item.grupo.equals('D')}">
		
	<tr>
		<td style="vertical-align:middle;" ><img class="img-equipos headerImg img-responsive"
			src="<c:out value="${item.bandera}"/>" alt="" /> <c:out
				value="${item.nombre}" /></td>
		<td style="vertical-align:middle;" ><c:out value="${item.puntos}" /></td>
		<td style="vertical-align:middle;" ><c:out value="${item.fase}" /></td>
		<td style="text-align: center;" >${item.estado}</td>
		<td style="text-align: center;">
		<c:choose> 
		<c:when test="${item.estado.equals('Eliminado')}">
		<button style="text-align: center" type="button"
				class="btn btn-info text-right" data-toggle="modal"
				data-target="#${item.idEquipo}" disabled>
				Actualizar <span class="fas fa-edit" ></span>
		</button>
		</c:when>
		<c:otherwise>
		<button style="text-align: center;" type="button"
				class="btn btn-info text-right" data-toggle="modal"
				data-target="#${item.idEquipo}">
				Actualizar <span class="fas fa-edit"></span>
		</button>
		</c:otherwise>
		</c:choose>
		<!-- Modal -->
	<div id="${item.idEquipo}" class="modal fade" role="dialog">
		<div class="modal-dialog">
			<!-- Modal content-->
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal">&times;</button>
					<h4 class="modal-title">Actualizar un equipo</h4>
				</div>
				<div class="modal-body col-md-12 col-sm-12 col-xs-12">
					

					<form action="GruposController" method="post"
						class="form-horizontal myfom-registro">
						<input type="hidden" name="idGrupo" value="${item.idEquipo}">
						<div class="form-group col-md-12">

							<label class="control-label col-md-2" for="puntos">Puntos: </label>
							<div class="col-md-9 col-sm-12">
								<input type="number" name="puntos" id="puntos" class="form-control" value="${item.puntos}" required>
							</div>
						</div>
						
						<div class="form-group col-md-12">

							<label class="control-label col-md-2" for="faseGrupo">Fase: </label>
							<div class="col-md-9 col-sm-12">
								<select name="faseGrupo" class="form-control" id="faseGrupo" required>
									
									<option value="${item.fase}">${item.fase}</option>
									<option value="Fase de Grupos">Fase de Grupos</option>
									<option value="Octavos">Octavos</option>
									<option value="Cuartos">Cuartos</option>
									<option value="Semifinal">Semifinal</option>
									<option value="3 y 4 puesto">3 y 4 puesto</option>
									<option value="Final">Final</option>
								</select> 
							</div>
						</div>
						<div class="form-group col-md-12">

							<label class="control-label col-md-2" for="estadoGrupo">Estado:
							</label>
							<div class="col-md-9 col-sm-12">

								<select name="estadoGrupo" class="form-control" id="estadoGrupo" required>

									<option value="Activo">Activo</option>
									<option value="Eliminado">Eliminado</option>
									
								</select> <input class="form-control" type="hidden" name="estado"
									id="estado" value="Activo">
							</div>
						</div>
						
						<div>
							<br>
							<center>
								<button class="btn btn-success">Actualizar</button>
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
		
		</td>
	</tr>
	
	</c:if>
	</c:forEach>
	</table>
  
</div>

<div id="E" class="w3-container w3-display-container city" style="display:none">
  
 
 
		<table id="tablaGrupo" class="table ">
		<tr>

			<th>Nombre Equipo</th>
			<th>Puntos</th>
			<th>Fase</th>
			<th>Estado</th>
		</tr>
  
  <c:forEach items="${jPro.ListarGrupos()}" var="item">
	<c:if test="${item.grupo.equals('E')}">
		
	<tr>
		<td style="vertical-align:middle;" ><img class="img-equipos headerImg img-responsive"
			src="<c:out value="${item.bandera}"/>" alt="" /> <c:out
				value="${item.nombre}" /></td>
		<td style="vertical-align:middle;" ><c:out value="${item.puntos}" /></td>
		<td style="vertical-align:middle;" ><c:out value="${item.fase}" /></td>
		<td style="text-align: center;" >${item.estado}</td>
		<td style="text-align: center;">
		<c:choose> 
		<c:when test="${item.estado.equals('Eliminado')}">
		<button style="text-align: center" type="button"
				class="btn btn-info text-right" data-toggle="modal"
				data-target="#${item.idEquipo}" disabled>
				Actualizar <span class="fas fa-edit" ></span>
		</button>
		</c:when>
		<c:otherwise>
		<button style="text-align: center;" type="button"
				class="btn btn-info text-right" data-toggle="modal"
				data-target="#${item.idEquipo}">
				Actualizar <span class="fas fa-edit"></span>
		</button>
		</c:otherwise>
		</c:choose>
		<!-- Modal -->
	<div id="${item.idEquipo}" class="modal fade" role="dialog">
		<div class="modal-dialog">
			<!-- Modal content-->
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal">&times;</button>
					<h4 class="modal-title">Actualizar un equipo</h4>
				</div>
				<div class="modal-body col-md-12 col-sm-12 col-xs-12">
					

					<form action="GruposController" method="post"
						class="form-horizontal myfom-registro">
						<input type="hidden" name="idGrupo" value="${item.idEquipo}">
						<div class="form-group col-md-12">

							<label class="control-label col-md-2" for="puntos">Puntos: </label>
							<div class="col-md-9 col-sm-12">
								<input type="number" name="puntos" id="puntos" class="form-control" value="${item.puntos}" required>
							</div>
						</div>
						
						<div class="form-group col-md-12">

							<label class="control-label col-md-2" for="faseGrupo">Fase: </label>
							<div class="col-md-9 col-sm-12">
								<select name="faseGrupo" class="form-control" id="faseGrupo" required>
									
									<option value="${item.fase}">${item.fase}</option>
									<option value="Fase de Grupos">Fase de Grupos</option>
									<option value="Octavos">Octavos</option>
									<option value="Cuartos">Cuartos</option>
									<option value="Semifinal">Semifinal</option>
									<option value="3 y 4 puesto">3 y 4 puesto</option>
									<option value="Final">Final</option>
								</select> 
							</div>
						</div>
						<div class="form-group col-md-12">

							<label class="control-label col-md-2" for="estadoGrupo">Estado:
							</label>
							<div class="col-md-9 col-sm-12">

								<select name="estadoGrupo" class="form-control" id="estadoGrupo" required>

									<option value="Activo">Activo</option>
									<option value="Eliminado">Eliminado</option>
									
								</select> <input class="form-control" type="hidden" name="estado"
									id="estado" value="Activo">
							</div>
						</div>
						
						<div>
							<br>
							<center>
								<button class="btn btn-success">Actualizar</button>
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
		
		</td>
	</tr>
	
	</c:if>
	</c:forEach>
	</table>
	 
</div>

<div id="F" class="w3-container w3-display-container city" style="display:none">
  
  
  
		<table id="tablaGrupo" class="table ">
		<tr>

			<th>Nombre Equipo</th>
			<th>Puntos</th>
			<th>Fase</th>
			<th>Estado</th>
		</tr>
  
  <c:forEach items="${jPro.ListarGrupos()}" var="item">
	<c:if test="${item.grupo.equals('F')}">
		
	<tr>
		<td style="vertical-align:middle;" ><img class="img-equipos headerImg img-responsive"
			src="<c:out value="${item.bandera}"/>" alt="" /> <c:out
				value="${item.nombre}" /></td>
		<td style="vertical-align:middle;" ><c:out value="${item.puntos}" /></td>
		<td style="vertical-align:middle;" ><c:out value="${item.fase}" /></td>
		<td style="text-align: center;" >${item.estado}</td>
		<td style="text-align: center;">
		<c:choose> 
		<c:when test="${item.estado.equals('Eliminado')}">
		<button style="text-align: center" type="button"
				class="btn btn-info text-right" data-toggle="modal"
				data-target="#${item.idEquipo}" disabled>
				Actualizar <span class="fas fa-edit" ></span>
		</button>
		</c:when>
		<c:otherwise>
		<button style="text-align: center;" type="button"
				class="btn btn-info text-right" data-toggle="modal"
				data-target="#${item.idEquipo}">
				Actualizar <span class="fas fa-edit"></span>
		</button>
		</c:otherwise>
		</c:choose>
		<!-- Modal -->
	<div id="${item.idEquipo}" class="modal fade" role="dialog">
		<div class="modal-dialog">
			<!-- Modal content-->
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal">&times;</button>
					<h4 class="modal-title">Actualizar un equipo</h4>
				</div>
				<div class="modal-body col-md-12 col-sm-12 col-xs-12">
					

					<form action="GruposController" method="post"
						class="form-horizontal myfom-registro">
						<input type="hidden" name="idGrupo" value="${item.idEquipo}">
						<div class="form-group col-md-12">

							<label class="control-label col-md-2" for="puntos">Puntos: </label>
							<div class="col-md-9 col-sm-12">
								<input type="number" name="puntos" id="puntos" class="form-control" value="${item.puntos}" required>
							</div>
						</div>
						
						<div class="form-group col-md-12">

							<label class="control-label col-md-2" for="faseGrupo">Fase: </label>
							<div class="col-md-9 col-sm-12">
								<select name="faseGrupo" class="form-control" id="faseGrupo" required>
									
									<option value="${item.fase}">${item.fase}</option>
									<option value="Fase de Grupos">Fase de Grupos</option>
									<option value="Octavos">Octavos</option>
									<option value="Cuartos">Cuartos</option>
									<option value="Semifinal">Semifinal</option>
									<option value="3 y 4 puesto">3 y 4 puesto</option>
									<option value="Final">Final</option>
								</select> 
							</div>
						</div>
						<div class="form-group col-md-12">

							<label class="control-label col-md-2" for="estadoGrupo">Estado:
							</label>
							<div class="col-md-9 col-sm-12">

								<select name="estadoGrupo" class="form-control" id="estadoGrupo" required>

									<option value="Activo">Activo</option>
									<option value="Eliminado">Eliminado</option>
									
								</select> <input class="form-control" type="hidden" name="estado"
									id="estado" value="Activo">
							</div>
						</div>
						
						<div>
							<br>
							<center>
								<button class="btn btn-success">Actualizar</button>
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
		
		</td>
	</tr>
	
	</c:if>
	</c:forEach>
	</table>
	
</div>
<div id="G" class="w3-container w3-display-container city" style="display:none">
  
  
		<table id="tablaGrupo" class="table ">
		<tr>

			<th>Nombre Equipo</th>
			<th>Puntos</th>
			<th>Fase</th>
			<th>Estado</th>
		</tr>
  
  <c:forEach items="${jPro.ListarGrupos()}" var="item">
	<c:if test="${item.grupo.equals('G')}">
		
	<tr>
		<td style="vertical-align:middle;" ><img class="img-equipos headerImg img-responsive"
			src="<c:out value="${item.bandera}"/>" alt="" /> <c:out
				value="${item.nombre}" /></td>
		<td style="vertical-align:middle;" ><c:out value="${item.puntos}" /></td>
		<td style="vertical-align:middle;" ><c:out value="${item.fase}" /></td>
		<td style="text-align: center;" >${item.estado}</td>
		<td style="text-align: center;">
		<c:choose> 
		<c:when test="${item.estado.equals('Eliminado')}">
		<button style="text-align: center" type="button"
				class="btn btn-info text-right" data-toggle="modal"
				data-target="#${item.idEquipo}" disabled>
				Actualizar <span class="fas fa-edit" ></span>
		</button>
		</c:when>
		<c:otherwise>
		<button style="text-align: center;" type="button"
				class="btn btn-info text-right" data-toggle="modal"
				data-target="#${item.idEquipo}">
				Actualizar <span class="fas fa-edit"></span>
		</button>
		</c:otherwise>
		</c:choose>
		<!-- Modal -->
	<div id="${item.idEquipo}" class="modal fade" role="dialog">
		<div class="modal-dialog">
			<!-- Modal content-->
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal">&times;</button>
					<h4 class="modal-title">Actualizar un equipo</h4>
				</div>
				<div class="modal-body col-md-12 col-sm-12 col-xs-12">
					

					<form action="GruposController" method="post"
						class="form-horizontal myfom-registro">
						<input type="hidden" name="idGrupo" value="${item.idEquipo}">
						<div class="form-group col-md-12">

							<label class="control-label col-md-2" for="puntos">Puntos: </label>
							<div class="col-md-9 col-sm-12">
								<input type="number" name="puntos" id="puntos" class="form-control" value="${item.puntos}" required>
							</div>
						</div>
						
						<div class="form-group col-md-12">

							<label class="control-label col-md-2" for="faseGrupo">Fase: </label>
							<div class="col-md-9 col-sm-12">
								<select name="faseGrupo" class="form-control" id="faseGrupo" required>
									
									<option value="${item.fase}">${item.fase}</option>
									<option value="Fase de Grupos">Fase de Grupos</option>
									<option value="Octavos">Octavos</option>
									<option value="Cuartos">Cuartos</option>
									<option value="Semifinal">Semifinal</option>
									<option value="3 y 4 puesto">3 y 4 puesto</option>
									<option value="Final">Final</option>
								</select> 
							</div>
						</div>
						<div class="form-group col-md-12">

							<label class="control-label col-md-2" for="estadoGrupo">Estado:
							</label>
							<div class="col-md-9 col-sm-12">

								<select name="estadoGrupo" class="form-control" id="estadoGrupo" required>

									<option value="Activo">Activo</option>
									<option value="Eliminado">Eliminado</option>
									
								</select> <input class="form-control" type="hidden" name="estado"
									id="estado" value="Activo">
							</div>
						</div>
						
						<div>
							<br>
							<center>
								<button class="btn btn-success">Actualizar</button>
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
		
		</td>
	</tr>
	
	</c:if>
	</c:forEach>
	</table>
	 
</div>

<div id="H" class="w3-container w3-display-container city" style="display:none">
  
  
  
		<table id="tablaGrupo" class="table ">
		<tr>

			<th>Nombre Equipo</th>
			<th>Puntos</th>
			<th>Fase</th>
			<th>Estado</th>
		</tr>
  
  <c:forEach items="${jPro.ListarGrupos()}" var="item">
	<c:if test="${item.grupo.equals('H')}">
		
	<tr>
		<td style="vertical-align:middle;" ><img class="img-equipos headerImg img-responsive"
			src="<c:out value="${item.bandera}"/>" alt="" /> <c:out
				value="${item.nombre}" /></td>
		<td style="vertical-align:middle;" ><c:out value="${item.puntos}" /></td>
		<td style="vertical-align:middle;" ><c:out value="${item.fase}" /></td>
		<td style="text-align: center;" >${item.estado}</td>
		<td style="text-align: center;">
		<c:choose> 
		<c:when test="${item.estado.equals('Eliminado')}">
		<button style="text-align: center" type="button"
				class="btn btn-info text-right" data-toggle="modal"
				data-target="#${item.idEquipo}" disabled>
				Actualizar <span class="fas fa-edit" ></span>
		</button>
		</c:when>
		<c:otherwise>
		<button style="text-align: center;" type="button"
				class="btn btn-info text-right" data-toggle="modal"
				data-target="#${item.idEquipo}">
				Actualizar <span class="fas fa-edit"></span>
		</button>
		</c:otherwise>
		</c:choose>
		<!-- Modal -->
	<div id="${item.idEquipo}" class="modal fade" role="dialog">
		<div class="modal-dialog">
			<!-- Modal content-->
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal">&times;</button>
					<h4 class="modal-title">Actualizar un equipo</h4>
				</div>
				<div class="modal-body col-md-12 col-sm-12 col-xs-12">
					

					<form action="GruposController" method="post"
						class="form-horizontal myfom-registro">
						<input type="hidden" name="idGrupo" value="${item.idEquipo}">
						<div class="form-group col-md-12">

							<label class="control-label col-md-2" for="puntos">Puntos: </label>
							<div class="col-md-9 col-sm-12">
								<input type="number" name="puntos" id="puntos" class="form-control" value="${item.puntos}" required>
							</div>
						</div>
						
						<div class="form-group col-md-12">

							<label class="control-label col-md-2" for="faseGrupo">Fase: </label>
							<div class="col-md-9 col-sm-12">
								<select name="faseGrupo" class="form-control" id="faseGrupo" required>
									
									<option value="${item.fase}">${item.fase}</option>
									<option value="Fase de Grupos">Fase de Grupos</option>
									<option value="Octavos">Octavos</option>
									<option value="Cuartos">Cuartos</option>
									<option value="Semifinal">Semifinal</option>
									<option value="3 y 4 puesto">3 y 4 puesto</option>
									<option value="Final">Final</option>
								</select> 
							</div>
						</div>
						<div class="form-group col-md-12">

							<label class="control-label col-md-2" for="estadoGrupo">Estado:
							</label>
							<div class="col-md-9 col-sm-12">

								<select name="estadoGrupo" class="form-control" id="estadoGrupo" required>

									<option value="Activo">Activo</option>
									<option value="Eliminado">Eliminado</option>
									
								</select> <input class="form-control" type="hidden" name="estado"
									id="estado" value="Activo">
							</div>
						</div>
						
						<div>
							<br>
							<center>
								<button class="btn btn-success">Actualizar</button>
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
		
		</td>
	</tr>
	
	</c:if>
	</c:forEach>
	</table>
	
</div>
</div>

<script type="text/javascript" src="js/filtrar.js"></script>


