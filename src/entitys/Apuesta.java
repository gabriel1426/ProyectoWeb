package entitys;

import java.io.Serializable;
import javax.persistence.*;


/**
 * The persistent class for the apuesta database table.
 * 
 */
@Entity
@NamedQuery(name="Apuesta.findAll", query="SELECT a FROM Apuesta a")
public class Apuesta implements Serializable {
	private static final long serialVersionUID = 1L;

	@Id
	@Column(name="id_apuesta")
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private int idApuesta;

	private String equipo;

	private String estado;
	
	

	@Column(name="g_equipo1")
	private int gEquipo1;

	@Column(name="g_equipo2")
	private int gEquipo2;

	//bi-directional many-to-one association to TipoApuesta
	@ManyToOne
	@JoinColumn(name="id_tipo")
	private TipoApuesta tipoApuesta;

	//bi-directional many-to-one association to Usuario
	@ManyToOne
	@JoinColumn(name="id_usuario")
	private Usuario usuario;

	//bi-directional many-to-one association to Partido
	@ManyToOne
	@JoinColumn(name="id_partido")
	private Partido partido;

	public Apuesta() {
	}
	
	public Apuesta(String estado, TipoApuesta tipoApuesta, int gEquipo1, int gEquipo2, String equipo, Usuario usuario, Partido partido) {
		super();
		this.estado = estado;
		this.tipoApuesta = tipoApuesta;
		this.gEquipo1 = gEquipo1;
		this.gEquipo2 = gEquipo2;
		this.equipo = equipo;
		this.usuario = usuario;
		this.partido = partido;
	}

	public int getIdApuesta() {
		return this.idApuesta;
	}

	public void setIdApuesta(int idApuesta) {
		this.idApuesta = idApuesta;
	}

	public String getEquipo() {
		return this.equipo;
	}

	public void setEquipo(String equipo) {
		this.equipo = equipo;
	}

	public String getEstado() {
		return this.estado;
	}

	public void setEstado(String estado) {
		this.estado = estado;
	}

	public int getGEquipo1() {
		return this.gEquipo1;
	}

	public void setGEquipo1(int gEquipo1) {
		this.gEquipo1 = gEquipo1;
	}

	public int getGEquipo2() {
		return this.gEquipo2;
	}

	public void setGEquipo2(int gEquipo2) {
		this.gEquipo2 = gEquipo2;
	}

	public TipoApuesta getTipoApuesta() {
		return this.tipoApuesta;
	}

	public void setTipoApuesta(TipoApuesta tipoApuesta) {
		this.tipoApuesta = tipoApuesta;
	}

	public Usuario getUsuario() {
		return this.usuario;
	}

	public void setUsuario(Usuario usuario) {
		this.usuario = usuario;
	}

	public Partido getPartido() {
		return this.partido;
	}

	public void setPartido(Partido partido) {
		this.partido = partido;
	}

}