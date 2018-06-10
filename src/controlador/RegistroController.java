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
		
	   
	    p.registrarUsuario(correo, cedula, estadoPago, nombre, password, telefono);

	    response.sendRedirect("http://localhost:8080/ProyectoWeb/index.jsp");
		}else {
			Procesos p = new Procesos();
			/*FileItemFactory es una interfaz para crear FileItem*/
	        FileItemFactory file_factory = new DiskFileItemFactory();
	 
	        /*ServletFileUpload esta clase convierte los input file a FileItem*/
	        ServletFileUpload servlet_up = new ServletFileUpload(file_factory);
	        /*sacando los FileItem del ServletFileUpload en una lista */
	        List items = null;
			try {
				items = servlet_up.parseRequest(request);
			} catch (FileUploadException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
	 
	        for(int i=0;i<items.size();i++){
	            /*FileItem representa un archivo en memoria que puede ser pasado al disco duro*/
	            FileItem item = (FileItem) items.get(i);
	            /*item.isFormField() false=input file; true=text field*/
	            if (! item.isFormField()){
	                /*cual sera la ruta al archivo en el servidor*/
	                File archivo_server = new File("C:/Users/Gabriel Contreras/workspace/ProyectoWeb/WebContent/recibosDePago/"+item.getName());
	                String recibo="C:/Users/Gabriel Contreras/workspace/ProyectoWeb/WebContent/recibosDePago/"+item.getName();
	                p.guardarRecibo(recibo);
	                /*y lo escribimos en el servido*/
	                try {
						item.write(archivo_server);
					} catch (Exception e) {
						// TODO Auto-generated catch block
						e.printStackTrace();
					}
	               
		}
	}
	        response.sendRedirect("http://localhost:8080/ProyectoWeb/home.jsp");
		}
}
}
