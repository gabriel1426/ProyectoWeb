package controlador;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import entitys.Equipo;
import util.Procesos;

/**
 * Servlet implementation class GruposController
 */
@WebServlet("/GruposController")
public class GruposController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public GruposController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		Procesos p = new Procesos();
		int id = Integer.parseInt(request.getParameter("idGrupo"));
		int puntos = Integer.parseInt(request.getParameter("puntos"));
		String fase = request.getParameter("faseGrupo");
		String estado = request.getParameter("estadoGrupo");
		System.out.println(id+"--"+puntos+"--"+fase+"--"+estado);
		p.actualizarGrupos(id,puntos,fase,estado);
		response.sendRedirect("home.jsp");
	}

}
