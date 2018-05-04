package Util;

import javax.servlet.RequestDispatcher;

import Entitys.Usuario;
import Model.IProcesosDB;
import Model.UsuarioDAO;

public class Procesos {
	
	
	
	public boolean login(String correo,String password){
		IProcesosDB<Usuario> usDao= new UsuarioDAO();
		Usuario us= usDao.find(correo);
		
		System.out.println(us);
		
		if(us.getCorreo().equals(correo) && us.getPassword().equals(password)){
			return true;
		}else {
			return false;
		}
	}

	
	public void registrarUsuario(String correo, int cedula, boolean estadoPago, String nombre, String password,
			String telefono) {
		Usuario usuario=new Usuario(correo, cedula, estadoPago, nombre, password, telefono, null);
		IProcesosDB<Usuario> usDao= new UsuarioDAO();
		usDao.insert(usuario);
	}
}
		

		
	

