<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<jsp:useBean id="jPro" class="util.Procesos" scope="request"></jsp:useBean>

        <div class="mydiv-Registrousuario container">
           
            <div class="row">
               <center><h1>Formulario de registro</h1></center> 
            </div>
           <div class="row">
            <form  action="PartidoController" method="post" class="form-horizontal myfom-registro">

                <div class="form-group col-md-12">
					
                    <label class="control-label col-md-2" for="nombre">Equipo local: </label>
                    <div class="col-md-9 col-sm-12">
                   	 <select name= "local" class="form-control selectpicker" id=""universidad">
						<option value="0" >-----</option>
							<c:forEach items="${jPro.ListarGrupos()}" var="item">
							<option  value="${item.idEquipo}">${item.nombre}</option>
							</c:forEach>
						</select>
                    </div>
                </div>
                <div class="form-group col-md-12">
					
                    <label class="control-label col-md-2" for="nombre">Equipo Vicitante: </label>
                    <div class="col-md-9 col-sm-12">
                   	 <select name= "vicitante" class="form-control selectpicker" id=""universidad">
						<option value="0" >-----</option>
							<c:forEach items="${jPro.ListarGrupos()}" var="item">
							<option  value="${item.idEquipo}">${item.nombre}</option>
							</c:forEach>
						</select>
                    </div>
                </div>
                <div class="form-group col-md-12">
                    <label class="control-label col-md-2 " for="g1">Goles Equipo 1: </label>
                    <div class="col-md-9 col-sm-12">
                    <input type="number" name="g1" id="g1" value="0"class="form-control" placeholder="Telefono">
                    </div>
                </div>
                <div class="form-group col-md-12">
                    <label class="control-label col-md-2 " for="g1">Goles Equipo 1: </label>
                    <div class="col-md-9 col-sm-12">
                    <input type="number" name="g1" id="g1" value="0"class="form-control" placeholder="Telefono">
                    </div>
                </div>
                <div class="form-group col-md-12">
					
                    <label class="control-label col-md-2" for="nombre">Estado: </label>
                    <div class="col-md-9 col-sm-12">
                   	 <select name= "vicitante" class="form-control selectpicker" id=""universidad">
						<option  value="0" >-----</option>
						<option  value="Activo">Activo</option>
						<option  value="En curso">En curso</option>
						<option  value="Finalizado">Finalizado</option>
							
						</select>
                    </div>
                </div>
                <div>
					<br>
					<center><button class="btn btn-success">Ingresar</button></center>
				</div>
                
            </form>
        </div>
    </div>
    <be><br>
