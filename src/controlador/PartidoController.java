package controlador;

import java.io.IOException;
import java.sql.Date;
import java.sql.Timestamp;
import java.text.ParseException;
import java.text.SimpleDateFormat;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import util.Procesos;
import util.ProcesosApuesta;

/**
 * Servlet implementation class PartidoController
 */
@WebServlet("/PartidoController")
public class PartidoController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public PartidoController() {
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
		// <input type="hidden" name="select" value="registro">

		if (select == 0) {

			// Registrar Partido
			Procesos p = new Procesos();

			
			int eLocal = Integer.parseInt(request.getParameter("local"));
			int evisitante = Integer.parseInt(request.getParameter("visitante"));
			String estado = request.getParameter("estado");
			String fase = request.getParameter("fase");
			String f =  request.getParameter("fecha");
			String h =  request.getParameter("hora");
			SimpleDateFormat formatter = new SimpleDateFormat("yyyy-MM-dd");
			java.util.Date fecha = null;
			try {
				fecha =  formatter.parse(f);
			} catch (ParseException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			
			java.sql.Date date=new java.sql.Date(fecha.getTime());
			Timestamp timestamp = new Timestamp(date.getTime());
			
			p.registrarPartido(eLocal, evisitante, estado,fase,timestamp,h);
			
			//RequestDispatcher rd = request.getRequestDispatcher("home.jsp");
			response.sendRedirect("home.jsp");
			//rd.forward(request, response);

		} else if (select == 1) {

			// Actualizar Partidos
			Procesos p = new Procesos();
			ProcesosApuesta pa = new ProcesosApuesta();

			int id = Integer.parseInt(request.getParameter("idPartido"));
			String eLocal = request.getParameter("local");
			String evisitante = request.getParameter("visitante");
			String estado = request.getParameter("estado");
			int glocal = Integer.parseInt(request.getParameter("glocal"));
			int gvisitante = Integer.parseInt(request.getParameter("gvisitante"));

			p.actualizarPartido(id, eLocal, evisitante, glocal, gvisitante,estado);
			
			if (estado.equals("Finalizado")){
				pa.validarApuesta();
			}
			
			pa.actualizarEstAp();
		
			
			//RequestDispatcher rd = request.getRequestDispatcher("home.jsp");
			response.sendRedirect("home.jsp");
			//rd.forward(request, response);

		} else if (select == 2) {

			// Eliminar Partidos
			Procesos p= new Procesos();

			int id = Integer.parseInt(request.getParameter("idPartido"));
			p.EliminarPartido(id);

			//RequestDispatcher rd = request.getRequestDispatcher("home.jsp");
			response.sendRedirect("home.jsp");
			//rd.forward(request, response);

		}
	
	}
}
