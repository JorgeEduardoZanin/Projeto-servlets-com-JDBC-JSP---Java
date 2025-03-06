package servlets;

import java.io.IOException;

import entities.ModelLogin;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;



public class ServletUsuarioController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       

 
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	
		
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	
		String idBruto = request.getParameter("id");
		String name = request.getParameter("name");
		String email = request.getParameter("email");
		String senha = request.getParameter("senha");		
		String login = request.getParameter("login");
		
		Long id = idBruto != null && !idBruto.isEmpty() ? Long.parseLong(idBruto) :null;
		ModelLogin modelLogin = new ModelLogin(id, name, email, login, senha);
		System.out.println(modelLogin);
	}

}
