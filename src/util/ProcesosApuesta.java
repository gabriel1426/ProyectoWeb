package util;

import java.util.ArrayList;
import java.util.List;

import entitys.Apuesta;
import entitys.Partido;
import entitys.TipoApuesta;
import entitys.Usuario;
import model.ApuestaDao;
import model.IProcesosDB;
import model.PartidoDao;
import model.TipoApuestaDao;
import model.UsuarioDao;

public class ProcesosApuesta {
	

	public void registrarApuesta(String estado, int tipoApuesta, int gEquipo1, int gEquipo2, String equipo, String usuario, int partido) {
		
		IProcesosDB<Partido> partidoDao = new PartidoDao();
		Partido p = partidoDao.find(partido);
		
		if(p.getEstado().equalsIgnoreCase("activo")) {
			IProcesosDB<TipoApuesta> tipoApuestaDao = new TipoApuestaDao();
			TipoApuesta ta = tipoApuestaDao.find(tipoApuesta);
			IProcesosDB<Usuario> usuarioDao = new UsuarioDao();
			Usuario u = usuarioDao.find(usuario);
			Apuesta a = new Apuesta(estado, ta, gEquipo1, gEquipo2, equipo, u, p);
			IProcesosDB<Apuesta> apuestaDao= new ApuestaDao();
			apuestaDao.insert(a);
		}else {
			//MOSTRAR UN MENSAJE DE QUE YA NO SE PUEDE APOSTAR PARA ESTE PARTIDO O
			//MIRAR LA OPCION DE NO MOSTRAR LOS PARTIDOS A LOS CUALES YA NO SE PUEDEN APOSTAR
		}
	}
	
	public void actualizarApuesta(int id, String estado, int tipoApuesta, int gEquipo1, int gEquipo2, String equipo, String usuario, int partido) {
		
		
		
			IProcesosDB<TipoApuesta> tipoApuestaDao = new TipoApuestaDao();
			TipoApuesta ta = tipoApuestaDao.find(tipoApuesta);
			IProcesosDB<Apuesta> apuestaDao= new ApuestaDao();
			Apuesta a = apuestaDao.find(id);
			a.setEstado(estado);
			a.setTipoApuesta(ta);
			a.setGEquipo1(gEquipo1);
			a.setGEquipo2(gEquipo2);
			a.setEquipo(equipo);
			apuestaDao.update(a);
		
	}


	public void eliminarApuesta(int id) {
		
		IProcesosDB<Apuesta> apuestaDao= new ApuestaDao();
		Apuesta a = apuestaDao.find(id);
		if(a.getEstado().equalsIgnoreCase("activa")) {
			apuestaDao.delete(a);
		}else {
			//MOSTRAR UN MENSAJE DE QUE YA NO SE PUEDE ELIMINAR LA APUESTA PORQUE YA ESTA EN CURSO
		}
	}
	

	
	public void actualizarEstAp() {
		
		IProcesosDB<Apuesta> apuestaDao= new ApuestaDao();
		List<Apuesta> a = apuestaDao.list();
		
		for(Apuesta ap: a){
			int idPart = ap.getPartido().getIdPartido();
			IProcesosDB<Partido> partidoDao = new PartidoDao();
			Partido p = partidoDao.find(idPart);
			if(p != null && p.getEstado().equalsIgnoreCase("Activo")) {
				IProcesosDB<Apuesta> apuesta = new ApuestaDao();
				Apuesta apu = apuesta.find(ap.getIdApuesta());
				apu.setEstado("Activo");
				apuestaDao.update(apu);
			} else if(p != null && p.getEstado().equalsIgnoreCase("En curso")) {
				
				
				IProcesosDB<Apuesta> apuesta = new ApuestaDao();
				Apuesta apu = apuesta.find(ap.getIdApuesta());
				apu.setEstado("En curso");
				apuestaDao.update(apu);
			} else if(p != null && p.getEstado().equalsIgnoreCase("Finalizado")) {
				IProcesosDB<Apuesta> apuesta = new ApuestaDao();
				Apuesta apu = apuesta.find(ap.getIdApuesta());
				apu.setEstado("Finaliazo");
				
			}
		}
	}
	
