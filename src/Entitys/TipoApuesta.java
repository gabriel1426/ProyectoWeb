package Entitys;

import java.io.Serializable;
import javax.persistence.*;
import java.util.List;


/**
 * The persistent class for the tipo_apuesta database table.
 * 
 */
@Entity
@Table(name="tipo_apuesta")
@NamedQuery(name="TipoApuesta.findAll", query="SELECT t FROM TipoApuesta t")
public class TipoApuesta implements Serializable {
	private static final long serialVersionUID = 1L;

	@Id
	@Column(name="id_tipo")
	private int idTipo;

	private String descripccion;

	//bi-directional many-to-one association to Apuesta
	@OneToMany(mappedBy="tipoApuesta")
	private List<Apuesta> apuestas;

	public TipoApuesta() {
	}

	public int getIdTipo() {
		return this.idTipo;
	}

	public void setIdTipo(int idTipo) {
		this.idTipo = idTipo;
	}

	public String getDescripccion() {
		return this.descripccion;
	}

	public void setDescripccion(String descripccion) {
		this.descripccion = descripccion;
	}

	public List<Apuesta> getApuestas() {
		return this.apuestas;
	}

	public void setApuestas(List<Apuesta> apuestas) {
		this.apuestas = apuestas;
	}

	public Apuesta addApuesta(Apuesta apuesta) {
		getApuestas().add(apuesta);
		apuesta.setTipoApuesta(this);

		return apuesta;
	}

	public Apuesta removeApuesta(Apuesta apuesta) {
		getApuestas().remove(apuesta);
		apuesta.setTipoApuesta(null);

		return apuesta;
	}

}