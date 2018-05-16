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
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"
	integrity="sha384-Tc5IQib027qvyjSMfHjOMaLkfuWVxZxUPnCJA7l2mCWNIpG9mGCD8wGNIcPD7Txa"
	crossorigin="anonymous"></script>
</head>
<body class="mybody-login">



	<div class="mydiv-login container">
		<div class="row">
			<div class="col-md-12 myform-cont">
				<center>
					<h1>Bienvenido a Mundo Polla</h1>
				</center>

			</div>
			<div class="col-md-12">
				<center>
					<h4>Logueate para ingresar al sistema</h4>
				</center>

			</div>
		</div>
		<div class="row">

			<form action="LoginController" method="post">
				<div class="form-group  col-md-12">
					<label for="nombre">Correo</label> <input class="form-control"
						type="text" name="correo" id="correo">

				</div>
				<div class="form-group col-md-12">
					<label for="password">Password</label> <input class="form-control"
						type="password" name="password" id="password">
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
					<strong><a href="RegistroUsuario.jsp">Registrarme</a></strong> <strong><a
						href="">Olvede mi contraseña</a></strong>
				</div>

			</form>
		</div>

	</div>

	<footer class="container-fluid">

	<div class="container">

		<h4 class="textFooter">
			<span>Derechos de autor recerbados por Mundo Pollas</span>
		</h4>

		<h4 class="textFooter">
			<a class="myicon-red" target="_blank"
				href="https://www.facebook.com/"> <i
				class=" fab fa-facebook-square"></i> Facebook
			</a>
		</h4>

		<h4 class="textFooter">
			<a class=" myicon-red" target="_blank"
				href="https://twitter.com/?lang=es"> <i
				class="fab fa-facebook-square"></i> Twitter
			</a>
		</h4>

	</div>
	</footer>

</body>
</html>