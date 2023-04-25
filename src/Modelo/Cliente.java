package Modelo;

import java.util.Date;
//Prueba GitHUB VFinal2

public class Cliente {

	  private int idcliente;
	  private String dni;
	  private String nombres;
	  private String direccion;
	  private String estado;
	  
	public Cliente() {
		super();
		// TODO Auto-generated constructor stub
	}

	public Cliente(int idcliente, String dni, String nombres, String direccion, String estado) {
		super();
		this.idcliente = idcliente;
		this.dni = dni;
		this.nombres = nombres;
		this.direccion = direccion;
		this.estado = estado;
	}

	public int getIdcliente() {
		return idcliente;
	}

	public void setIdcliente(int idcliente) {
		this.idcliente = idcliente;
	}

	public String getDni() {
		return dni;
	}

	public void setDni(String dni) {
		this.dni = dni;
	}

	public String getNombres() {
		return nombres;
	}

	public void setNombres(String nombres) {
		this.nombres = nombres;
	}

	public String getDireccion() {
		return direccion;
	}

	public void setDireccion(String direccion) {
		this.direccion = direccion;
	}

	public String getEstado() {
		return estado;
	}

	public void setEstado(String estado) {
		this.estado = estado;
	}
}
