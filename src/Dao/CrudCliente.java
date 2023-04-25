package Dao;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import ConexionBD.ConexionBD;
import Interfaces.IntCliente;
import Modelo.Cliente;
import Modelo.Usuarios;

public class CrudCliente implements IntCliente{

	@Override
	public void RegistrarCliente(Cliente c) {
		System.out.println("INTENTANDO INSERT");
		String sql = "insert into cliente values(null,?,?,?,?)";
		PreparedStatement ps = null;
		try {
			ps = ConexionBD.conexion().prepareStatement(sql);
			ps.setString(1, c.getDni());
			ps.setString(2, c.getNombres());
			ps.setString(3, c.getDireccion());
			ps.setString(4, c.getEstado());
			int y = ps.executeUpdate();
			if (y > 0) {
				System.out.println("Cliente REGISTRADO");
			} else {
				System.out.println("Cliente NO PUDO SER REGISTRADO");
			}
			} catch (SQLException e) {
				e.printStackTrace();
			}
	}

	public Cliente buscar(String dni){		
		Cliente cli=new Cliente();
		String sql= "select * from cliente where Dni=" + dni;
		PreparedStatement ps = null;
		ResultSet rs = null;
		try {
			ps = ConexionBD.conexion().prepareStatement(sql);
			rs = ps.executeQuery();
			while (rs.next()) {
				cli.setIdcliente(rs.getInt(1));
				cli.setDni(rs.getString(2));
				cli.setNombres(rs.getString(3));
				cli.setDireccion(rs.getString(4));
				cli.setEstado(rs.getString(5));
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return cli;
	}
	
	
	@Override
	public void ActualizarCliente(Cliente c) {
		String sql = "UPDATE cliente SET dni=?, nombres=?, direccion=?, estado=? WHERE idCliente=?";
		System.out.println("CADENA SQL: " + sql);
		PreparedStatement ps = null;
		try {
			ps = ConexionBD.conexion().prepareStatement(sql);
			ps.setString(1, c.getDni());
			ps.setString(2, c.getNombres());
			ps.setString(3, c.getDireccion());
			ps.setString(4, c.getEstado());
			ps.setInt(5, c.getIdcliente());
			int y = ps.executeUpdate();
			if (y > 0) {
				System.out.println("Cliente ACTUALIZADO");
			} else {
				System.out.println("CLIENTE NO PUDO ACTUALIZADO");
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}

	@Override
	public void EliminarCliente(int id) {
		String sql = "delete from cliente where idCliente=" + id;
		PreparedStatement ps = null;
		try {
			ps = ConexionBD.conexion().prepareStatement(sql);
			int y = ps.executeUpdate();
			if (y > 0) {
				System.out.println("Registro ELIMINADO de la BD");
			} else {
				System.out.println("Registro NO ELMINADO de la BD");
					}
			}catch (SQLException e) {
				e.printStackTrace();
		}
		
	}

	@Override
	public List<Cliente> ListarCliente() {
		String sql = "Select * from cliente";
		PreparedStatement ps = null;
		ResultSet rs = null;
		List<Cliente> listar = new ArrayList<>();
		try {
			ps = ConexionBD.conexion().prepareStatement(sql);
			rs = ps.executeQuery();
			while (rs.next()) {
				Cliente cli = new Cliente();
				cli.setIdcliente(rs.getInt(1));
				cli.setDni(rs.getString(2));
				cli.setNombres(rs.getString(3));
				cli.setDireccion(rs.getString(4));
				cli.setEstado(rs.getString(5));
				listar.add(cli);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return listar;
	}

	@Override
	public Cliente listarIdCli(int id) {
		Cliente cli=new Cliente();
		String sql= "select * from cliente where idCliente=" + id;
		PreparedStatement ps = null;
		ResultSet rs = null;
		try {
			ps = ConexionBD.conexion().prepareStatement(sql);
			rs = ps.executeQuery();
			while (rs.next()){
				cli.setIdcliente(rs.getInt(1));
				cli.setDni(rs.getString(2));
				cli.setNombres(rs.getString(3));
				cli.setDireccion(rs.getString(4));
				cli.setEstado(rs.getString(5));
			}
			
		} catch (Exception e){
			
		}
		return cli;
	}
	
	@Override
	public List<Cliente> buscarClientesPorDni(String dni_clie) {
	    String sql = "SELECT * FROM cliente WHERE Dni LIKE ?";
	    PreparedStatement ps = null;
	    ResultSet rs = null;
	    List<Cliente> listar1 = new ArrayList<>();
	    try {
	        ps = ConexionBD.conexion().prepareStatement(sql);
	        ps.setString(1, "%" + dni_clie + "%"); // establecer el valor del parámetro
	        rs = ps.executeQuery();
	        while (rs.next()) {
	        	Cliente cli = new Cliente();
	        	cli.setIdcliente(rs.getInt(1));
	        	cli.setDni(rs.getString(2));
	        	cli.setNombres(rs.getString(3));
	        	cli.setDireccion(rs.getString(4));
	        	cli.setEstado(rs.getString(5));
	            listar1.add(cli);
	        }
	    } catch (SQLException e) {
	        e.printStackTrace();
	    }
	    return listar1;
	}
	
}
