package servlets;

import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;


import java.io.IOException;
import java.util.HashMap;
import java.util.Map;

import com.fasterxml.jackson.databind.ObjectMapper;

import dao.daoGraficoRepository;

public class ServletGraficoController extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private daoGraficoRepository daoGrafico = new daoGraficoRepository();

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String acao = request.getParameter("acao");
		
		if(acao != null && !acao.isEmpty()) {
			
			switch (acao.toLowerCase()) {

				case "criargrafico":
					try {
					
						Double mediaAdmin = daoGrafico.mediaSalarioAdmin();
						Double mediaFinanceiro = daoGrafico.mediaSalarioFinanceiro();
						Double mediaSecretaria = daoGrafico.mediaSalarioSecretaria();
						
						Map<String, Double> mediasSalariais = new HashMap<>();					
						mediasSalariais.put("mediaAdministrador", mediaAdmin);
						mediasSalariais.put("mediaFinanceiro", mediaFinanceiro);
						mediasSalariais.put("mediaSecretaria", mediaSecretaria);
						
						// usando a biblioteca para json jackson
						ObjectMapper mapperMediasSalariais = new ObjectMapper();
						String jsonMediaSalariais = mapperMediasSalariais.writeValueAsString(mediasSalariais);
						
						response.getWriter().write(jsonMediaSalariais);
					
					}catch (Exception e) {
						e.printStackTrace();
						System.out.println(e.getMessage());
					}
					break;
				default:
					break;
					
			}
		}
		
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
	}

}
