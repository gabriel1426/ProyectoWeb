package util;

import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.EntityManagerFactory;
import javax.persistence.Persistence;
import javax.persistence.Query;
import javax.persistence.TypedQuery;



public class Conexion<T> {
	private Class<T> c;
	private static EntityManager em = null;
	
	public Conexion() {
		em = this.getEm();
	}
	
	public Conexion(Class<T> c) {
		em = this.getEm();
		this.c = c;
	}
	
	public void setC(Class<T> c){
		this.c = c;
	}
	
	public static EntityManager getEm(){
		if ( em == null ) {
			EntityManagerFactory emf = Persistence.createEntityManagerFactory("aplicacion");
            em = emf.createEntityManager();
        }
		return em;
	}
	
	public <E> T find(E id){
		T object = (T) em.find(c, id);
		return object;
	}
	
	public <E> T login(E correo, E password){
	
		T object = (T)em.createQuery("SELECT c FROM Usuario c WHERE c.correo='"+correo+"' AND c.password='"+password+"'");
		
		
		
		return object;
	}
	
	public List<T> list(){
		TypedQuery<T> consulta= em.createNamedQuery(c.getSimpleName()+".findAll", c);
		List<T> lista = (List<T>) consulta.getResultList();
		return lista;
	}
	public List<T> listPartido(){
		
		List<T> lista1 = (List<T>)em.createQuery("Select a From Partido a ORDER BY a.idPartido DESC",  c).getResultList();
		return lista1;
	}
	public List<T> listApuesta(){
		
		
		List<T> lista1 = (List<T>)em.createQuery("Select a From Apuesta a ORDER BY a.idApuesta DESC",  c).getResultList();
		return lista1;
	}
	
public List<T> listUsuarioGanancia(){
		
		
		List<T> lista1 = (List<T>)em.createQuery("Select a From Usuario a ORDER BY a.puntos DESC",  c).getResultList();
		return lista1;
	}
	
	public void insert(T o){
		try {
			em.getTransaction().begin();
			em.persist(o);
			
			em.getTransaction().commit();
		} catch (Exception e) {
			e.printStackTrace();
		}finally {
			//em.close();
		}
		
	}
	
	public void update(T o){
		try {
			em.getTransaction().begin();
			em.merge(o);
			em.getTransaction().commit();
		} catch (Exception e) {
			e.printStackTrace();
		}finally {
			//em.close();
		}
		
	}
	
	public void delete(T o){
		try {
			em.getTransaction().begin();
			em.remove(o);
			em.getTransaction().commit();
		} catch (Exception e) {
			e.printStackTrace();
		}finally {
			//em.close();
		}
		
	}
}
