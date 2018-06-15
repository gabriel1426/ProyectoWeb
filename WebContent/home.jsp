<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 5 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta charset="utf-8" />
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>HOME</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
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
<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
<link rel="stylesheet" href="css/estilos.css">
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js" integrity="sha384-Tc5IQib027qvyjSMfHjOMaLkfuWVxZxUPnCJA7l2mCWNIpG9mGCD8wGNIcPD7Txa" crossorigin="anonymous"></script>

</head>
<body>
<%response.setHeader("Cache-Control", "no-cache, no-store, must-revalidate"); // HTTP 1.1.
response.setHeader("Pragma", "no-cache"); // HTTP 1.0.
response.setHeader("Expires", "0"); // Proxies. %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:if test="${empty fn:trim(sessionScope.correo)}">

<c:redirect url = "ValidarSesionController?sesion=noactiva"/>
</c:if>


<header class="myMundo"> 
   
	<img class="headerImg img-responsive"
	onClick="location.reload();"
	src="http://especiales.semana.com/mundial-rusia-2018/images/logo.png"
	alt="">
	<h1  class="myMundoh1 ">MUNDO APUESTAS</h1>
	
</header>

<nav class="navbar navbar-default" role="navigation">
	
  <div class="container-fluid">
    <div class="navbar-header">
    <button type="button" class="navbar-toggle collapsed"
			data-toggle="collapse" data-target="#bs-example-navbar-collapse-1">
			<span class="sr-only">Toggle navigation</span> 
			<span class="icon-bar"></span>
     		<span class="icon-bar"></span>
      		<span class="icon-bar"></span>
		</button>
      <a class="navbar-brand" href="#" "> Mundo Apuestas</a>
    </div>
    <div class="collapse navbar-collapse navbar-ex1-collapse" id="bs-example-navbar-collapse-1">
    <ul class="nav navbar-nav">
    
    <c:choose> 
 	<c:when test="${sessionScope.perfil.equals('administrador')}">
    <li class="active"><a href="#" onClick="location.reload();">Partidos</a></li>
    <li><a href="#" data-seleccion="grupos">Grupos</a></li>
    <li><a href="#" data-seleccion="consultarUsuarios">Usuarios</a></li>
    <script type="text/javascript" src="js/principal.js"></script>
  	</c:when>
  	<c:otherwise>
      <li ><a href="#" data-seleccion="apuesta">Apuestas</a></li>
      <li><a href="#" data-seleccion="gruposU">Grupos</a></li>
      <li><a href="#" data-seleccion="verApuesta">Mis Apuetas</a></li>
      <script type="text/javascript" src="js/principal2.js"></script>
  	</c:otherwise>
	</c:choose>
	
    </ul>
    <ul class="nav navbar-nav navbar-right">
     
 	<c:choose> 
 	<c:when test="${sessionScope.perfil.equals('usuario')}">
   	<li><a href="#"  data-seleccion="usuarios"><span class="glyphicon glyphicon-user"></span>  Mi Cuenta</a></li>
   
							
    </c:when>
  	<c:otherwise>
  	<!-- Trigger the modal with a button -->
  	<li><a href="#"    data-toggle="modal" data-target="#terminar"><span class="glyphicon glyphicon-user"></span>  Terminar Torneo</a></li>
  	<!-- Modal -->
	<div id="terminar" class="modal fade" role="dialog">
  <div class="modal-dialog">

    <!-- Modal content-->
    <div class="modal-content">
      <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal">&times;</button>
        <h4 class="modal-title">Terminar el Mundial</h4>
      </div>
      <div class="modal-body">
      <form action="TerminarController" method="post">
      <br>
		<center>
		<button class="btn btn-danger">Terminar</button>
		</center>
      </form>
       
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
      </div>
    </div>

  </div>
</div>
    </c:otherwise>
	</c:choose>
	<a class="navbar-brand" href="ValidarSesionController?sesion=noactivaja" ><span class="glyphicon glyphicon-log-in"></span>Sign Up</a>
    </ul>
    
  </div>
  </div>
</nav>



<div id="contenedor"></div>
<div>
	<table id="hola"></table>

</div>
<footer class="footerHome">

<div class="container">

	<h4 class="textFooter">
		<span>Derechos de autor reservados por Mundo Apuestas</span>
	</h4>

	<h4 class="textFooter">
		<a class="myicon-red" target="_blank" href="https://www.facebook.com/">
			<i class=" fab fa-facebook-square"></i> Facebook
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

<script type="text/javascript" src="js/seleccion.js"></script>


</body>
</html>
