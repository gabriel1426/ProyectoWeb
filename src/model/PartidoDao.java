package model;

import entitys.Partido;
import util.Conexion;

public class PartidoDao  extends Conexion<Partido> 
implements IProcesosDB<Partido>{
	
	public PartidoDao(){
		super(Partido.class);
	}
	
}