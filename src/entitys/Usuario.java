package entitys;

import java.io.Serializable;
import javax.persistence.*;
import java.math.BigDecimal;
import java.util.List;


/**
 * The persistent class for the usuario database table.
 * 
 */
@Entity
@NamedQuery(name="Usuario.findAll", query="SELECT u FROM Usuario u")
public class Usuario implements Serializable {
	private static final long serialVersionUID = 1L;

	@Id
	private String correo;

	private int cedula;

	private String estadoPago;

	private double ganancia;

	private String nombre;

	private String password;

	private String perfil;

	private int puntos;

	private String recibo;

	private String telefono;

	//bi-directional many-to-one association to Apuesta
	@OneToMany(mappedBy="usuario")
	private List<Apuesta> apuestas;

	public Usuario() {
	}
	public Usuario(String correo, int cedula, String  estadoPago, String nombre, String password, String telefono,String usuario) {
		super();
		this.correo = correo;
		this.cedula = cedula;
		this.estadoPago = estadoPago;
		this.nombre = nombre;
		this.password = password;
		this.telefono = telefono;
		this.perfil=usuario;
		
	}

	public String getCorreo() {
		return this.correo;
	}

	public void setCorreo(String correo) {
		this.correo = correo;
	}

	public int getCedula() {
		return this.cedula;
	}

	public void setCedula(int cedula) {
		this.cedula = cedula;
	}

	public String getEstadoPago() {
		return this.estadoPago;
	}

	public void setEstadoPago(String estadoPago) {
		this.estadoPago = estadoPago;
	}

	public double getGanancia() {
		return this.ganancia;
	}

	public void setGanancia(double ganancia) {
		this.ganancia = ganancia;
	}

	public String getNombre() {
		return this.nombre;
	}

	public void setNombre(String nombre) {
		this.nombre = nombre;
	}

	public String getPassword() {
		return this.password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public String getPerfil() {
		return this.perfil;
	}

	public void setPerfil(String perfil) {
		this.perfil = perfil;
	}

	public int getPuntos() {
		return this.puntos;
	}

	public void setPuntos(int puntos) {
		this.puntos = puntos;
	}

	public String getRecibo() {
		return this.recibo;
	}

	public void setRecibo(String recibo) {
		this.recibo = recibo;
	}

	public String getTelefono() {
		return this.telefono;
	}

	public void setTelefono(String telefono) {
		this.telefono = telefono;
	}

	public List<Apuesta> getApuestas() {
		return this.apuestas;
	}

	public void setApuestas(List<Apuesta> apuestas) {
		this.apuestas = apuestas;
	}

	public Apuesta addApuesta(Apuesta apuesta) {
		getApuestas().add(apuesta);
		apuesta.setUsuario(this);

		return apuesta;
	}

	public Apuesta removeApuesta(Apuesta apuesta) {
		getApuestas().remove(apuesta);
		apuesta.setUsuario(null);

		return apuesta;
	}

}