	public void validarApuesta() {
		
		boolean res = false;
		
		IProcesosDB<Apuesta> apuestaDao = new ApuestaDao();
		List<Apuesta> apu = apuestaDao.list();
		
		for (Apuesta ap:apu){
			
			if (ap.getEstado().equals("Activo")){
				int idPart = ap.getPartido().getIdPartido();
				IProcesosDB<Partido> partidoDao = new PartidoDao();
				Partido p = partidoDao.find(idPart);
				String correo = ap.getUsuario().getCorreo();
				IProcesosDB<Usuario> usuarioDao = new UsuarioDao();
				Usuario u = usuarioDao.find(correo);
				
				if(ap.getTipoApuesta().getIdTipo()==2) {
					
					if(p.getGEquipo1() > p.getGEquipo2()) {
						res = p.getEquipo1().getNombre().equalsIgnoreCase(ap.getEquipo());
						if(res) {
							u.setPuntos(u.getPuntos()+3);
							usuarioDao.update(u);
						}
					} else if(p.getGEquipo1() < p.getGEquipo2()) {
						res = p.getEquipo2().getNombre().equalsIgnoreCase(ap.getEquipo());
						if(res) {
							u.setPuntos(u.getPuntos()+3);
							usuarioDao.update(u);
						}
					} else if(p.getGEquipo1() == p.getGEquipo2()) {
						res = ap.getEquipo().equalsIgnoreCase("empate");
						if(res) {
							u.setPuntos(u.getPuntos()+3);
							usuarioDao.update(u);
						}
					}
				}else if(ap.getTipoApuesta().getIdTipo()==1) {
					if(ap.getGEquipo1() == p.getGEquipo1() && ap.getGEquipo2() == p.getGEquipo2()) {
						
						u.setPuntos(u.getPuntos()+5);
						usuarioDao.update(u);
					} else if(ap.getGEquipo1() == p.getGEquipo1() && ap.getGEquipo2() != p.getGEquipo2() && p.getGEquipo1() > p.getGEquipo2() 
							&& ap.getGEquipo1() > ap.getGEquipo2()) {
						
						u.setPuntos(u.getPuntos()+3);
						usuarioDao.update(u);
					} else if(ap.getGEquipo1() != p.getGEquipo1() && ap.getGEquipo2() == p.getGEquipo2() && p.getGEquipo1() > p.getGEquipo2() 
							&& ap.getGEquipo1() > ap.getGEquipo2()) {
						
						u.setPuntos(u.getPuntos()+1);
						usuarioDao.update(u);
					} else if(ap.getGEquipo1() != p.getGEquipo1() && ap.getGEquipo2() != p.getGEquipo2() && p.getGEquipo1() > p.getGEquipo2() 
							&& ap.getGEquipo1() > ap.getGEquipo2()) {
						
						u.setPuntos(u.getPuntos()+2);
						usuarioDao.update(u);
					} else if(ap.getGEquipo1() == p.getGEquipo1() && ap.getGEquipo2() != p.getGEquipo2() && p.getGEquipo1() < p.getGEquipo2() 
							&& ap.getGEquipo1() < ap.getGEquipo2()) {
						
						u.setPuntos(u.getPuntos()+3);
						usuarioDao.update(u);
					} else if(ap.getGEquipo1() != p.getGEquipo1() && ap.getGEquipo2() == p.getGEquipo2() && p.getGEquipo1() < p.getGEquipo2() 
							&& ap.getGEquipo1() < ap.getGEquipo2()) {
						
						u.setPuntos(u.getPuntos()+1);
						usuarioDao.update(u);
					} else if(ap.getGEquipo1() != p.getGEquipo1() && ap.getGEquipo2() != p.getGEquipo2() && p.getGEquipo1() < p.getGEquipo2() 
							&& ap.getGEquipo1() < ap.getGEquipo2()) {
						
						u.setPuntos(u.getPuntos()+2);
						usuarioDao.update(u);
					}
				}
				
		}
		}
			
		
	}

	public List<Apuesta> listarApustas() {
		IProcesosDB<Apuesta> apuesta = new ApuestaDao();
		List<Apuesta> apu = apuesta.listApuesta();
		return apu;
	}		
	
	public List<Apuesta> listarApustasCliente(String cliente) {
		IProcesosDB<Apuesta> apuesta = new ApuestaDao();
		List<Apuesta> apu = apuesta.listApuesta();
		List<Apuesta> aux = new ArrayList();
		
		
		for(Apuesta ap:apu){
			if (cliente.equals(ap.getUsuario().getCorreo())){
				aux.add(ap);
			}
		}
		return aux;
	}

	public Apuesta buscarApusta(int apuesta) {
		
		IProcesosDB<Apuesta> ap = new ApuestaDao();
		Apuesta apu = ap.find(apuesta);
		return apu;
	}
	
	

}
