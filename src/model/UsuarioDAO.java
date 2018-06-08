package model;


import entitys.Usuario;
import util.Conexion;

public class UsuarioDAO extends Conexion<Usuario> 
implements IProcesosDB<Usuario>{
	
	public UsuarioDAO() {
		// TODO Auto-generated constructor stub
		super(Usuario.class);
	}
	

}
