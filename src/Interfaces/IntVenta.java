package Interfaces;

import Modelo.Venta;

public interface IntVenta {
	public String GenerarSerie();
	public String idVentas();
	public int guardarVenta(Venta ve);
	public int guardarDetalleventas(Venta venta);
	
}
