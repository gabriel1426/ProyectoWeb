package Model;

import java.util.ArrayList;
import java.util.List;
import java.util.Collection;

import javax.persistence.EntityManager;
import javax.persistence.EntityManagerFactory;
import javax.persistence.Persistence;
import javax.persistence.Query;

import Entitys.Usuario;

public class ProcesosBD {
	
	private static EntityManager manager;
	private static EntityManagerFactory emf;
	
	
    //@SuppressWarnings({ "rawtypes" })
	//public static void main(String[] args) {
		// TODO Auto-generated method stub

		   
		  
		    
		  //  Usuario us= new Usuario(1090501309, "juan", "juan2juan.com", "3195083670", false);
		    
		  //  manager.getTransaction().begin();
		 //   manager.persist(us);
		 //   manager.getTransaction().commit();
		    
		//	int emp =  manager.createQuery("SELECT us.cedula  FROM Usuario us").getFirstResult();
		  //  System.out.println("hola"+ emp);
		    
		//    Query query = manager.createQuery("SELECT e.cedula FROM Usuario e");
		 //   Collection<Usuario> gdgdgd = (Collection<Usuario>) query.getResultList();
		 //   System.out.println(gdgdgd);
	//}
	
	@SuppressWarnings("unchecked")
	public boolean validarUSuarioLogin(String correo, String password){
		    
		 /*Creamos el gestor de persistencia*/
			   
			   emf = Persistence.createEntityManagerFactory("aplicacion");
			   manager= emf.createEntityManager();
		
		
	  
	   Query  validar= manager.createQuery("SELECT c FROM Usuario c WHERE c.correo='"+correo+"' AND c.password='"+password+"'");	
	  // Query validar = manager.createQuery("SELECT e.cedula FROM Usuario e");
	 
	   List<Usuario> response = (List<Usuario>) validar.getResultList();
	    
	    
	    for	(Usuario e : response){
	    	
	    	System.out.println(e.getCedula()+"--"+e.getNombre());
	    }
		   
	   
	  if(response.size()==1){
		  return true;
	  }else {
		  System.out.println("Aqui estoy");
		  return false;
	  }
	   
	}


}
