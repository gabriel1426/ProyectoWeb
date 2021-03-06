package controlador;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import entitys.Usuario;
import util.Procesos;



/**
 * Servlet implementation class LoginController
 */

@WebServlet("/LoginController")
public class LoginController extends HttpServlet {
	private static final long serialVersionUID = 1L;

    /**
     * Default constructor. 
     */
	
	
    public LoginController() {
    	super();
        // TODO Auto-generated constructor stub
    }
    
   


	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession sesion = request.getSession();
		sesion.invalidate();
        response.sendRedirect("http://localhost:8080/ProyectoWeb/index.jsp");
	}

	/**bv
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		
		Procesos p = new Procesos();
		
		String correo = request.getParameter("correo");
		String password = request.getParameter("password");
		boolean login = p.login(correo, password);
		
		if (login==true){
	
			HttpSession misession= request.getSession(true);
			Usuario miUsuario= p.buscarUsuario(correo);
			misession.setAttribute("correo",miUsuario.getCorreo());
			misession.setAttribute("nombre",miUsuario.getNombre());
			misession.setAttribute("cedula",miUsuario.getCedula());
			misession.setAttribute("telefono",miUsuario.getTelefono());
			misession.setAttribute("contraseņa",miUsuario.getPassword());
			misession.setAttribute("estado",miUsuario.getEstadoPago());
			misession.setAttribute("perfil",miUsuario.getPerfil());
			misession.setAttribute("puntos",miUsuario.getPuntos());
			
			RequestDispatcher rd = request.getRequestDispatcher("home.jsp");
			rd.forward(request, response);
		} else{
			
			request.setAttribute("entrar", "falso");
			RequestDispatcher rd = request.getRequestDispatcher("index.jsp");
			rd.forward(request, response);
		    
			
		}
		
		
	}

}
