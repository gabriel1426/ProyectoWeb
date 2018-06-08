package model;

import entitys.Equipo;
import util.Conexion;

public class EquipoDao extends Conexion<Equipo> 
implements IProcesosDB<Equipo>{
	
	public EquipoDao(){
		super(Equipo.class);
	}
	
}
