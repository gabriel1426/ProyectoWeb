package entitys;

import java.io.Serializable;
import javax.persistence.*;
import java.util.List;


/**
 * The persistent class for the partido database table.
 * 
 */
@Entity
@NamedQuery(name="Partido.findAll", query="SELECT p FROM Partido p")
public class Partido implements Serializable {
	private static final long serialVersionUID = 1L;

	@Id
	@Column(name="id_partido")
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private int idPartido;

	private String estado;

	@Column(name="g_equipo1")
	private int gEquipo1;

	@Column(name="g_equipo2")
	private int gEquipo2;

	//bi-directional many-to-one association to Apuesta
	@OneToMany(mappedBy="partido")
	private List<Apuesta> apuestas;

	//bi-directional many-to-one association to Equipo
	@ManyToOne
	@JoinColumn(name="id_equipo1")
	private Equipo equipo1;

	//bi-directional many-to-one association to Equipo
	@ManyToOne
	@JoinColumn(name="id_equipo2")
	private Equipo equipo2;

	public Partido() {
	}

	public Partido(String estado, int gEquipo1, int gEquipo2, Equipo equipo1, Equipo equipo2) {
		super();
		this.estado = estado;
		this.gEquipo1 = gEquipo1;
		this.gEquipo2 = gEquipo2;
		this.equipo1 = equipo1;
		this.equipo2 = equipo2;
	}

	@Override
	public String toString() {
		return "Partido [idPartido=" + idPartido + ", estado=" + estado + ", gEquipo1=" + gEquipo1 + ", gEquipo2="
				+ gEquipo2 + ", apuestas=" + apuestas + ", equipo1=" + equipo1 + ", equipo2=" + equipo2 + "]";
	}



	public int getIdPartido() {
		return this.idPartido;
	}

	public void setIdPartido(int idPartido) {
		this.idPartido = idPartido;
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

	public List<Apuesta> getApuestas() {
		return this.apuestas;
	}

	public void setApuestas(List<Apuesta> apuestas) {
		this.apuestas = apuestas;
	}

	public Apuesta addApuesta(Apuesta apuesta) {
		getApuestas().add(apuesta);
		apuesta.setPartido(this);

		return apuesta;
	}

	public Apuesta removeApuesta(Apuesta apuesta) {
		getApuestas().remove(apuesta);
		apuesta.setPartido(null);

		return apuesta;
	}

	public Equipo getEquipo1() {
		return this.equipo1;
	}

	public void setEquipo1(Equipo equipo1) {
		this.equipo1 = equipo1;
	}

	public Equipo getEquipo2() {
		return this.equipo2;
	}

	public void setEquipo2(Equipo equipo2) {
		this.equipo2 = equipo2;
	}

}