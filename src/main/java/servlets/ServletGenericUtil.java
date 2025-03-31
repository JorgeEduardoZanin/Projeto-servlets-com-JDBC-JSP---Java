package servlets;

import java.io.Serializable;
import java.sql.Connection;

import connection.SingleConnection;
import dao.daoUserRepository;
import filter.FilterAutenticacao;
import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import jakarta.xml.bind.DataBindingException;

public class ServletGenericUtil extends HttpServlet implements Serializable{

	private static final long serialVersionUID = 1L;
	
	private FilterAutenticacao filtro = new FilterAutenticacao();
	private daoUserRepository daoUser = new daoUserRepository();  
	
	public Long getUserLogado(HttpServletRequest request) throws Exception {
 		HttpServletRequest req = (HttpServletRequest) request;
		HttpSession session = req.getSession();
		
		String usuarioLogado = (String) session.getAttribute("usuario");
		
		if(usuarioLogado == null) {
			 throw new Exception("Sessão expirada, faça o login novamente!");
		}
		
		return daoUser.getUserLogado(usuarioLogado).getId();
		
	}

}
 