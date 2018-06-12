package controlador;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 * Servlet implementation class ValidarSesionController
 */
@WebServlet("/ValidarSesionController")
public class ValidarSesionController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ValidarSesionController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession sesion = request.getSession();
		sesion.invalidate();
		System.out.println("entre aqui");
        response.sendRedirect("http://localhost:8080/ProyectoWeb/index.jsp");
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String login = request.getParameter("login");
		System.out.println("que mas jovenes");
		
		if (login.equals("1")){
			HttpSession misession= (HttpSession) request.getSession();
			 
			String correo= (String) misession.getAttribute("correo");
			
			if (correo.isEmpty()){
				response.sendRedirect("http://localhost:8080/ProyectoWeb/home.jsp");
			}
		}
	}

}
