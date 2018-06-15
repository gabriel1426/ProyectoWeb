<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<jsp:useBean id="jpro" class="util.Procesos" scope="request"></jsp:useBean>
<div>
<br>
<center>
		<h2>Tabla de posiciones</h2>
	</center>

	

	<div class="container" > 
	<table class="mytabla table" id="myTable">

		<tr class="header">
			<th style="text-align: center;">Puesto</th>
			<th style="text-align: center;">Nombre</th>
			<th style="text-align: center;">Puntos</th>
			
		</tr>
		<c:set var="contador" value="${1}" />
		<c:forEach items="${jpro.ranking(sessionScope.correo)}" var="item">
			<tr>
			
				<td style="text-align: center;" ><c:out value="${contador}" /></td>
				 <c:set var="contador" value="${contador + 1}" />
				<td style="text-align: center;" ><c:out value="${item.nombre}" /></td>
				<td style="text-align: center;" ><c:out value="${item.puntos}" /></td>
				
			</tr>
		</c:forEach>

	</table>
	</div>
	</div>
