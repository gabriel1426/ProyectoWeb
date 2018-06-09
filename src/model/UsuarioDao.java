package model;


import entitys.Usuario;
import util.Conexion;

public class UsuarioDao extends Conexion<Usuario> 
implements IProcesosDB<Usuario>{
	
	public UsuarioDao() {
		// TODO Auto-generated constructor stub
		super(Usuario.class);
	}
	

}
