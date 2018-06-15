
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

			<th>Nombre Equipo</th>
			<th>Puntos</th>
			<th>Fase</th>
			<th>Estado</th>
		</tr>
  
  <c:forEach items="${jPro.ListarGrupos()}" var="item">
	<c:if test="${item.grupo.equals('A')}">
		
	<tr>
		<td style="vertical-align:middle;" ><img class="img-equipos headerImg img-responsive"
			src="<c:out value="${item.bandera}"/>" alt="" /> <c:out value="${item.nombre}" /></td>
		<td style="vertical-align:middle;" ><c:out value="${item.puntos}" /></td>
		<td style="vertical-align:middle;" ><c:out value="${item.fase}" /></td>
		<td style="text-align: center;" >${item.estado}</td>
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
	</tr>
	
	</c:if>
	</c:forEach>
	</table>
	
</div>
</div>

<script type="text/javascript" src="js/filtrar.js"></script>