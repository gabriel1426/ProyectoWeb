<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
    <meta charset="utf-8" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <title>Registro Usuario</title>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" integrity="sha384-BVYiiSIFeK1dGmJRAkycuHAHRg32OmUcww7on3RYdg4Va+PmSTsz/K68vbdEjh4u" crossorigin="anonymous">
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap-theme.min.css" integrity="sha384-rHyoN1iRsVXV4nD0JutlnGaslCJuC7uwjduW9SVrLvRYooPp2bWYgmgJQIXwl/Sp" crossorigin="anonymous">
    <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.0.10/css/all.css" integrity="sha384-+d0P83n9kaQMCwj8F4RJB66tzIwOKmrdb46+porD/OvrJ+37WqIM7UoBtwHO6Nlg" crossorigin="anonymous">
    <link rel="stylesheet" href="css/estilos.css">
   
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js" integrity="sha384-Tc5IQib027qvyjSMfHjOMaLkfuWVxZxUPnCJA7l2mCWNIpG9mGCD8wGNIcPD7Txa" crossorigin="anonymous"></script>
</head>
<body class="mybody-login">

        <div class="mydiv-Registrousuario container">
           
            <div class="row">
               <center><h1>Formulario de registro</h1></center> 
            </div>
           <div class="row">
            <form  action="RegistroController" method="post" class="form-horizontal myfom-registro">
				<input type="hidden" name="seleccion" value="0">
                <div class="form-group col-md-12">

                    <label class="control-label col-md-2" for="nombre">Nombre: </label>
                    <div class="col-md-9 col-sm-12">
                    <input type="text" name="nombre" id="nombre" class="form-control" placeholder="Nombre" required>
                    </div>
                </div>
                <div class="form-group col-md-12 ">
                    <label class="control-label col-md-2" for="nombre">E-mail: </label>
                    <div class="col-md-9 col-sm-12">
                    <input type="email" id="email" name="correo" class="form-control" placeholder="example@example.com" required>
                    </div>
                </div>
                <div class="form-group col-md-12">
                    <label class="control-label col-md-2 " for="nombre">Telefono: </label>
                    <div class="col-md-9 col-sm-12">
                    <input type="number" name="telefono" id="telefono" class="form-control" placeholder="Telefono" required>
                    </div>
                </div>
                <div class="form-group col-md-12">
                    <label class="control-label col-md-2" for="nombre">CC: </label>
                    <div class="col-md-9 col-sm-12">
                    <input type="number" name="cedula" id="cedula" class="form-control" placeholder="CC" required>
                    </div>
                </div>
                <div class="form-group col-md-12">
                    <label class="control-label col-md-2" for="contraseña">Contraseña: </label>
                    <div class="col-md-9 col-sm-12">
                    <input type="text" name="password" id="password" class="form-control" placeholder="Contraseña" required>
                    </div>
                </div>
                <div style="display:none;">
                <div id="content">
   				
				</div>
                </div>
                <div class="form-group col-md-12">
                    <label class="control-label col-md-2" for="nombre">Instrucciones de pago: </label>
                    <div class="col-md-9 col-sm-12">
                    <a class="btn btn-primary" id="cmd">Ver</a>
                    </div>
                </div>
                
                <div class="form-group col-md-12">
                    <div class="col-md-9 col-md-offset-5 col-sm-12 col-sm-offset-4 col-xs-offset-3">
                    <button type="submit" value="Registrar" class="btn btn-success">Registrar</button>
                </div>
                </div>

            </form>
        </div>
    </div>


    <footer class="container-fluid class="col-md-12"">
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