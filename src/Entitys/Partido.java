package Entitys;

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
	private int idPartido;

	private byte estado;

	@Column(name="g_equipo1")
	private int gEquipo1;

	@Column(name="g_equipo2")
	private int gEquipo2;

	//bi-directional many-to-one association to Apuesta
	@OneToMany(mappedBy="partido")
	private List<Apuesta> apuestas;

	//bi-directional many-to-one association to Partido
	@ManyToOne
	@JoinColumn(name="id_equipo1")
	private Partido partido1;

	//bi-directional many-to-one association to Partido
	@OneToMany(mappedBy="partido1")
	private List<Partido> partidos1;

	//bi-directional many-to-one association to Partido
	@ManyToOne
	@JoinColumn(name="id_equipo2")
	private Partido partido2;

	//bi-directional many-to-one association to Partido
	@OneToMany(mappedBy="partido2")
	private List<Partido> partidos2;

	public Partido() {
	}

	public int getIdPartido() {
		return this.idPartido;
	}

	public void setIdPartido(int idPartido) {
		this.idPartido = idPartido;
	}

	public byte getEstado() {
		return this.estado;
	}

	public void setEstado(byte estado) {
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

	public Partido getPartido1() {
		return this.partido1;
	}

	public void setPartido1(Partido partido1) {
		this.partido1 = partido1;
	}

	public List<Partido> getPartidos1() {
		return this.partidos1;
	}

	public void setPartidos1(List<Partido> partidos1) {
		this.partidos1 = partidos1;
	}

	public Partido addPartidos1(Partido partidos1) {
		getPartidos1().add(partidos1);
		partidos1.setPartido1(this);

		return partidos1;
	}

	public Partido removePartidos1(Partido partidos1) {
		getPartidos1().remove(partidos1);
		partidos1.setPartido1(null);

		return partidos1;
	}

	public Partido getPartido2() {
		return this.partido2;
	}

	public void setPartido2(Partido partido2) {
		this.partido2 = partido2;
	}

	public List<Partido> getPartidos2() {
		return this.partidos2;
	}

	public void setPartidos2(List<Partido> partidos2) {
		this.partidos2 = partidos2;
	}

	public Partido addPartidos2(Partido partidos2) {
		getPartidos2().add(partidos2);
		partidos2.setPartido2(this);

		return partidos2;
	}

	public Partido removePartidos2(Partido partidos2) {
		getPartidos2().remove(partidos2);
		partidos2.setPartido2(null);

		return partidos2;
	}

}