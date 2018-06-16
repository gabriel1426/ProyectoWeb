package controlador;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import entitys.Usuario;
import util.Procesos;

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
		if(request.getParameter("sesion").equals("activa")){
			String correo= (String) sesion.getAttribute("correo");
			Procesos p = new Procesos();
			Usuario u = p.buscarUsuario(correo);
			sesion.setAttribute("estado",u.getEstadoPago());
			sesion.setAttribute("puntos",u.getPuntos());
			response.sendRedirect("home.jsp");
			
		}else {
		sesion.invalidate();
		System.out.println("entre aqui");
        response.sendRedirect("index.jsp");
		}
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
				response.sendRedirect("home.jsp");
			}
		}
	}

}
