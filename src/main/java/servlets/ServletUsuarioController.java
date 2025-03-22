package servlets;

import java.io.IOException;
import java.sql.SQLException;
import java.util.List;

import org.apache.commons.fileupload2.jakarta.JakartaServletFileUpload;
import org.apache.tomcat.jakartaee.commons.compress.utils.IOUtils;
import org.apache.tomcat.util.codec.binary.Base64;

import jakarta.servlet.http.Part;
import com.fasterxml.jackson.core.JsonParser;
import com.fasterxml.jackson.core.type.TypeReference;
import com.fasterxml.jackson.databind.ObjectMapper;

import dao.daoUserRepository;
import entities.ModelLogin;
import filter.FilterAutenticacao;
import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.MultipartConfig;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@MultipartConfig
public class ServletUsuarioController extends ServletGenericUtil {
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
					List<ModelLogin>  users = daoUser.listaUsers(super.getUserLogado(request));
					request.setAttribute("modelLogins", users);
					
					String idBruto = request.getParameter("id");
					Long id = idBruto != null && !idBruto.isEmpty() ? Long.parseLong(idBruto) : null;
					daoUser.delete(id);
					response.getWriter().write("Usuario excluido com sucesso!");
					break;

				case "buscaruserajax":
					//para listar todos os users
					List<ModelLogin>  usersList = daoUser.listaUsers(super.getUserLogado(request));
					request.setAttribute("modelLogins", usersList);
					
					String nomeBusca = request.getParameter("nomeBusca");
					List<ModelLogin> dadosJsonUser = daoUser.getUserList(nomeBusca, super.getUserLogado(request));

					// usando a biblioteca para json jackson
					ObjectMapper mapper = new ObjectMapper();
					String json = mapper.writeValueAsString(dadosJsonUser);
					response.getWriter().write(json);
					break;

				case "vernatela":
					//para listar todos os users
					List<ModelLogin> usersListVer = daoUser.listaUsers(super.getUserLogado(request));
					request.setAttribute("modelLogins", usersListVer);

					String idUser = request.getParameter("id");
					ModelLogin modelLogin = daoUser.getUserId(idUser, super.getUserLogado(request) );

					request.setAttribute("msgLoginUnico", "Usuario redirecionado!");
					request.setAttribute("modelLogin", modelLogin);
					request.getRequestDispatcher("principal/cadastro-usuario.jsp").forward(request, response);
					break;

				case "listausers":
					//para listar todos os users quando a pagina e carregada
					List<ModelLogin> usersListAll = daoUser.listaUsers(super.getUserLogado(request));

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
			String cargo = request.getParameter("cargo");
			String sexo = request.getParameter("sexo");
			
			Long id = idBruto != null && !idBruto.isEmpty() ? Long.parseLong(idBruto) : null;
			
			ModelLogin modelLogin = new ModelLogin(id, name, email, login, senha, cargo, sexo);
			
			if(JakartaServletFileUpload.isMultipartContent(request)) {
				Part part = request.getPart("filefoto");
				
				if(part.getSize() > 0) {
				byte[] foto = IOUtils.toByteArray(part.getInputStream());
				new Base64();
				String imagembase64 = "data:image/"+part.getContentType().split("\\/")[1]+";base64,"+Base64.encodeBase64String(foto);
				System.out.println(imagembase64);
				
				modelLogin.setFotoUser(imagembase64);
				modelLogin.setExtensaoFotoUser(part.getContentType().split("\\/")[1]);
				
				}
			}

			boolean loginUnico = daoUser.loginUnico(login);
			String use;
			if (loginUnico == true && modelLogin.getId() == null) {
				//para listar todos os users quando o login e igual a um ja criado
				List<ModelLogin> usersListVer = daoUser.listaUsers(super.getUserLogado(request));
				request.setAttribute("modelLogins", usersListVer);
				
				
				request.setAttribute("msgLoginUnico", "Esse usuario ja existe!");
				request.setAttribute("modelLogin", modelLogin);
				request.getRequestDispatcher("principal/cadastro-usuario.jsp").forward(request, response);
				String bata;
				return;
			}
			if (!modelLogin.newId()) {
				//para listar todos os users quando um user e atualizado
				List<ModelLogin> usersListVer = daoUser.listaUsers(super.getUserLogado(request));
				request.setAttribute("modelLogins", usersListVer);
				msg = "Usuario atualizado com sucesso!";
			}
			modelLogin = daoUser.createUser(modelLogin, super.getUserLogado(request));
			//para listar todos os users quando criado um novo user
			List<ModelLogin> usersListVer = daoUser.listaUsers(super.getUserLogado(request));
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
