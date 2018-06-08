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
	private int idApuesta;

	private String resultado;

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

	public int getIdApuesta() {
		return this.idApuesta;
	}

	public void setIdApuesta(int idApuesta) {
		this.idApuesta = idApuesta;
	}

	public String getResultado() {
		return this.resultado;
	}

	public void setResultado(String resultado) {
		this.resultado = resultado;
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