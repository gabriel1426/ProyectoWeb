<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<jsp:useBean id="jpro" class="util.Procesos" scope="request"></jsp:useBean>
<div>
<br>
<center>
		<h4>Listado de Usuarios</h4>
	</center>

	<div class="container">
    <div class="form-group col-md-6 linea">
    
    <label class="control-label col-md-3" for="filtro">Estado de pago: </label>
    <div class="col-md-8 col-sm-12">
    <select name="estado"  id="myInput2" onchange="myFunction2()" class="form-control ">
	<option value="0"  >Todos</option>
	<option value="aprobado"  >Aprobado</option>
	<option value="revision"  >Revision</option>
	<option value="faltante" >Faltante</option>
	</select>
	 </div>
	</div>
	</div>

	<div class="container" > 
	<table class="mytabla table" id="myTable">

		<tr class="header">

			<th style="text-align: center;">Nombre</th>
			<th style="text-align: center;">Telefono</th>
			<th style="text-align: center;">Cedula</th>
			<th style="text-align: center;">Estado de pago</th>
			<th style="text-align: center;">Visualizar</th>
			


		</tr>

		<c:forEach items="${jpro.listarUsuarios()}" var="item">
			<tr>
				<td style="text-align: center;" ><c:out value="${item.nombre}" /></td>
				<td style="text-align: center;" ><c:out value="${item.telefono}" /></td>
				<td style="text-align: center;" ><c:out value="${item.cedula}" /></td>
				<td style="text-align: center;" ><c:out value="${item.estadoPago}" /></td>
				<td style="text-align: center;" >
					
					<c:choose>
   						 <c:when test="${empty fn:trim(item.recibo)}">
      					<button type="button" class="btn btn-info" data-toggle="modal"
						data-target="#${item.cedula}1" disabled>
						Visualizar <span class="fas fa-edit"></span>
						</button>
   					 </c:when>    
    				 <c:otherwise>
       					 <button type="button" class="btn btn-info" data-toggle="modal"
						data-target="#${item.cedula}1">
						Visualizar <span class="fas fa-edit"></span>
					</button>
  					  </c:otherwise>
						</c:choose>
					
					<!-- Trigger the modal with a button -->
					
					
					 <!-- Modal -->
					<div id="${item.cedula}1" class="modal fade" role="dialog">
						<div class="modal-dialog">

							<!-- Modal content-->
							<div class="modal-content">
								<div class="modal-header">
									<button type="button" class="close" data-dismiss="modal">&times;</button>
									<h4 class="modal-title">Por favor chequea el combrobante de pago</h4>
								</div>
								<div class="modal-body col-md-12 col-sm-12 col-xs-12">
									<center><img src="${item.recibo}" class="img-responsive img-recibo"/></center>
									
									
									<c:if test="${item.estadoPago.equals('revision')}">
									<div class="row">
									<form action="ReciboPagoController" class="col-md-6 col-sm-12 col-xs-12" method="post">
									<input type="hidden" name="seleccion" value="1">
									<input type="hidden" name="correo" value="<c:out value="${item.correo}" />">
									
									<center><button class="btn btn-success"><i class="fas fa-check-square"></i></button></center>
									</form>
									<form action="ReciboPagoController"   class="col-md-6 col-sm-12 col-xs-12" method="post">
									<input type="hidden" name="seleccion" value="2">
									<input type="hidden" name="correo" value="<c:out value="${item.correo}" />">
									<center><button class="btn btn-success"><i class="fas fa-times"></i></button></center>
									</form>
									</div>
									</c:if>
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
