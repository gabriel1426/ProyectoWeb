package controlador;

import java.io.File;
import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.commons.fileupload.FileItem;
import org.apache.commons.fileupload.FileItemFactory;
import org.apache.commons.fileupload.FileUploadException;
import org.apache.commons.fileupload.disk.DiskFileItemFactory;
import org.apache.commons.fileupload.servlet.ServletFileUpload;

import entitys.Usuario;
import util.Procesos;

/**
 * Servlet implementation class ReciboPagoController
 */
@WebServlet("/ReciboPagoController")
public class ReciboPagoController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ReciboPagoController() {
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
		HttpSession misession= (HttpSession) request.getSession();
		
		if(request.getParameter("seleccion")==null){
		
		String  usu=  (String) misession.getAttribute("correo");
		System.out.println(usu+"---");
		
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
                File archivo_server = new File("../recibosDePago/"+item.getName());
                String recibo="recibosDePago/"+item.getName();
                p.guardarRecibo(recibo,usu);
               
                /*y lo escribimos en el servido*/
                try {
					item.write(archivo_server);
				} catch (Exception e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
               
	}
}		misession.setAttribute("estado","revision");
        response.sendRedirect("home.jsp");
	}else {
		
		int select = Integer.parseInt(request.getParameter("seleccion"));
		Procesos p = new Procesos();
		String correo = request.getParameter("correo");
		if(select==1){
			misession.setAttribute("estado","aprobado");
			p.aprobarRecibo(correo);
			
		}else if (select==2){
			System.out.println(correo+"----");
			misession.setAttribute("estado","faltante");
			p.rechazarRecibo(correo);
		}
		 response.sendRedirect("http://localhost:8080/ProyectoWeb/home.jsp");
	}

}
}
