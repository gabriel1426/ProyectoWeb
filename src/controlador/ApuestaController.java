package controlador;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import entitys.Apuesta;
import util.ProcesosApuesta;

/**
 * Servlet implementation class ApuestaController
 */
@WebServlet("/ApuestaController")
public class ApuestaController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ApuestaController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		int select = Integer.parseInt(request.getParameter("metodo"));
		HttpSession misession= (HttpSession) request.getSession();
		String usuario= (String) misession.getAttribute("correo");
		ProcesosApuesta p = new ProcesosApuesta();
		// <input type="hidden" name="select" value="registro">

		if (select == 1) {
			
			int idpartido = Integer.parseInt(request.getParameter("idPartido1"));
			int gequipo1 = Integer.parseInt(request.getParameter("glocal22"));
			int gequipo2= Integer.parseInt(request.getParameter("gvisitante22"));
			
			int apuesta = Integer.parseInt(request.getParameter("apuesta2"));
			Apuesta lap = p.buscarApusta(apuesta);
			if (lap!=null){
			p.actualizarApuesta(lap.getIdApuesta(),"Activo",1, gequipo1,gequipo2, "", usuario, idpartido);
					response.sendRedirect("home.jsp");
					return;
			}else {
		
			p.registrarApuesta("Activo",1, gequipo1,gequipo2, "", usuario, idpartido);
			response.sendRedirect("home.jsp");
			}
		}else if (select == 2) {
			
			int idpartido = Integer.parseInt(request.getParameter("idPartido2"));
			String ganador= request.getParameter("apuesta");
			
			int apuesta = Integer.parseInt(request.getParameter("apuesta2"));
			Apuesta lap = p.buscarApusta(apuesta);
			if (lap==null){
			p.registrarApuesta("Activo",2, 0, 0, ganador, usuario, idpartido);
			response.sendRedirect("home.jsp");
			}else {
				p.actualizarApuesta(lap.getIdApuesta(),"Activo",2, 0, 0, ganador, usuario, idpartido);
				Apuesta lapq = p.buscarApusta(apuesta);
				System.out.println(lap.getIdApuesta()+"actualizo");
				response.sendRedirect("home.jsp");
			}
		}else if (select == 3){
			
			int idpartido = Integer.parseInt(request.getParameter("idPartido1"));
			int gequipo1 = Integer.parseInt(request.getParameter("glocal22"));
			int gequipo2= Integer.parseInt(request.getParameter("gvisitante22"));
			
			List<Apuesta> apues=p.listarApustas();
			
			for (Apuesta aux:apues){
				if (aux.getPartido().getIdPartido()==idpartido&&aux.getUsuario().getCorreo()==usuario){
					p.actualizarApuesta(aux.getIdApuesta(),"Activo",1, gequipo1,gequipo2, "", usuario, idpartido);
					response.sendRedirect("home.jsp");
					return;
				}
			}
			
			p.registrarApuesta("Activo",1, gequipo1,gequipo2, "", usuario, idpartido);
			response.sendRedirect("home.jsp");
			
			
		}else {

			int idpartido = Integer.parseInt(request.getParameter("idPartido2"));
			String ganador= request.getParameter("apuesta");
			
			List<Apuesta> apues=p.listarApustas();
			
			for (Apuesta aux:apues){
				if (aux.getPartido().getIdPartido()==idpartido&&aux.getUsuario().getCorreo()==usuario){
					p.actualizarApuesta(aux.getIdApuesta(),"Activo",2, 0, 0, ganador, usuario, idpartido);
					response.sendRedirect("home.jsp");
					return;
				}
			}
			
			p.registrarApuesta("Activo",2, 0, 0, ganador, usuario, idpartido);
			response.sendRedirect("home.jsp");
			
		}
		
		
	}

}
