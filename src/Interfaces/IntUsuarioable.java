package Interfaces;

import java.util.List;

import Modelo.Usuarios;

public interface IntUsuarioable {
	// creamos los respectivos metodos
	public Usuarios ValidarUsuario(Usuarios u);
	public void RegistrarUsuario(Usuarios u);
	public void ActualizarUsuario(Usuarios u);
	public void EliminarUsuario(int id);
	public List<Usuarios> ListarUsuario();
	public Usuarios listarId(int id);
	public Usuarios BuscarUsuarioxCod(Usuarios u);
	public List<Usuarios> buscarUsuariosPorUsuario(String nombre);

} //
