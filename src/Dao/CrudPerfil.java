package Dao;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import ConexionBD.ConexionBD;
import Interfaces.IntPerfil;
import Modelo.Perfil;

public class CrudPerfil implements IntPerfil {

	@Override
	public List<Perfil> ListarPerfil() {
		String sql="select * from perfil";
		PreparedStatement ps=null;
		ResultSet rs=null;
		List<Perfil> listar=new ArrayList<Perfil>();
		try {
			ps=ConexionBD.conexion().prepareStatement(sql);
			rs=ps.executeQuery();
			while(rs.next()){
				Perfil per=new Perfil();
				per.setIdperfil(rs.getInt(1));
				per.setNomperfil(rs.getString(2));
				listar.add(per);	
			}
		} catch (SQLException e) {
			e.printStackTrace();	
		}
		return listar;
	}
}
