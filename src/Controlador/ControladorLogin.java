package Controlador;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.sun.glass.ui.Window.Level;
import com.sun.javafx.logging.Logger;

import Dao.CrudUsuario;
import Modelo.Usuarios;

/**
 * Servlet implementation class ControladorLogin
 */
@WebServlet("/ControladorLogin")
public class ControladorLogin extends HttpServlet {
	private static final long serialVersionUID = 1L;
	
    public ControladorLogin() {
        super();
    }
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String usuario=request.getParameter("usuario");
		String password=request.getParameter("password");
		String nombre=request.getParameter("nombre");
		String apellido=request.getParameter("apellido");
		String mensaje="";
		String url="";
		String user="";
		String nom="";
		String ape="";
		Usuarios usu=new Usuarios();
		CrudUsuario val=new CrudUsuario();
		
		usu.setUsuario(usuario);
		usu.setPassword(password);
		usu.setNombre(nombre);
		usu.setApellido(apellido);
		
		Usuarios validar=val.ValidarUsuario(usu);
		if(validar.getUsuario()!=null && validar.getPassword()!=null){
			mensaje="false";
			url="/PrincipalV2.jsp";
			user=usuario;
			nom=validar.getNombre();
			ape=validar.getApellido();
			
			request.setAttribute("usuario",user);
			request.setAttribute("nombre",nom);
			request.setAttribute("apellido",ape);
			request.getRequestDispatcher("Controlador?menu=Principal").forward(request,response);
			
		} else {
			mensaje="true";
			url="/index.jsp";
			request.setAttribute("mensaje",mensaje);
			request.getRequestDispatcher("Controlador?menu=Index").forward(request,response);
		}
		request.setAttribute("mensaje",mensaje);
		System.out.println("RESPUESTA LOGIN: " + mensaje);
		System.out.println("URL: " + url);
		
		System.out.println(usuario + " " + nom);
	}
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String mensajea="false";
		request.setAttribute("mensaje",mensajea);
		request.getRequestDispatcher("index.jsp").forward(request, response);
		
	}
}
