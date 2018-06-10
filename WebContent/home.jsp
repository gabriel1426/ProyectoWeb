<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 5 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta charset="utf-8" />
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>HOME</title>
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
<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
<link rel="stylesheet" href="css/estilos.css">
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"
	integrity="sha384-Tc5IQib027qvyjSMfHjOMaLkfuWVxZxUPnCJA7l2mCWNIpG9mGCD8wGNIcPD7Txa"
	crossorigin="anonymous"></script>

</head>

<header class="myMundo"> <img class="headerImg img-responsive"
	onClick="location.reload();"
	src="http://especiales.semana.com/mundial-rusia-2018/images/logo.png"
	alt="">

<h1>MUNDO APUESTAS</h1>

</header>
<nav class="navbar navbar-default" role="navigation">
<div class="container-fluid">
	<!-- Brand and toggle get grouped for better mobile display -->
	<div class="navbar-header">
		<button type="button" class="navbar-toggle collapsed"
			data-toggle="collapse" data-target="#bs-example-navbar-collapse-1">
			<span class="sr-only">Toggle navigation</span> <span class="icon-bar"></span>
			<span class="icon-bar"></span> <span class="icon-bar"></span>
		</button>
		<a class="navbar-brand" href="#" onClick="location.reload();">Partidos</a>
	</div>

	<!-- Collect the nav links, forms, and other content for toggling -->
	<div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
		<ul class="nav navbar-nav">
			
			<li><a href="#" data-seleccion="grupos">Grupos<span
					class="sr-only">(current)</span></a></li>
			<li><a href="#" data-seleccion="consultarUsuarios">Usuarios<span class="sr-only">(current)</span></a></li>
			<li><a href="#" data-seleccion="usuarios">Usuarios 2</a></li>
			
			<li><a href="#">Apostar</a></li>
			<li><a href="#">Mis puntos</a></li>

		</ul>

		<ul class="nav navbar-nav navbar-right">
			<li><a href="index.jsp">Mi cuenta</a></li>
			<li><a href="index.jsp">Salir</a></li>

		</ul>
	</div>
	<!-- /.navbar-collapse -->
</div>
<!-- /.container-fluid --> </nav>


<div id="contenedor"></div>
<div>
	<table id="hola"></table>

</div>
<footer class="footerHome">

<div class="container">

	<h4 class="textFooter">
		<span>Derechos de autor recerbados por Mundo Pollas</span>
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


<script type="text/javascript">


	$(document).ready(function(event){ 
	$("#contenedor").load('listarPartidos.jsp');

	})

	$("li a").click(function(event){
	event.preventDefault();
	if($(this).data('seleccion')!=null){
	$("#contenedor").load($(this).data('seleccion')+'.jsp');
	}
	});

	
	 
    </script>
    
    <script>
function myFunction() {
  // Declare variables 
  var input, filter, table, tr, td, i;
  input = document.getElementById("myInput");
  filter = input.value.toUpperCase();
  table = document.getElementById("myTable");
  tr = table.getElementsByTagName("tr");

  // Loop through all table rows, and hide those who don't match the search query
  if(filter==="0"){
	 return; }else {
  for (i = 0; i <  tr.length; i++) {
	  
    td = tr[i].getElementsByTagName("td")[4];
   
    if (td) {
      if (td.innerHTML.toUpperCase().indexOf(filter) > -1) {
        tr[i].style.display = "";
        
      } else {
        tr[i].style.display = "none";
      }
    }
    
   
  }
	  }
  
}
</script>

</body>
</html>
