package servlets;

import java.io.IOException;
import java.sql.SQLException;
import java.util.List;

import com.fasterxml.jackson.core.JsonParser;
import com.fasterxml.jackson.core.type.TypeReference;
import com.fasterxml.jackson.databind.ObjectMapper;

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

			if (acao != null && !acao.isEmpty()) {

				switch (acao.toLowerCase()) {

				case "deletarajax":
					//para listar todos os users
					List<ModelLogin>  users = daoUser.listaUsers();
					request.setAttribute("modelLogins", users);
					
					String idBruto = request.getParameter("id");
					Long id = idBruto != null && !idBruto.isEmpty() ? Long.parseLong(idBruto) : null;
					daoUser.delete(id);
					response.getWriter().write("Usuario excluido com sucesso!");
					break;

				case "buscaruserajax":
					//para listar todos os users
					List<ModelLogin>  usersList = daoUser.listaUsers();
					request.setAttribute("modelLogins", usersList);
					
					String nomeBusca = request.getParameter("nomeBusca");
					List<ModelLogin> dadosJsonUser = daoUser.getUserList(nomeBusca);

					// usando a biblioteca para json jackson json
					ObjectMapper mapper = new ObjectMapper();
					String json = mapper.writeValueAsString(dadosJsonUser);
					response.getWriter().write(json);
					break;

				case "vernatela":
					//para listar todos os users
					List<ModelLogin> usersListVer = daoUser.listaUsers();
					request.setAttribute("modelLogins", usersListVer);

					String idUser = request.getParameter("id");
					ModelLogin modelLogin = daoUser.getUserId(idUser);

					request.setAttribute("msgLoginUnico", "Usuario redirecionado!");
					request.setAttribute("modelLogin", modelLogin);
					request.getRequestDispatcher("principal/cadastro-usuario.jsp").forward(request, response);
					break;

				case "listausers":
					//para listar todos os users quando a pagina e carregada
					List<ModelLogin> usersListAll = daoUser.listaUsers();

					request.setAttribute("modelLogins", usersListAll);
					request.getRequestDispatcher("principal/cadastro-usuario.jsp").forward(request, response);
					break;
				default:
					break;
				}
			}

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
				//para listar todos os users quando o login e igual a um ja criado
				List<ModelLogin> usersListVer = daoUser.listaUsers();
				request.setAttribute("modelLogins", usersListVer);
				
				
				request.setAttribute("msgLoginUnico", "Esse usuario ja existe!");
				request.setAttribute("modelLogin", modelLogin);
				request.getRequestDispatcher("principal/cadastro-usuario.jsp").forward(request, response);
				return;
			}
			if (!modelLogin.newId()) {
				//para listar todos os users quando um user e atualizado
				List<ModelLogin> usersListVer = daoUser.listaUsers();
				request.setAttribute("modelLogins", usersListVer);
				msg = "Usuario atualizado com sucesso!";
			}
			modelLogin = daoUser.createUser(modelLogin);
			//para listar todos os users quando criado um novo user
			List<ModelLogin> usersListVer = daoUser.listaUsers();
			request.setAttribute("modelLogins", usersListVer);

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
