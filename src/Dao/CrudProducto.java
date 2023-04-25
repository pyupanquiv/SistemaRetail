package Dao;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import ConexionBD.ConexionBD;
import Interfaces.IntProducto;
import Modelo.Producto;
import Modelo.Usuarios;

public class CrudProducto implements IntProducto{

	int r;

	
	public Producto buscar(int id){
		Producto p=new Producto();
		String sql= "select * from Producto where IdProducto=" + id;
		PreparedStatement ps = null;
		ResultSet rs = null;
		try {
			ps = ConexionBD.conexion().prepareStatement(sql);
			rs = ps.executeQuery();
			while (rs.next()){
				p.setIdproducto(rs.getInt(1));
				p.setNombres(rs.getString(2));
				p.setPrecio(rs.getDouble(3));
				p.setFechavencimiento(rs.getDate(4));
				p.setStock(rs.getInt(5));
				p.setEstado(rs.getString(6));
			}
			
		} catch (Exception e){
			
		}
		return p;
	}
	
	public int actualizarstock(int id, int stock){
		String sql = "UPDATE producto SET Stock=? WHERE IdProducto=?";
		PreparedStatement ps = null;
		try {
			ps = ConexionBD.conexion().prepareStatement(sql);
			
			ps.setInt(1, stock);
			ps.setInt(2, id);
			int y = ps.executeUpdate();
			if (y > 0) {
				System.out.println("STOCK ACTUALIZADO");
			} else {
				System.out.println("STOCK NO PUDO SER ACTUALIZADO");
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return r;
	}
	
	
	@Override
	public void RegistrarProducto(Producto p) {
		System.out.println("INTENTANDO INSERT");
		String sql = "insert into producto values(null,?,?,?,?,?)";
		PreparedStatement ps = null;
		try {
			ps = ConexionBD.conexion().prepareStatement(sql);
			ps.setString(1, p.getNombres());
			ps.setDouble(2, p.getPrecio());
			ps.setDate(3, new java.sql.Date(p.getFechavencimiento().getTime()));
			ps.setInt(4, p.getStock());
			ps.setString(5, p.getEstado());

			int y = ps.executeUpdate();
			if (y > 0) {
				System.out.println("Producto REGISTRADO");
			} else {
				System.out.println("Producto NO PUDO SER REGISTRADO");
			}
			} catch (SQLException e) {
				e.printStackTrace();
			}
	}
	
	@Override
	public Producto listarIdPro(int id){
		Producto pro=new Producto();
		String sql= "select * from Producto where IdProducto=" + id;
		PreparedStatement ps = null;
		ResultSet rs = null;
		try {
			ps = ConexionBD.conexion().prepareStatement(sql);
			rs = ps.executeQuery();
			while (rs.next()){
				pro.setIdproducto(rs.getInt(1));
				pro.setNombres(rs.getString(2));
				pro.setPrecio(rs.getDouble(3));
				pro.setFechavencimiento(rs.getDate(4));
				pro.setStock(rs.getShort(5));
				pro.setEstado(rs.getString(6));
			}
			
		} catch (Exception e){
			
		}
		return pro;
	}

	@Override
	public void ActualizarProducto(Producto p) {
		String sql = "UPDATE producto SET Nombres=?, Precio=?, FechaVencimiento=?, Stock=?, Estado=? WHERE IdProducto=?";
		System.out.println("CADENA SQL: " + sql);
		PreparedStatement ps = null;
		try {
			ps = ConexionBD.conexion().prepareStatement(sql);
			ps.setString(1, p.getNombres());
			ps.setDouble(2, p.getPrecio());
			ps.setDate(3, new java.sql.Date(p.getFechavencimiento().getTime()));
			ps.setInt(4, p.getStock());
			ps.setString(5, p.getEstado());
			ps.setInt(6, p.getIdproducto());
			
			int y = ps.executeUpdate();
			if (y > 0) {
				System.out.println("Producto ACTUALIZADO");
			} else {
				System.out.println("PRODICTO NO PUDO SER ACTUALIZADO");
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}

	@Override
	public void EliminarProducto(int id) {
		String sql = "delete from producto where IdProducto=" + id;
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
	public List<Producto> ListarProducto() {
		String sql = "Select * from producto";
		PreparedStatement ps = null;
		ResultSet rs = null;
		List<Producto> listar = new ArrayList<>();
		try {
			ps = ConexionBD.conexion().prepareStatement(sql);
			rs = ps.executeQuery();
			while (rs.next()) {
				Producto pro = new Producto();
				pro.setIdproducto(rs.getInt(1));
				pro.setNombres(rs.getString(2));
				pro.setPrecio(rs.getDouble(3));
				pro.setFechavencimiento(rs.getDate(4));
				pro.setStock(rs.getShort(5));
				pro.setEstado(rs.getString(6));
				listar.add(pro);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return listar;
	}


	public List<Producto> buscarProductoPorNombre(String nombre) {
	    String sql = "SELECT * FROM producto WHERE Nombres LIKE ?";
	    PreparedStatement ps = null;
	    ResultSet rs = null;
	    List<Producto> listar = new ArrayList<>();
	    try {
	        ps = ConexionBD.conexion().prepareStatement(sql);
	        ps.setString(1, "%" + nombre + "%"); // establecer el valor del parámetro
	        rs = ps.executeQuery();
	        while (rs.next()) {
	            Producto pro = new Producto();
	            pro.setIdproducto(rs.getInt(1));
	            pro.setNombres(rs.getString(2));
	            pro.setPrecio(rs.getDouble(3));
	            pro.setFechavencimiento(rs.getDate(4));
	            pro.setStock(rs.getShort(5));
	            pro.setEstado(rs.getString(6));
	            listar.add(pro);
	        }
	    } catch (SQLException e) {
	        e.printStackTrace();
	    }
	    return listar;
	}

	@Override
	public Producto BuscarProductoxCod(Producto p) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public Producto BuscarProductoxNom(String nom) {
		// TODO Auto-generated method stub
		return null;
	}
	


}
