package Model;

import Util.Conexion;
import Entitys.TipoApuesta;

public class TipoApuestaDao extends Conexion<TipoApuesta>
implements IProcesosDB<TipoApuesta>{
	
	public TipoApuestaDao(){
		super(TipoApuesta.class);
	}
	
}
