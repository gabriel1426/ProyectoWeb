package model;

import entitys.Apuesta;
import util.Conexion;

public class ApuestaDao extends Conexion<Apuesta> 
implements IProcesosDB<Apuesta>{
	
	public ApuestaDao(){
		super(Apuesta.class);
	}
	
}
