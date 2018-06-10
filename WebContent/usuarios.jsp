
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<jsp:useBean id="jpro" class="util.Procesos" scope="request"></jsp:useBean>
<div>


	<div class="container">
		<div class="panel panel-primary">
			<div class="panel-heading">
				<center>
					<h4>Datos de usuario</h4>
				</center>
			</div>
			<div class="panel-body">

				<form class="form-horizontal">

				<div class="form-group">
					<label class="control-label col-sm-2" for="email">Email:</label>
					<div class="col-sm-10">
						<p class="form-control-static">someone@example.com</p>
					</div>
				</div>
				<div class="form-group col-md-12 ">
					<label class="control-label col-md-6"> Nombre </label>
					<div class="col-sm-6">
						<label class="control-label col-md-6"> <% out.print(session.getAttribute("usuario")); %>
						</label>
					</div>
				</div>
				<div class="form-group col-md-12 ">
					<label class="control-label col-md-6" for="nombre">
						Telefono </label>
					<%
						out.print(session.getAttribute("telefono"));
					%>
				</div>
				<div class="form-group col-md-12 ">
					<label class="control-label col-md-6" for="nombre"> Cedula
					</label>
					<%
						out.print(session.getAttribute("cedula"));
					%>
				</div>
				<div class="form-group col-md-12 ">
					<label class="control-label col-md-6" for="nombre"> Correo
					</label>
					<%
						out.print(session.getAttribute("correo"));
					%>
				</div>
				<div class="form-group col-md-12 ">
					<label class="control-label col-md-6" for="nombre"> Estado
					</label>
					<%
						out.print(session.getAttribute("estado"));
					%>
				</div>
				<form class="form-horizontal myfom-registro "
					" action="RegistroController" enctype="MULTIPART/FORM-DATA"
					method="post">
					<input type="hidden" name="seleccion" value="1">
					<div class="form-group col-md-3 col-md-offset-3">
						<input class="form-control" type="file" name="file" />
					</div>
					<div class="form-group col-md-3 ">
						<input class="form-control" type="submit" value="Upload" />
					</div>
				</form>
				</form>
			</div>
		</div>
	</div>
</div>