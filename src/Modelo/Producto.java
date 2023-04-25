package Modelo;

import java.util.Date;

public class Producto {

	  private int idproducto;
	  private String nombres;
	  private double precio;
	  private Date fechavencimiento;
	  private int stock;
	  private String estado;


		public Producto(int idproducto, String nombres, double precio, Date fechavencimiento, int stock, String estado) {
			super();
			this.idproducto = idproducto;
			this.nombres = nombres;
			this.precio = precio;
			this.fechavencimiento = fechavencimiento;
			this.stock = stock;
			this.estado = estado;
		}
	  
	public Producto() {
		super();
		// TODO Auto-generated constructor stub
	}

	public int getIdproducto() {
		return idproducto;
	}

	public void setIdproducto(int idproducto) {
		this.idproducto = idproducto;
	}

	public String getNombres() {
		return nombres;
	}

	public void setNombres(String nombres) {
		this.nombres = nombres;
	}

	public double getPrecio() {
		return precio;
	}

	public void setPrecio(double precio) {
		this.precio = precio;
	}

	public Date getFechavencimiento() {
		return fechavencimiento;
	}

	public void setFechavencimiento(Date fechavencimiento) {
		this.fechavencimiento = fechavencimiento;
	}

	public int getStock() {
		return stock;
	}

	public void setStock(int stock) {
		this.stock = stock;
	}

	public String getEstado() {
		return estado;
	}

	public void setEstado(String estado) {
		this.estado = estado;
	}

	
	
}