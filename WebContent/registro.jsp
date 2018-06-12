<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
<link
	href="//maxcdn.bootstrapcdn.com/bootstrap/3.3.0/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
<!-- Website Font style -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.6.1/css/font-awesome.min.css">

<!-- Google Fonts -->
<link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.0.13/css/all.css" integrity="sha384-DNOHZ68U8hZfKXOrtjWvjxusGo9WQnrNx2sqG0tfsghAvtVlRW3tvkXWZh58N9jp" crossorigin="anonymous">
<link rel="stylesheet" href="css/login.css">

<script src="//maxcdn.bootstrapcdn.com/bootstrap/3.3.0/js/bootstrap.min.js"></script>


<title>Registro</title>
</head>
<body>

	<div class="container">
		<div class="row main">
			<div class="panel-heading">
				<div class="panel-title text-center">
					<h1 class="title">Mundo Apuestas</h1>
					<h4>
						<small>Formulario de registro<small>
					</h4>
					<hr/>
				</div>
			</div>
			<div class="main-login main-center">
				<form class="form-horizontal" action="RegistroController"
					method="post">
					<input type="hidden" name="seleccion" value="0">
					<div class="form-group">
						<label for="nombre" class="cols-sm-2 control-label">Nombre</label>
						<div class="cols-sm-10">
							<div class="input-group">
								<span class="input-group-addon"><i class="fa fa-user fa"
									aria-hidden="true"></i></span> <input type="text" class="form-control"
									name="nombre" id="nombre" placeholder="Ingresa tu nombre"
									required />
							</div>
						</div>
					</div>

					<div class="form-group">
						<label for="correo" class="cols-sm-2 control-label">Email</label>
						<div class="cols-sm-10">
							<div class="input-group">
								<span class="input-group-addon"><i
									class="fa fa-envelope fa" aria-hidden="true"></i></span> <input
									type="email" class="form-control" id="email" name="correo"
									placeholder="Ingresa tu Email" required />
							</div>
						</div>
					</div>

					<div class="form-group">
						<label for="telefono" class="cols-sm-2 control-label">Telefono</label>
						<div class="cols-sm-10">
							<div class="input-group">
								<span class="input-group-addon"><i class="fa fa-users fa"
									aria-hidden="true"></i></span> <input type="number"
									class="form-control" name="telefono" id="telefono"
									placeholder="Ingresa tu telefono" required />
							</div>
						</div>
					</div>
					<div class="form-group">
						<label for="cedula" class="cols-sm-2 control-label">Cedula</label>
						<div class="cols-sm-10">
							<div class="input-group">
								<span class="input-group-addon"><i class="fa fa-users fa"
									aria-hidden="true"></i></span> <input type="number"
									class="form-control" name="cedula" id="cedula"
									placeholder="Ingresa tu cedula" required />
							</div>
						</div>
					</div>

					<div class="form-group">
						<label for="password" class="cols-sm-2 control-label">Password</label>
						<div class="cols-sm-10">
							<div class="input-group">
								<span class="input-group-addon"><i
									class="fa fa-lock fa-lg" aria-hidden="true"></i></span> <input
									type="password" class="form-control" name="password"
									id="password" placeholder="Enter your Password" required />
							</div>
						</div>
					</div>


					<div class="form-group">
						<label for="confirm" class="cols-sm-2 control-label">Informacion de pago </label>
						<div class="cols-sm-10">
							
								<button type="button" class="btn btn-primary" data-toggle="modal"
									data-target="#ver"> Ver <span class="fas fa-edit"></span>
								</button>

								<!-- Trigger the modal with a button -->

								<!-- Modal -->
								<div id="ver" class="modal fade" role="dialog">
									<div class="modal-dialog">
										<!-- Modal content-->
										<div class="modal-content">
											<div class="modal-header">
												<button type="button" class="close" data-dismiss="modal">&times;</button>
												<h3 class="modal-title">Informacion de pago</h3>
											</div>
											<div class="modal-body col-md-12 col-sm-12 col-xs-12">
												<p>Para que puedas empezar a apostar con nosotros es
													necesario que des un aporte de $16.000 pesos. Este dinero
													es todo lo que necesitas apostar y con ello tendrás derecho
													a apostar en todos los partidos de este mundial Rusia 2018</p>
												<h3>
													<stronge>Consignación</stronge>
												</h3>
												<p>Debes consignar en el banco Bancolombia la suma de
													dieciséis mil pesos ($16.000) al número de cuenta
													No. 49787303420</p>
												<p>Una vez hayas pagado debes de tomar una foto clara
													a la consignación y subirla a nuestro sistema en la sección
													mi cuenta una vez la subas debes esperar a que nosotros la validemos y la
													aprobemos</p>
												<p>Cuando ya tengas te recibo de pago validado y aprobado podrás
													empezar a realizar todas las apuestas que desees</p>

												<h3>Que te diviertas!!</h3>

											</div>
											<div class="modal-footer">
												<button type="button" class="btn btn-default"
													data-dismiss="modal">Close</button>
											</div>
										</div>

									</div>
								
							</div>
						</div>
					</div>

					<div class="form-group ">
						<button type="submit"
							class="btn btn-primary btn-lg btn-block login-button">Registrar</button>
					</div>
					<div class="login-register">
						<strong> <a style="color: #FFFFFF" href="index.jsp">Login</a>
							<strong>
					</div>
				</form>
			</div>
		</div>
	</div>

</body>
</html>