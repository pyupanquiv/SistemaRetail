package Modelo;

import java.util.Date;

public class Usuarios {

	  private int id;
	  private String usuario;
	  private String password;
	  private String nombre;
	  private String apellido;
	  private String dni;
	  private Date fechaingr;
	  private int perfil_id;
	  
	public Usuarios() {
	}
	
	public Usuarios(int id, String usuario, String password, String nombre, String apellido, String dni, Date fechaingr,
			int perfil_id) {
		super();
		this.id = id;
		this.usuario = usuario;
		this.password = password;
		this.nombre = nombre;
		this.apellido = apellido;
		this.dni = dni;
		this.fechaingr = fechaingr;
		this.perfil_id = perfil_id;
	}
	
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public String getUsuario() {
		return usuario;
	}
	public void setUsuario(String usuario) {
		this.usuario = usuario;
	}
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}
	public String getNombre() {
		return nombre;
	}
	public void setNombre(String nombre) {
		this.nombre = nombre;
	}
	public String getApellido() {
		return apellido;
	}
	public void setApellido(String apellido) {
		this.apellido = apellido;
	}
	public String getDni() {
		return dni;
	}
	public void setDni(String dni) {
		this.dni = dni;
	}
	public Date getFechaingr() {
		return fechaingr;
	}
	public void setFechaingr(Date fechaingr) {
		this.fechaingr = fechaingr;
	}
	public int getPerfil_id() {
		return perfil_id;
	}
	public void setPerfil_id(int perfil_id) {
		this.perfil_id = perfil_id;
	}	  
}
