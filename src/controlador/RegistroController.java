package controlador;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.util.*;
import org.apache.commons.fileupload.*;
import org.apache.commons.fileupload.disk.*;
import org.apache.commons.fileupload.servlet.*;
import  org.apache.commons.io.*;
import java.io.*;
import util.Procesos;

/**
 * Servlet implementation class RegistroController
 */
@WebServlet("/RegistroController")
public class RegistroController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public RegistroController() {
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
		
		
		int select = Integer.parseInt(request.getParameter("seleccion"));
		// <input type="hidden" name="select" value="registro">
		
		
		if (select == 0) {
		Procesos p = new Procesos();
		
		String nombre = request.getParameter("nombre");
		String correo = request.getParameter("correo");
		String telefono=request.getParameter("telefono");
		int cedula = Integer.parseInt(request.getParameter("cedula"));
		String password= request.getParameter("password");
		String estadoPago="faltante";
		
	   try {
		   p.registrarUsuario(correo, cedula, estadoPago, nombre, password, telefono);
		   response.sendRedirect("http://localhost:8080/ProyectoWeb/index.jsp");
	   } catch (Exception e) {
		   request.setAttribute("entrar", "falso");
		   System.out.println("entre aqui");
		   RequestDispatcher rd = request.getRequestDispatcher("RegistroUsuario.jsp");
		   rd.forward(request, response);
	   }
	   
		}else {
		}
}
}
