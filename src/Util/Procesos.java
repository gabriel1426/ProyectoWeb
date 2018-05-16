package Util;


import javax.servlet.RequestDispatcher;

import com.google.gson.Gson;

import Entitys.Equipo;
import Entitys.Partido;
import Entitys.Usuario;
import Model.EquipoDao;
import Model.IProcesosDB;
import Model.UsuarioDAO;
import java.util.ArrayList;
import java.util.List;

public class Procesos {
	
	
	
	public boolean login(String correo,String password){
		IProcesosDB<Usuario> usDao= new UsuarioDAO();
		Usuario us= usDao.find(correo);
		
		if(us == null){
			return false;
		}
		
		else if(us.getCorreo().equals(correo) && us.getPassword().equals(password)){
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
	
	public String Listargrupos(String grupo){
		
		IProcesosDB<Equipo> equipoDao= new EquipoDao();
		List<Equipo> e = equipoDao.list();
		
		List<Equipo> aux= new ArrayList<Equipo>();
		
		for	(Equipo eq: e){
			
			if(eq.getGrupo().equalsIgnoreCase(grupo)){
				
				aux.add(eq);
			}
		}
		Gson gson = new Gson();
		String json1 = gson.toJson(aux);
		
		return json1;
			
	}
}
		

		
	

