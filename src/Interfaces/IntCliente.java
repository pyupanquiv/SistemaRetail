package Interfaces;

import java.util.List;

import Modelo.Cliente;

public interface IntCliente {
	public void RegistrarCliente(Cliente c);
	public void ActualizarCliente(Cliente c);
	public void EliminarCliente(int id);
	public List<Cliente> ListarCliente();
	public Cliente listarIdCli(int id);
	public Cliente buscar(String dni);
	public List<Cliente> buscarClientesPorDni(String dni_clie);
}
