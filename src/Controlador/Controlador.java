package Controlador;

import java.io.IOException;
import java.util.ArrayList;
import java.util.Date;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import Dao.CrudCliente;
import Dao.CrudPerfil;
import Dao.CrudProducto;
import Dao.CrudUsuario;
import Dao.CrudVenta;
import Dao.GenerarSerie;
import Modelo.Cliente;
import Modelo.Perfil;
import Modelo.Producto;
import Modelo.Usuarios;
import Modelo.Venta;

/**
 * Servlet implementation class Controlador
 */
@WebServlet("/Controlador")
public class Controlador extends HttpServlet {
	
	Usuarios usu=new Usuarios();
	Producto pro=new Producto();
	Cliente cli=new Cliente();
	
	CrudCliente daoCli = new CrudCliente();
	CrudUsuario dao= new CrudUsuario();
	CrudProducto daoPro= new CrudProducto();
	CrudUsuario daoUsu = new CrudUsuario();
	
	int ide=0;
	int idep=0;
	int idec=0;
	String nompro="";
	
	Venta v=new Venta();
	List<Venta>lista=new ArrayList<>();
	int item;
	int cod;
	String descripcion;
	double precio;
	int cant;
	double subtotal;
	double totalPagar;
	
	String numeroserie;
	CrudVenta vdao=new CrudVenta();
	
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public Controlador() {
        super();
        // TODO Auto-generated constructor stub
    }

	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String menu=request.getParameter("menu");
		String accion=request.getParameter("accion");
		int ide=0;
		
