package servlets;

import java.io.Serializable;

import dao.daoUserRepository;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpSession;


public class ServletGenericUtil extends HttpServlet implements Serializable{

	private static final long serialVersionUID = 1L;
	

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
 