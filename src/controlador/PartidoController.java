package controlador;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import util.Procesos;

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
			int eVicitante = Integer.parseInt(request.getParameter("vicitante"));
			String estado = request.getParameter("estado");
			System.out.println( eLocal+"---"+eVicitante);

			p.registrarPartido(eLocal, eVicitante, estado);
			System.out.println(eLocal+"--"+eVicitante+"--"+estado+"Controler");
			//RequestDispatcher rd = request.getRequestDispatcher("home.jsp");
			response.sendRedirect("http://localhost:8080/ProyectoWeb/home.jsp");
			//rd.forward(request, response);

		} else if (select == 1) {

			// Actualizar Partidos
			Procesos p = new Procesos();

			int id = Integer.parseInt(request.getParameter("idPartido"));
			String eLocal = request.getParameter("local");
			String eVicitante = request.getParameter("vicitante");
			String estado = request.getParameter("estado");
			int glocal = Integer.parseInt(request.getParameter("glocal"));
			int gvicitante = Integer.parseInt(request.getParameter("gvicitante"));

			p.actualizarPartido(id, eLocal, eVicitante, glocal, gvicitante,estado);

			RequestDispatcher rd = request.getRequestDispatcher("home.jsp");
			rd.forward(request, response);

		} else if (select == 2) {

			// Eliminar Partidos
			Procesos p= new Procesos();

			int id = Integer.parseInt(request.getParameter("idPartido"));
			p.EliminarPartido(id);

			RequestDispatcher rd = request.getRequestDispatcher("home.jsp");
			rd.forward(request, response);

		}
	
	}
}
