package Dao;

import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;


import ConexionBD.ConexionBD;
import Modelo.Producto;
import Modelo.Usuarios;
import Interfaces.IntUsuarioable;

public class CrudUsuario implements IntUsuarioable{
		
	int r;
	
	public Usuarios ValidarUsuario(Usuarios usu){
		String sql="select * from usuarios where usuario=? and password=?";
		PreparedStatement ps=null;
		ResultSet rs=null;
		Usuarios usuObj=new Usuarios();
		try {
			ps=ConexionBD.conexion().prepareStatement(sql);
			//ps.setInt(1,usu.getId());
			ps.setString(1, usu.getUsuario());
			ps.setString(2,usu.getPassword());
			//ps.setString(3,usu.getNombre());
			//ps.setString(4, usu.getApellido());
			//ps.setString(6, usu.getDni());
			//ps.setDate(7,new java.sql.Date(usu.getFechaingr().getTime()));
			//ps.setInt(8, usu.getPerfil_id());
			rs=ps.executeQuery();
			if(rs.next()){
				usuObj.setId(rs.getInt(1));
				usuObj.setUsuario(rs.getString(2));
				usuObj.setPassword(rs.getString(3));
				usuObj.setNombre(rs.getString(4));
				usuObj.setApellido(rs.getString(5));
				usuObj.setDni(rs.getString(6));
				usuObj.setFechaingr(rs.getDate(7));
				usuObj.setPerfil_id(8);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return usuObj;
	}

	@Override
	public void RegistrarUsuario(Usuarios u) {
		System.out.println("INTENTANDO INSERT");
		String sql = "insert into usuarios values(null,?,?,?,?,?,?,?)";
		PreparedStatement ps = null;
		try {
			ps = ConexionBD.conexion().prepareStatement(sql);
			ps.setString(1, u.getUsuario());
			ps.setString(2, u.getPassword());
			ps.setString(3, u.getNombre());
			ps.setString(4, u.getApellido());
			ps.setString(5, u.getDni());
			ps.setDate(6, new java.sql.Date(u.getFechaingr().getTime()));
			ps.setInt(7, u.getPerfil_id());
			int y = ps.executeUpdate();
			if (y > 0) {
				System.out.println("Empleado REGISTRADO");
			} else {
				System.out.println("Empleado NO PUDO SER REGISTRADO");
			}
			} catch (SQLException e) {
				e.printStackTrace();
			}
	}
	
	@Override
	public Usuarios listarId(int id){
			Usuarios usu=new Usuarios();
			String sql= "select * from usuarios where ID=" + id;
			PreparedStatement ps = null;
			ResultSet rs = null;
			try {
				ps = ConexionBD.conexion().prepareStatement(sql);
				rs = ps.executeQuery();
				while (rs.next()){
					usu.setId(rs.getInt(1));
					usu.setUsuario(rs.getString(2));
					usu.setPassword(rs.getString(3));
					usu.setNombre(rs.getString(4));
					usu.setApellido(rs.getString(5));
					usu.setDni(rs.getString(6));
					usu.setFechaingr(rs.getDate(7));
					usu.setPerfil_id(rs.getInt(8));
				}
				
			} catch (Exception e){
				
			}
			return usu;
	}
	
	
	@Override
	public void ActualizarUsuario(Usuarios u) {
		String sql = "UPDATE usuarios SET usuario=?, password=?, nombre=?, apellido=?, dni=?, fechaingr=?, perfil_id=? WHERE ID=?";
		System.out.println("CADENA SQL: " + sql);
		PreparedStatement ps = null;
		try {
			ps = ConexionBD.conexion().prepareStatement(sql);
			ps.setString(1, u.getUsuario());
			ps.setString(2, u.getPassword());
			ps.setString(3, u.getNombre());
			ps.setString(4, u.getApellido());
			ps.setString(5, u.getDni());
			ps.setDate(6, new java.sql.Date(u.getFechaingr().getTime()));
			ps.setInt(7, u.getPerfil_id());
			ps.setInt(8, u.getId());
			int y = ps.executeUpdate();
			if (y > 0) {
				System.out.println("Empleado REGISTRADO");
			} else {
				System.out.println("Empleado NO PUDO SER REGISTRADO");
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
	}

	@Override
	public void EliminarUsuario(int  id) {
		String sql = "delete from usuarios where ID=" + id;
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
	public List<Usuarios> ListarUsuario() {
		String sql = "Select * from Usuarios";
		PreparedStatement ps = null;
		ResultSet rs = null;
		List<Usuarios> listar = new ArrayList<>();
		try {
			ps = ConexionBD.conexion().prepareStatement(sql);
			rs = ps.executeQuery();
			while (rs.next()) {
				Usuarios us = new Usuarios();
				us.setId(rs.getInt(1));
				us.setUsuario(rs.getString(2));
				us.setPassword(rs.getString(3));
				us.setNombre(rs.getString(4));
				us.setApellido(rs.getString(5));
				us.setDni(rs.getString(6));
				us.setFechaingr(rs.getDate(7));
				us.setPerfil_id(rs.getInt(8));
				listar.add(us);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return listar;
	}

	@Override
	public Usuarios BuscarUsuarioxCod(Usuarios u) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public List<Usuarios> buscarUsuariosPorUsuario(String nom_usuario) {
	    String sql = "SELECT * FROM usuarios WHERE usuario LIKE ?";
	    PreparedStatement ps = null;
	    ResultSet rs = null;
	    List<Usuarios> listar1 = new ArrayList<>();
	    try {
	        ps = ConexionBD.conexion().prepareStatement(sql);
	        ps.setString(1, "%" + nom_usuario + "%"); // establecer el valor del parámetro
	        rs = ps.executeQuery();
	        while (rs.next()) {
	        	Usuarios usu = new Usuarios();
	        	usu.setId(rs.getInt(1));
	        	usu.setUsuario(rs.getString(2));
	        	usu.setPassword(rs.getString(3));
	        	usu.setNombre(rs.getString(4));
	        	usu.setApellido(rs.getString(5));
	        	usu.setDni(rs.getString(6));
	        	usu.setFechaingr(rs.getDate(7));
	        	usu.setPerfil_id(rs.getInt(8));
	            listar1.add(usu);
	        }
	    } catch (SQLException e) {
	        e.printStackTrace();
	    }
	    return listar1;
	}
}
