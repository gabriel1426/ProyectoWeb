
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<jsp:useBean id="jpro" class="util.Procesos" scope="request"></jsp:useBean>
	
<br>
<div class="container">
<div class="col-lg-4 col-md-4 col-sm-12 col-xs-12">
	
			<h2> Mis puntos </h2>
			<br>
			<h3>LLevas acomulados: ${jpro.puntos(sessionScope.correo)}</h3>
</div>

<div class="col-lg-8 col-md-8 col-sm-12 col-xs-12">


	<table class="mytabla table" id="myTable">
	
			<tr>
			<th style="vertical-align:middle;">
			<center>Mis Datos</center> </th><th><div class="text-right">
							<a href="ValidarSesionController?sesion=activa" class="btn"><span class="fas fa-sync-alt"></a>
							</div> </th>
			
			</tr>
			
			<tr>
			<td>
			 <label class="control-label col-md-2" for="nombre">Nombre: </label>
			</td>
			<td>
			<input type="text" name="nombre" id="nombre" class="form-control" value="${sessionScope.nombre}" disabled>
			</td>
			</tr>
			
			<tr>
			<td>
			  <label class="control-label col-md-2" for="nombre">Email:</label>
			</td>
			<td>
			<input type="email" id="email" name="correo" class="form-control" value="${sessionScope.correo}" disabled>
			</td>
			</tr>
			
			<tr>
			<td>
			 <label class="control-label col-md-2 " for="nombre">Telefono: </label>
			</td>
			<td>
			<input type="number" name="telefono" id="telefono" class="form-control" value="${sessionScope.telefono}" disabled>
			</td>
			</tr>
			
			<tr>
			<td>
			  <label class="control-label col-md-2" for="nombre">CC: </label>
			</td>
			<td>
			<input type="number" name="cedula" id="cedula" class="form-control" value="${sessionScope.cedula}" disabled>
			</td>
			</tr>
			
			<tr>
			<td>
			  <label class="control-label col-md-2" for="contraseña">Contraseña: </label>
			</td>
			<td>
			<input type="text" name="password" id="password" class="form-control" value="${sessionScope.contraseña}"  disabled>
			</td>
			</tr>
			
			<tr>
			<td>
			  <label class="control-label col-md-2" for="contraseña">Estado: </label>
			</td>
			<td>
			<input type="text" name="password" id="password" class="form-control" value="${sessionScope.estado}" disabled>
			
			</td>
			</tr>
			
			<c:if test="${sessionScope.estado.equals('faltante')}">
			<tr>
			<td>
			  <label class="control-label col-md-2" for="contraseña">Recibo: </label>
			</td>
			<td>
			 <form class="form-horizontal myfom-registro" action="ReciboPagoController" enctype="MULTIPART/FORM-DATA" method="post">
					
					
					<div class="form-group ">
						
						<input class="form-control" type="file" name="file" /><br>
						<input class="form-control" type="submit" value="Upload" />
					</div>
					
			</form>
			</td>
			</tr>
			</c:if>
			 
			</table>
			</div>
		</div>