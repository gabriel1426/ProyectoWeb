package model;

import java.util.List;

public interface IProcesosDB<T> {
	
	public List<T> list();
	public List<T> listPartido();
	public List<T> listApuesta();
	public List<T> listUsuarioGanancia();
	public <E> T find(E id);
	public <E> T login(E correo, E password);
	public void insert(T o);
	public void update(T o);
	public void delete(T o);

}
