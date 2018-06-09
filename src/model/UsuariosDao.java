package model;


import entitys.Usuario;
import util.Conexion;

public class UsuariosDao extends Conexion<Usuario> 
implements IProcesosDB<Usuario>{
	
	public UsuariosDao() {
		// TODO Auto-generated constructor stub
		super(Usuario.class);
	}
	

}