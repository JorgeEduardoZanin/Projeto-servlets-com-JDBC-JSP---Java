package servlets;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;
import java.util.List;

import com.fasterxml.jackson.databind.ObjectMapper;

import dao.daoTelefoneRepository;
import dao.daoUserRepository;
import entities.ModelLogin;
import entities.ModelTelefone;

/**
 * Servlet implementation class ServletTelefoneController
 */
public class ServletTelefoneController extends ServletGenericUtil {
	private static final long serialVersionUID = 1L;

	private daoUserRepository daoUser = new daoUserRepository();
	private daoTelefoneRepository daoTelefone = new daoTelefoneRepository();

	public ServletTelefoneController() {
	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	
		try {	
		
			String acao = request.getParameter("acao");
			String idBruto = request.getParameter("id");
			Long id = idBruto != null && !idBruto.isEmpty() ? Long.parseLong(idBruto) : null;
	
			if (acao != null && !acao.isEmpty()) {
	
				switch (acao.toLowerCase()) {
			
					case "listartelefone":
						String idUserTel = request.getParameter("idUser");
			
						List<ModelTelefone> listaTelefoneJson = daoTelefone.getTelefone(idUserTel);
		
						// usando a biblioteca para json jackson
						ObjectMapper mapperTel = new ObjectMapper();
						String jsonTel = mapperTel.writeValueAsString(listaTelefoneJson);
						response.getWriter().write(jsonTel);
						break;
					case "deletartel":	
						String idTel = request.getParameter("idTelefone");
						
						daoTelefone.deleteTel(Long.parseLong(idTel));
						
						break;
					
					default:
						break;
				}
			}
		}catch (Exception e) {
			e.getMessage();
		}	
	
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		
		try {
			HttpServletRequest req = (HttpServletRequest) request;
			HttpSession session = req.getSession();
			String usuarioLogado = (String) session.getAttribute("usuario");
		
			String idPai = request.getParameter("idPai");
			String numeroTel = request.getParameter("novoTelefone");
			
			ModelLogin modelLogin = daoUser.buscaPorId(Long.parseLong(idPai));
			
			ModelTelefone modelTelefone = new ModelTelefone(numeroTel,  modelLogin, daoUser.getUserLogado(usuarioLogado));
			
			daoTelefone.createTelefone(modelTelefone);
			
		}catch (Exception e) {
			e.getMessage();
		}	
		

	}

}
