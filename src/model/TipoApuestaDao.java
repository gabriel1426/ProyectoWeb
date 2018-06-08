package model;

import entitys.TipoApuesta;
import util.Conexion;

public class TipoApuestaDao extends Conexion<TipoApuesta>
implements IProcesosDB<TipoApuesta>{
	
	public TipoApuestaDao(){
		super(TipoApuesta.class);
	}
	
}
