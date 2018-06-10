<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<link href="//maxcdn.bootstrapcdn.com/bootstrap/3.3.0/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
<!-- Website Font style -->
	    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.6.1/css/font-awesome.min.css">
		
<!-- Google Fonts -->
		<link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.0.13/css/all.css" integrity="sha384-DNOHZ68U8hZfKXOrtjWvjxusGo9WQnrNx2sqG0tfsghAvtVlRW3tvkXWZh58N9jp" crossorigin="anonymous">
<link rel="stylesheet" href="css/login.css">
<script src="//maxcdn.bootstrapcdn.com/bootstrap/3.3.0/js/bootstrap.min.js"></script>
<script src="//code.jquery.com/jquery-1.11.1.min.js"></script>
<title>Insert title here</title>
</head>
<body>

	<div class="container">
			<div class="row main">
				<div class="panel-heading">
	               <div class="panel-title text-center">
	               		<h1 class="title">Mundo Apuestas</h1>
	               		<h4 ><small>Formulario de registro<small></h4>
	               		<hr />
	               	</div>
	            </div> 
				<div class="main-login main-center">
					<form class="form-horizontal"  action="RegistroController" method="post">
						<input type="hidden" name="seleccion" value="0">
						<div class="form-group">
							<label for="nombre" class="cols-sm-2 control-label">Nombre</label>
							<div class="cols-sm-10">
								<div class="input-group">
									<span class="input-group-addon"><i class="fa fa-user fa" aria-hidden="true"></i></span>
									<input type="text" class="form-control" name="nombre" id="nombre"  placeholder="Ingresa tu nombre"/>
								</div>
							</div>
						</div>

						<div class="form-group">
							<label for="correo" class="cols-sm-2 control-label">Email</label>
							<div class="cols-sm-10">
								<div class="input-group">
									<span class="input-group-addon"><i class="fa fa-envelope fa" aria-hidden="true"></i></span>
									<input type="text" class="form-control"id="email" name="correo"  placeholder="Ingresa tu Email"/>
								</div>
							</div>
						</div>

						<div class="form-group">
							<label for="telefono" class="cols-sm-2 control-label">Telefono</label>
							<div class="cols-sm-10">
								<div class="input-group">
									<span class="input-group-addon"><i class="fa fa-users fa" aria-hidden="true"></i></span>
									<input type="text" class="form-control"name="telefono" id="telefono"  placeholder="Ingresa tu telefono"/>
								</div>
							</div>
						</div>
						<div class="form-group">
							<label for="cedula" class="cols-sm-2 control-label">Cedula</label>
							<div class="cols-sm-10">
								<div class="input-group">
									<span class="input-group-addon"><i class="fa fa-users fa" aria-hidden="true"></i></span>
									<input type="text" class="form-control" name="cedula" id="cedula"  placeholder="Ingresa tu cedula"/>
								</div>
							</div>
						</div>

						<div class="form-group">
							<label for="password" class="cols-sm-2 control-label">Password</label>
							<div class="cols-sm-10">
								<div class="input-group">
									<span class="input-group-addon"><i class="fa fa-lock fa-lg" aria-hidden="true"></i></span>
									<input type="password" class="form-control"  name="password" id="password"  placeholder="Enter your Password"/>
								</div>
							</div>
						</div>
						<div style="display:none;">
               			<div id="content">
   						</div>
						</div>
						<div class="form-group">
							<label for="confirm" class="cols-sm-2 control-label">Recibo de pago</label>
							<div class="cols-sm-10">
								<div class="input-group">
									
									<a class="btn btn-primary" id="cmd"><i class="fas fa-download" aria-hidden="true"></i>  Descargar</a>
								</div>
							</div>
						</div>

						<div class="form-group ">
							<button type="submit" class="btn btn-primary btn-lg btn-block login-button">Registrar</button>
						</div>
						<div class="login-register">
				            <a href="index.jsp">Login</a>
				         </div>
					</form>
				</div>
			</div>
		</div>
		
		
	<script src="https://cdnjs.cloudflare.com/ajax/libs/jspdf/0.9.0rc1/jspdf.min.js"></script>
    <script type="text/javascript">
    var doc = new jsPDF();
    var specialElementHandlers = {
        '#editor': function (element, renderer) {
            return true;
        }
    };

    $('#cmd').click(function () {   
        doc.fromHTML($('#content').html(), 15, 15, {
            'width': 170,
                'elementHandlers': specialElementHandlers
        });
        doc.save('sample-file.pdf');
    });
    </script>

</body>
</html>