		if(menu.equals("Index")){
			request.getRequestDispatcher("index.jsp").forward(request, response);
		}
		if(menu.equals("Principal")){
			request.getRequestDispatcher("PrincipalV2.jsp").forward(request, response);
		}
		if(menu.equals("Dashbord")){
			switch (accion){
			case "Listar":
				List lista = daoPro.ListarProducto();
				break;
			}
			request.getRequestDispatcher("PrincipalV2.jsp").forward(request, response);
		}
		if(menu.equals("Producto")){
			switch (accion){
			case "Listar":
				System.out.println("ESTOY EN LISTAR PRODCUTO");
				List lista = daoPro.ListarProducto();
				request.setAttribute("producto", lista);
				break;
			case "Agregar":
				System.out.println("ESTOY EN AGREGAR");
				String nombres=request.getParameter("txtNombres");
				String precio=request.getParameter("txtPrecio");
				String fechavencimiento=request.getParameter("txtFechaVencimiento");
				String stock=request.getParameter("txtStock");
				String estado=request.getParameter("txtEstado");
				pro.setNombres(nombres);
				pro.setPrecio(Double.parseDouble(precio));
				SimpleDateFormat formatoFecha = new SimpleDateFormat("yyyy-MM-dd");
				Date fecha;
				try {
					fecha = (Date) formatoFecha.parse(fechavencimiento);
					pro.setFechavencimiento(fecha);
				} catch (ParseException e) {
					e.printStackTrace();
				}
				pro.setStock(Integer.parseInt(stock));
				pro.setEstado(estado);
				daoPro.RegistrarProducto(pro);
				//response.reset();
				request.getRequestDispatcher("Controlador?menu=Producto&accion=Listar").forward(request, response);
				return;
			case "Editar":
				idep=Integer.parseInt(request.getParameter("id"));
				System.out.println("EL IDE VALE EN EDITAR: " + idep);
				Producto p=daoPro.listarIdPro(idep);
				request.setAttribute("Producto", p);
				request.getRequestDispatcher("Controlador?menu=Producto&accion=Listar").forward(request, response);
				return;
			case "Actualizar":
				String idpro=request.getParameter("txtIdProducto");
				String nombres1=request.getParameter("txtNombres");
				String precio1=request.getParameter("txtPrecio");
				String fechavencimiento1=request.getParameter("txtFechaVencimiento");
				String stock1=request.getParameter("txtStock");
				String estado1=request.getParameter("txtEstado");
				pro.setIdproducto(Integer.parseInt(idpro));
				pro.setNombres(nombres1);
				pro.setPrecio(Double.parseDouble(precio1));
				SimpleDateFormat formatoFecha1 = new SimpleDateFormat("yyyy-MM-dd");
				Date fecha1;
				try {
					fecha1 = (Date) formatoFecha1.parse(fechavencimiento1);
					pro.setFechavencimiento(fecha1);
				} catch (ParseException e) {
					e.printStackTrace();
				}
				pro.setStock(Integer.parseInt(stock1));
				pro.setEstado(estado1);
				
				System.out.println("EL IDE VALE EN ACTUALIZAR: " + idpro);
				daoPro.ActualizarProducto(pro);
				request.getRequestDispatcher("Controlador?menu=Producto&accion=Listar").forward(request, response);
				return;
			case "Delete":
				ide=Integer.parseInt(request.getParameter("id"));
				daoPro.EliminarProducto(ide);
				request.getRequestDispatcher("Controlador?menu=Producto&accion=Listar").forward(request, response);
				return;
			case "Buscar":				
				String nompro=request.getParameter("nom");
				System.out.println("ESTOY EN BUSCAR " + nompro);
				List p1= daoPro.buscarProductoPorNombre(nompro);
				request.setAttribute("producto", p1);				
				break;
			default:
				throw new AssertionError();
			}
			request.getRequestDispatcher("frmProducto.jsp").forward(request, response);
		}
		if(menu.equals("Cliente")){
			switch (accion){
			case "Listar":
				List lista = daoCli.ListarCliente();
				System.out.println("ESTOY EN LISTAR");
				request.setAttribute("Cliente", lista);
				break;
			case "Agregar":
				System.out.println("ESTOY EN AGREGAR");
				String dni=request.getParameter("txtDni");
				String nombres=request.getParameter("txtNombres");
				String direccion=request.getParameter("txtDireccion");
				String estado=request.getParameter("txtEstado");
				cli.setDni(dni);
				cli.setNombres(nombres);
				cli.setDireccion(direccion);
				cli.setEstado(estado);
				
				daoCli.RegistrarCliente(cli);
				//response.reset();
				request.getRequestDispatcher("Controlador?menu=Cliente&accion=Listar").forward(request, response);
				return;
				//request.getRequestDispatcher("Controlador?menu=Usuario").forward(request,response);
			case "Editar":
				ide=Integer.parseInt(request.getParameter("id"));
				System.out.println("EL IDE VALE EN EDITAR: " + ide);
				Cliente c=daoCli.listarIdCli(ide);
				request.setAttribute("cliente", c);
				request.getRequestDispatcher("Controlador?menu=Cliente&accion=Listar").forward(request, response);
				return;
			case "Actualizar":
				String idcli1=request.getParameter("txtIdeCliente");
				String dni1=request.getParameter("txtDni");
				String nombres1=request.getParameter("txtNombres");
				String direccion1=request.getParameter("txtDireccion");
				String estado1=request.getParameter("txtEstado");
				cli.setIdcliente(Integer.parseInt(idcli1));
				cli.setDni(dni1);
				cli.setNombres(nombres1);
				cli.setDireccion(direccion1);
				cli.setEstado(estado1);
				System.out.println("EL IDE VALE EN ACTUALIZAR: " + idcli1);
				daoCli.ActualizarCliente(cli);
				request.getRequestDispatcher("Controlador?menu=Cliente&accion=Listar").forward(request, response);
				return;
			case "Delete":
				ide=Integer.parseInt(request.getParameter("id"));
				daoCli.EliminarCliente(ide);
				request.getRequestDispatcher("Controlador?menu=Cliente&accion=Listar").forward(request, response);
				return;
			case "Buscar":		
				String cli1=request.getParameter("cliente_dni");
				System.out.println("ESTOY EN BUSCAR " + cli1);
				List c1= daoCli.buscarClientesPorDni(cli1);
				request.setAttribute("Cliente", c1);	
				
				break;
			default:
				throw new AssertionError();
				
			}
			request.getRequestDispatcher("frmCliente.jsp").forward(request, response);
		}
		if(menu.equals("Usuario")){
			switch (accion){
			case "Listar":
				System.out.println("ESTOY EN LISTAR");
				List lista = dao.ListarUsuario();
				request.setAttribute("usuarios", lista);

				//llenar Lista de Perfiles
				CrudPerfil llenarperfil=new CrudPerfil();
				//lo recuperado los productos los almacenamos en un listado...
				List<Perfil> listaPerfil=llenarperfil.ListarPerfil();
				//enviamos a la capa vista para llenar el select producto de la tabla lote
				request.setAttribute("listadoperfil",listaPerfil);
				System.out.println("ESTOY EN LISTAR PERFILES");
				break;
			case "Agregar":
				System.out.println("ESTOY EN AGREGAR");
				String usuario=request.getParameter("txtUsuario");
				String password=request.getParameter("txtPassword");
				String nombre=request.getParameter("txtNombre");
				String apellido=request.getParameter("txtApellido");
				String dni=request.getParameter("txtDni");
				String fechaingreso=request.getParameter("txtFechaIngreso");
				String perfil=request.getParameter("Perfiles");
				usu.setUsuario(usuario);
				usu.setPassword(password);
				usu.setNombre(nombre);
				usu.setApellido(apellido);
				usu.setDni(dni);
					SimpleDateFormat formatoFecha = new SimpleDateFormat("yyyy-MM-dd");
				Date fecha;
				try {
					fecha = (Date) formatoFecha.parse(fechaingreso);
					usu.setFechaingr(fecha);
				} catch (ParseException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
				usu.setPerfil_id(Integer.parseInt(perfil));
				
				dao.RegistrarUsuario(usu);
				//response.reset();
				request.getRequestDispatcher("Controlador?menu=Usuario&accion=Listar").forward(request, response);
				return;
				//request.getRequestDispatcher("Controlador?menu=Usuario").forward(request,response);
			case "Editar":
				ide=Integer.parseInt(request.getParameter("id"));
				System.out.println("EL IDE VALE EN EDITAR: " + ide);
				Usuarios u=dao.listarId(ide);
				request.setAttribute("usuario", u);
				request.getRequestDispatcher("Controlador?menu=Usuario&accion=Listar").forward(request, response);
				return;
			case "Actualizar":
				String id1=request.getParameter("txtIde");
				String usuario1=request.getParameter("txtUsuario");
				String password1=request.getParameter("txtPassword");
				String nombre1=request.getParameter("txtNombre");
				String apellido1=request.getParameter("txtApellido");
				String dni1=request.getParameter("txtDni");
				String fechaingreso1=request.getParameter("txtFechaIngreso");
				String perfil1=request.getParameter("Perfiles");
				usu.setUsuario(usuario1);
				usu.setPassword(password1);
				usu.setNombre(nombre1);
				usu.setApellido(apellido1);
				usu.setDni(dni1);
				SimpleDateFormat formatoFecha1 = new SimpleDateFormat("yyyy-MM-dd");
				Date fecha1;
				try {
					fecha1 = (Date) formatoFecha1.parse(fechaingreso1);
					usu.setFechaingr(fecha1);
				} catch (ParseException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
				usu.setPerfil_id(Integer.parseInt(perfil1));
				usu.setId(Integer.parseInt(id1));
				System.out.println("EL IDE VALE EN ACTUALIZAR: " + id1);
				dao.ActualizarUsuario(usu);
				request.getRequestDispatcher("Controlador?menu=Usuario&accion=Listar").forward(request, response);
				return;
			case "Delete":
				ide=Integer.parseInt(request.getParameter("id"));
				dao.EliminarUsuario(ide);
				request.getRequestDispatcher("Controlador?menu=Usuario&accion=Listar").forward(request, response);
				return;
			case "Buscar":		
				String user1=request.getParameter("usuario_nom");
				System.out.println("ESTOY EN BUSCAR " + user1);
				List u1= daoUsu.buscarUsuariosPorUsuario(user1);
				request.setAttribute("usuarios", u1);	
				
				//llenar Lista de Perfiles
				CrudPerfil llenarperfil1=new CrudPerfil();
				List<Perfil> listaPerfil1=llenarperfil1.ListarPerfil();
				request.setAttribute("listadoperfil",listaPerfil1);
				System.out.println("ESTOY EN LISTAR PERFILES");
				break;
			default:
				throw new AssertionError();
			}
			request.getRequestDispatcher("frmUsuario.jsp").forward(request, response);
		}	

		if(menu.equals("NuevaVenta")){
			switch (accion){
				case "BuscarCliente":
						String dni=request.getParameter("codigocliente");
						System.out.println("DNI " + dni);
						
						cli.setDni(dni);
						cli = daoCli.buscar(dni);
						request.setAttribute("c", cli);
						
						//MANTENER SERIE
						
						numeroserie=vdao.GenerarSerie();
						if(numeroserie==null){
							numeroserie="000000001";
							request.setAttribute("nserie", numeroserie);
						}
						else{
							int incrementar=Integer.parseInt(numeroserie);
							GenerarSerie gs=new GenerarSerie();
							numeroserie = gs.NumeroSerie(incrementar);
							request.setAttribute("nserie", numeroserie);
							System.out.println("SE GENERO NUEVO NUMERO: " + numeroserie);
						}
						//-----------------
						
						request.getRequestDispatcher("frmRegistrarVentas.jsp").forward(request, response);
						break;
				case "BuscarProducto":
						int id=Integer.parseInt(request.getParameter("codigoproducto"));
						pro=daoPro.listarIdPro(id);
						request.setAttribute("c", cli);
						request.setAttribute("producto", pro);
						request.setAttribute("lista", lista);
						request.setAttribute("totalpagar", totalPagar);
						
						//MANTENER SERIE
						
						numeroserie=vdao.GenerarSerie();
						if(numeroserie==null){
							numeroserie="000000001";
							request.setAttribute("nserie", numeroserie);
						}
						else{
							int incrementar=Integer.parseInt(numeroserie);
							GenerarSerie gs=new GenerarSerie();
							numeroserie = gs.NumeroSerie(incrementar);
							request.setAttribute("nserie", numeroserie);
							System.out.println("SE GENERO NUEVO NUMERO: " + numeroserie);
						}
						//-----------------
						
						
						request.getRequestDispatcher("frmRegistrarVentas.jsp").forward(request, response);
						break;
				case "Agregar":
						request.setAttribute("c", cli);
						totalPagar=0.0;
						item= item + 1;
						cod=pro.getIdproducto();
						descripcion = request.getParameter("nomproducto");
						precio = Double.parseDouble(request.getParameter("precio"));
						cant = Integer.parseInt(request.getParameter("cant"));
						subtotal=precio*cant;
						v=new Venta();
						
						v.setItem(item);
						v.setIdproducto(cod);
						v.setDEscripcionP(descripcion);
						v.setPrecio(precio);
						v.setCantidad(cant);
						v.setSubtotal(subtotal);
						lista.add(v);
						for (int i=0;i<lista.size();i++){
							totalPagar=totalPagar + lista.get(i).getSubtotal();
						}
						request.setAttribute("totalpagar", totalPagar);
						System.out.println("TOTAL A PAGAR - AGREGAR: " + totalPagar);
						request.setAttribute("lista", lista);
						
						//MANTENER SERIE
						
						numeroserie=vdao.GenerarSerie();
						if(numeroserie==null){
							numeroserie="000000001";
							request.setAttribute("nserie", numeroserie);
						}
						else{
							int incrementar=Integer.parseInt(numeroserie);
							GenerarSerie gs=new GenerarSerie();
							numeroserie = gs.NumeroSerie(incrementar);
							request.setAttribute("nserie", numeroserie);
							System.out.println("SE GENERO NUEVO NUMERO: " + numeroserie);
						}
						//-----------------
						
						request.getRequestDispatcher("frmRegistrarVentas.jsp").forward(request, response);
						break;
				case "GenerarVenta":
						//Actualizar Stock
					
						for (int i=0;i<lista.size();i++){
							Producto pr=new Producto();
							int cantidad=lista.get(i).getCantidad();
							

							int idproducto=lista.get(i).getIdproducto();
							CrudProducto ao= new CrudProducto();
							pr=ao.buscar(idproducto);
							System.out.println("PR: " + pr);
							System.out.println("-----------------------");
							System.out.println("Cantidad: " + cantidad);
							System.out.println("-----------------------");
							System.out.println("geetStock: " + pr.getStock());
							
							int sac=pr.getStock() - cantidad;
							ao.actualizarstock(idproducto, sac);
							System.out.println("idproducto: " + pr);
							System.out.println("stock actual: " + sac);
							
						}
					
						v.setIdcliente(cli.getIdcliente());
						v.setIdempleado(1);
						v.setNumserie(numeroserie);
						v.setFecha("2019-06-14");
						System.out.println("TOTAL A PAGAR - GENERAR VENTA: " + totalPagar);
						v.setMonto(totalPagar);
						v.setEstado("1");
						vdao.guardarVenta(v);
						int idv=Integer.parseInt(vdao.idVentas());
						for (int i=0; i<lista.size(); i++){
							v=new Venta();
							v.setId(idv);
							v.setIdproducto(lista.get(i).getIdproducto());
							v.setCantidad(lista.get(i).getCantidad());
							v.setPrecio(lista.get(i).getPrecio());
							vdao.guardarDetalleventas(v);
						}
						lista.clear();
						request.getRequestDispatcher("frmRegistrarVentas.jsp").forward(request, response);
					break;
				default:
					numeroserie=vdao.GenerarSerie();
					if(numeroserie==null){
						numeroserie="000000001";
						request.setAttribute("nserie", numeroserie);
					}
					else{
						int incrementar=Integer.parseInt(numeroserie);
						GenerarSerie gs=new GenerarSerie();
						numeroserie = gs.NumeroSerie(incrementar);
						request.setAttribute("nserie", numeroserie);
						System.out.println("SE GENERO NUEVO NUMERO: " + numeroserie);
					}
						request.getRequestDispatcher("frmRegistrarVentas.jsp").forward(request, response);
			}
			//request.getRequestDispatcher("frmRegistrarVentas.jsp").forward(request, response);
		}
		
	}
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
