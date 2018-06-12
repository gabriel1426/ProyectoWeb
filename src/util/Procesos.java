package util;


import javax.servlet.RequestDispatcher;

import com.google.gson.Gson;

import entitys.Equipo;
import entitys.Partido;
import entitys.Usuario;
import model.EquipoDao;
import model.IProcesosDB;
import model.PartidoDao;
import model.UsuarioDao;
import model.UsuariosDao;

import java.sql.Timestamp;
import java.util.ArrayList;
import java.util.List;

public class Procesos {
	
	
	
	public boolean login(String correo,String password){
		IProcesosDB<Usuario> usDao= new UsuarioDao();
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

	
	public void registrarUsuario(String correo, int cedula, String estadoPago, String nombre, String password,
			String telefono) {
		Usuario usuario=new Usuario(correo, cedula, estadoPago, nombre, password, telefono);
		IProcesosDB<Usuario> usDao= new UsuarioDao();
		usDao.insert(usuario);
	}
	
	public List<Usuario> listarUsuarios(){
		
		IProcesosDB<Usuario> us= new UsuariosDao();
		List<Usuario> u = us.list();
		
		//List<Equipo> aux= new ArrayList<Equipo>();
		//Gson gson = new Gson();
		//String json1 = gson.toJson(aux);
		
		return u;
			
	}
	
	public Usuario buscarUsuario(String correo) {
		
		IProcesosDB<Usuario> us= new UsuariosDao();
		Usuario u = us.find(correo);
		return u;
	}
	
	public List<Equipo> ListarGrupos(){
		
		IProcesosDB<Equipo> equipoDao= new EquipoDao();
		List<Equipo> e = equipoDao.list();
		
		//List<Equipo> aux= new ArrayList<Equipo>();
		//Gson gson = new Gson();
		//String json1 = gson.toJson(aux);
		
		return e;
			
	}
	


	public void registrarPartido(int eLocal, int eVicitante, String estado,String fase, Timestamp fecha) {
	
		
		
		
		IProcesosDB<Equipo> equipoDao= new EquipoDao();
		Equipo e1 = equipoDao.find(eLocal);
		Equipo e2 = equipoDao.find(eVicitante);
		Partido p = new Partido(estado, 0, 0, e1, e2,fase,fecha);
		IProcesosDB<Partido> parDao= new PartidoDao();
		parDao.insert(p);
		
	}


	public void actualizarPartido(int id, String eLocal, String eVicitante, int glocal, int gvicitante, String estado) {
		
		IProcesosDB<Partido> parDao= new PartidoDao();
		Partido p=parDao.find(id);
		p.setGEquipo1(glocal);
		p.setGEquipo2(gvicitante);
		p.setEstado(estado);
		
		parDao.update(p);
		
	}


	public void EliminarPartido(int id) {
		
		IProcesosDB<Partido> parDao= new PartidoDao();
		Partido p=parDao.find(id);
		parDao.delete(p);
		
	}
	
	public List<Partido> listarPartidos(){
		
		IProcesosDB<Partido> partidoDao= new PartidoDao();
		List<Partido> e = partidoDao.list();
		
		for(Partido p: e){
			
		}
		
		return e;
			
	}


	public void guardarRecibo(String recibo,String correo) {
		// TODO Auto-generated method stub
		IProcesosDB<Usuario> us= new UsuariosDao();
		Usuario u = us.find(correo);
		u.setRecibo(recibo);
		u.setEstadoPago("revision");
		us.update(u);
		
	}
	public void aprobarRecibo(String correo) {
		
		IProcesosDB<Usuario> us= new UsuariosDao();
		Usuario u = us.find(correo);
		u.setEstadoPago("aprobado");
		us.update(u);
		
	}


	public void rechazarRecibo(String correo) {
		
		IProcesosDB<Usuario> us= new UsuariosDao();
		
		Usuario u = us.find(correo);
		u.setRecibo("");
		u.setEstadoPago("faltante");
		us.update(u);
		
	}


	


	
	
}
		

		
	

