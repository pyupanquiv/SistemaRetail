package Dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import ConexionBD.ConexionBD;
import Interfaces.IntVenta;
import Modelo.Cliente;
import Modelo.Venta;

public class CrudVenta implements IntVenta{

	int r;
	
	@Override
	public String GenerarSerie(){
		
		String numeroserie="";
		String sql= "select max(NumeroSerie) from ventas";
		PreparedStatement ps = null;
		ResultSet rs = null;
		try {
			ps = ConexionBD.conexion().prepareStatement(sql);
			rs = ps.executeQuery();
			while (rs.next()) {
				numeroserie=rs.getString(1);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return numeroserie;
		
	}
	@Override
	public String idVentas(){
		String idventas="";
		String sql= "select max(idVentas) from ventas";
		PreparedStatement ps = null;
		ResultSet rs = null;
		try {
			ps = ConexionBD.conexion().prepareStatement(sql);
			rs = ps.executeQuery();
			while (rs.next()) {
				idventas=rs.getString(1);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return idventas;
	}
	@Override
	public int guardarVenta(Venta ve){
		
		System.out.println("INTENTANDO INSERT VENTA");
		String sql = "insert into ventas (IdCliente, IdEmpleado, NumeroSerie, FechaVentas, Monto, Estado) values (?,?,?,?,?,?)";
		PreparedStatement ps = null;
		try {
			ps = ConexionBD.conexion().prepareStatement(sql);
			ps.setInt(1, ve.getIdcliente());
			ps.setInt(2, ve.getIdempleado());
			ps.setString(3, ve.getNumserie());
			ps.setString(4, ve.getFecha());
			ps.setDouble(5, ve.getMonto());
			ps.setString(6, ve.getEstado());
			int y = ps.executeUpdate();
			if (y > 0) {
				System.out.println("Venta REGISTRADO");
			} else {
				System.out.println("Venta NO PUDO SER REGISTRADO");
			}
			} catch (SQLException e) {
				e.printStackTrace();
			}
		return r;
	}
	@Override
	public int guardarDetalleventas(Venta venta){
		
		System.out.println("INTENTANDO INSERT DETALLE VENTAS");
		String sql = "insert into detalle_ventas (idVentas, IdProducto, Cantidad, PrecioVenta) values(?,?,?,?)";
		PreparedStatement ps = null;
		try {
			ps = ConexionBD.conexion().prepareStatement(sql);
			ps.setInt(1, venta.getId());
			ps.setInt(2, venta.getIdproducto());
			ps.setInt(3, venta.getCantidad());
			ps.setDouble(4, venta.getPrecio());
			int y = ps.executeUpdate();
			if (y > 0) {
				System.out.println("Detalle_Venta REGISTRADO");
			} else {
				System.out.println("Detalle_Venta NO PUDO SER REGISTRADO");
			}
			} catch (SQLException e) {
				e.printStackTrace();
			}
		return r;
		
	}
	
}
