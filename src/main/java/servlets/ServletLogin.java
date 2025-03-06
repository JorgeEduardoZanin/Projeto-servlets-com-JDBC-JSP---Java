package servlets;

import java.io.IOException;

import dao.daoLoginRepository;
import entities.ModelLogin;
import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;



public class ServletLogin extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	private daoLoginRepository loginRepository = new daoLoginRepository();
    
	public ServletLogin() {
   
    }


	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String acao = request.getParameter("acao"); 
		if(acao != null && acao.isEmpty() && acao.equalsIgnoreCase("logout")) {
			request.getSession().invalidate();
			 RequestDispatcher redirecionar = request.getRequestDispatcher("index.jsp");
             request.setAttribute("msg", "Logout feito com suceeso!");
             redirecionar.forward(request, response);
             return;
		}
		
		doPost(request, response);
		 
	}

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        try {
            String login = request.getParameter("login");
            String senha = request.getParameter("senha");
            String url = request.getParameter("url");

            if (login == null || login.isEmpty() || senha == null || senha.isEmpty()) {
                RequestDispatcher redirecionar = request.getRequestDispatcher("/index.jsp");
                request.setAttribute("msg", "Insira a senha e login corretamente!");
                redirecionar.forward(request, response);
                return;
            }

            ModelLogin modelLogin = new ModelLogin();
            modelLogin.setLogin(login);
            modelLogin.setSenha(senha);
            
            if( !loginRepository.login(modelLogin)) {
            	 RequestDispatcher redirecionar = request.getRequestDispatcher("/index.jsp");
                 request.setAttribute("msg", "Insira a senha e login corretamente!");
                 redirecionar.forward(request, response);
                 return;
            }
           
            request.getSession().setAttribute("usuario", modelLogin.getLogin());
            if(url==null||url.equals("null")) {
            	url = "/principal/principal.jsp";
            }
            RequestDispatcher redirecionar = request.getRequestDispatcher(url);
            redirecionar.forward(request, response);
            
        } catch (Exception e) {
            e.printStackTrace();
         	 RequestDispatcher redirecionar = request.getRequestDispatcher("principal/erro.jsp");
             request.setAttribute("msg", e.getMessage());
             redirecionar.forward(request, response);
        }
    }

}
