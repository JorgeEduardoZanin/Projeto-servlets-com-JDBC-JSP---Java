package servlets;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.Date;
import java.text.SimpleDateFormat;
import java.util.List;

import dao.daoRelatorioRepository;
import entities.ModelLogin;

public class ServletRelatorioController extends ServletGenericUtil {

	private static final long serialVersionUID = 1L;

	private daoRelatorioRepository daoRelatorio = new daoRelatorioRepository();

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		try {
			String acao = request.getParameter("acao");

			if (acao != null && !acao.isEmpty()) {

				switch (acao.toLowerCase()) {

				case "criarrelatorio":
					String dataInicialString = request.getParameter("dataInicial");
					String dataFinalString = request.getParameter("dataFinal");
					
					
					
					if (dataFinalString == null || dataFinalString.isEmpty() && dataInicialString == null || dataInicialString.isEmpty()) {

						List<ModelLogin> listaUsuarios = daoRelatorio.listaUsuariosRelatorio(super.getUserLogado(request));
						request.setAttribute("listaUsers", listaUsuarios);
						request.getRequestDispatcher("principal/relatorio-usuario.jsp").forward(request, response);
						return;
					}
					
					Date dataInicial = new Date(new SimpleDateFormat("dd/MM/yyyy").parse(dataInicialString).getTime());
					Date dataFinal = new Date(new SimpleDateFormat("dd/MM/yyyy").parse(dataFinalString).getTime());
					
					List<ModelLogin> listaUsuariosPorData = daoRelatorio.listaUsuarioPorData(dataInicial, dataFinal);
					request.setAttribute("listaUsers", listaUsuariosPorData);
					request.setAttribute("dataInicial", dataInicialString);
					request.setAttribute("dataFinal", dataFinalString);
					request.getRequestDispatcher("principal/relatorio-usuario.jsp").forward(request, response);
					break;
				default:
					request.getRequestDispatcher("principal/relatorio-usuario.jsp").forward(request, response);
					break;
				}
			}
		} catch (Exception e) {
			e.printStackTrace();
			System.out.println(e.getMessage());

		}
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

	}

}
