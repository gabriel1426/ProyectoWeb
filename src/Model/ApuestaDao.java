package Model;

import Entitys.Apuesta;
import Util.Conexion;

public class ApuestaDao extends Conexion<Apuesta> 
implements IProcesosDB<Apuesta>{
	
	public ApuestaDao(){
		super(Apuesta.class);
	}
	
}
