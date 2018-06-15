<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
	<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<html>
<head>
<meta charset="utf-8" />
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
<title>Login</title>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css"
	integrity="sha384-BVYiiSIFeK1dGmJRAkycuHAHRg32OmUcww7on3RYdg4Va+PmSTsz/K68vbdEjh4u"
	crossorigin="anonymous">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap-theme.min.css"
	integrity="sha384-rHyoN1iRsVXV4nD0JutlnGaslCJuC7uwjduW9SVrLvRYooPp2bWYgmgJQIXwl/Sp"
	crossorigin="anonymous">
<link rel="stylesheet"
	href="https://use.fontawesome.com/releases/v5.0.10/css/all.css"
	integrity="sha384-+d0P83n9kaQMCwj8F4RJB66tzIwOKmrdb46+porD/OvrJ+37WqIM7UoBtwHO6Nlg"
	crossorigin="anonymous">
<link rel="stylesheet" href="css/estilos.css">
<link rel="stylesheet" href="css/login.css">

<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"
	integrity="sha384-Tc5IQib027qvyjSMfHjOMaLkfuWVxZxUPnCJA7l2mCWNIpG9mGCD8wGNIcPD7Txa"
	crossorigin="anonymous"></script>
</head>
<body class="mybody-login">
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:if test="${not empty fn:trim(sessionScope.correo)}">

<c:redirect url = "ValidarSesionController?sesion=noactiva"/>
</c:if>


	<div class="container">
		<div class="row main">
		<div class="panel-heading">
				<div class="panel-title text-center">
					<h1 class="title">Bienvenido a Mundo Apuestas</h1>
					<hr />
				</div>
			</div>
		<div class="row main-login main-center">
		
		<center><img src="https://vignette.wikia.nocookie.net/futebol/images/d/d2/WorldCup2018.png/revision/latest?cb=20170102015451" class=" img-recibo"/></center>

			<form action="LoginController" method="post">
				<div class="form-group col-md-12">
							<label for="correo" class="cols-sm-2 control-label">Email</label>
							<div class="cols-sm-10">
								<div class="input-group">
									<span class="input-group-addon"><i class="fa fa-envelope fa" aria-hidden="true"></i></span>
									<input type="email" class="form-control"id="email" name="correo"  placeholder="Ingresa tu Email" required/>
								</div>
							</div>
						</div>
						<div class="form-group col-md-12">
							<label for="password" class="cols-sm-2 control-label">Password</label>
							<div class="cols-sm-10">
								<div class="input-group">
									<span class="input-group-addon"><i class="fa fa-lock fa-lg" aria-hidden="true"></i></span>
									<input type="password" class="form-control"  name="password" id="password"  placeholder="Enter your Password" required/>
								</div>
							</div>
						</div>
				
    		<c:if test="${entrar=='falso'}">
    		<div class="form-group  col-md-10  col-xs-10 col-md-offset-1 col-xs-offset-1 alert alert-danger">
    			 <button type="button" class="close" data-dismiss="alert" aria-label="Close">
    				<span aria-hidden="true">&times;</span>
 				 </button>
  				<strong>¡Error!</strong> Datos incorrectos.
  			</div>
    		</c:if>
				<div>
					<br>
					<center><button class="btn btn-success">Ingresar</button></center>
				</div>
				<div class="form-group  col-md-12">
					<strong><a href="registro.jsp">Registrarme</a></strong> 
				</div>

			</form>
		</div>
		</div>
	</div>

	

</body>
</html>