package Model;

import Entitys.Equipo;
import Util.Conexion;

public class EquipoDao extends Conexion<Equipo> 
implements IProcesosDB<Equipo>{
	
	public EquipoDao(){
		super(Equipo.class);
	}
	
}
