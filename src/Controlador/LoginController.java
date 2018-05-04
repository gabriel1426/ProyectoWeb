package Controlador;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import Model.ProcesosBD;
import Util.Procesos;



/**
 * Servlet implementation class LoginController
 */

@WebServlet("/LoginController")
public class LoginController extends HttpServlet {
	private static final long serialVersionUID = 1L;

    /**
     * Default constructor. 
     */
	
	ProcesosBD myNegocio = new ProcesosBD();
    public LoginController() {
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

	/**bv
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		
		Procesos p = new Procesos();
		
		String correo = request.getParameter("correo");
		System.out.println(correo);
		String password = request.getParameter("password");
		
		boolean login = p.login(correo, password);
		
		if (login==true){
	
		RequestDispatcher rd = request.getRequestDispatcher("home.jsp");
		rd.forward(request, response);
		} else{
			System.out.println("No pudo entrar");
		}
		
		
	}

}
