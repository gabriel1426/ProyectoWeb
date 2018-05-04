package Model;


import Util.Conexion;
import Entitys.Usuario;

public class UsuarioDAO extends Conexion<Usuario> 
implements IProcesosDB<Usuario>{
	
	public UsuarioDAO() {
		// TODO Auto-generated constructor stub
		super(Usuario.class);
	}
	

}
