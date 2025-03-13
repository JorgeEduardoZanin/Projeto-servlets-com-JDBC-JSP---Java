package servlets;

import java.io.IOException;
import java.sql.SQLException;

import dao.daoUserRepository;
import entities.ModelLogin;
import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

public class ServletUsuarioController extends HttpServlet {
	private static final long serialVersionUID = 1L;

	private daoUserRepository daoUser = new daoUserRepository();

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		try {
			String acao = request.getParameter("acao");

			if (acao != null && !acao.isEmpty() && acao.equalsIgnoreCase("deletarAjax")) {
				String idBruto = request.getParameter("id");
				Long id = idBruto != null && !idBruto.isEmpty() ? Long.parseLong(idBruto) : null;

				daoUser.delete(id);
				
				response.getWriter().write("Usuario excluido com sucesso!");
			}
			
			
		} catch (SQLException e) {
			RequestDispatcher redirecionar = request.getRequestDispatcher("erro.jsp");
			request.setAttribute("msg", e.getMessage());
			redirecionar.forward(request, response);
			e.printStackTrace();
		}
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		try {
			String msg = "Usuario criado com sucesso!";
			String idBruto = request.getParameter("id");
			String name = request.getParameter("name");
			String email = request.getParameter("email");
			String senha = request.getParameter("senha");
			String login = request.getParameter("login");

			Long id = idBruto != null && !idBruto.isEmpty() ? Long.parseLong(idBruto) : null;
			ModelLogin modelLogin = new ModelLogin(id, name, email, login, senha);

			boolean loginUnico = daoUser.loginUnico(login);

			if (loginUnico == true && modelLogin.getId() == null) {
				request.setAttribute("msgLoginUnico", "Esse usuario ja existe!");
				request.setAttribute("modelLogin", modelLogin);
				request.getRequestDispatcher("principal/cadastro-usuario.jsp").forward(request, response);
				return;
			}
			if (!modelLogin.newId()) {
				msg = "Usuario atualizado com sucesso!";
			}
			modelLogin = daoUser.createUser(modelLogin);
			
			request.setAttribute("msg", msg);
			request.setAttribute("modelLogin", modelLogin);
			request.getRequestDispatcher("principal/cadastro-usuario.jsp").forward(request, response);

		} catch (SQLException e) {
			RequestDispatcher redirecionar = request.getRequestDispatcher("erro.jsp");
			request.setAttribute("msg", e.getMessage());
			redirecionar.forward(request, response);
			e.printStackTrace();
		} catch (Exception e) {
			RequestDispatcher redirecionar = request.getRequestDispatcher("erro.jsp");
			request.setAttribute("msg", e.getMessage());
			redirecionar.forward(request, response);
			e.printStackTrace();
		}

	}

}
