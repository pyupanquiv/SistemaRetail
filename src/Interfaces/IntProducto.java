package Interfaces;

import java.util.List;

import Modelo.Producto;;

public interface IntProducto {

	//public Producto ValidarUsuario(Producto p);
	public void RegistrarProducto(Producto p);
	public void ActualizarProducto(Producto p);
	public void EliminarProducto(int id);
	public List<Producto> ListarProducto();
	public Producto listarIdPro(int id);
	public Producto BuscarProductoxCod(Producto p);
	public Producto BuscarProductoxNom(String nom);
}
