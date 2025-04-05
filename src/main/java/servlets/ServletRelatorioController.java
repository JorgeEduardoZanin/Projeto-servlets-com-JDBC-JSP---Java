package servlets;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import utilitarios.ReportUtil;

import java.io.File;
import java.io.IOException;
import java.sql.Date;
import java.text.SimpleDateFormat;
import java.util.HashMap;
import java.util.List;

import org.apache.tomcat.util.codec.binary.Base64;

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
					
					List<ModelLogin> listaUsuariosPorData = daoRelatorio.listaUsuarioPorData(dataInicial, dataFinal, super.getUserLogado(request));
					request.setAttribute("listaUsers", listaUsuariosPorData);
					request.setAttribute("dataInicial", dataInicialString);
					request.setAttribute("dataFinal", dataFinalString);
					request.getRequestDispatcher("principal/relatorio-usuario.jsp").forward(request, response);
					break;
					
				case "imprimirrelatoriopdf":
				case "imprimirrelatorioexcel":
					
					String dataInicialStringPdf = request.getParameter("dataInicial");
					String dataFinalStringPdf = request.getParameter("dataFinal");
					List<ModelLogin> listModelLogin = null;
					
					if (dataInicialStringPdf == null || dataInicialStringPdf.isEmpty() && dataFinalStringPdf == null || dataFinalStringPdf.isEmpty()) {
						
						listModelLogin = daoRelatorio.listaUsuariosRelatorio(super.getUserLogado(request));
					}else{
						Date dataInicialPdf = new Date(new SimpleDateFormat("dd/MM/yyyy").parse(dataInicialStringPdf).getTime());
						Date dataFinalPdf = new Date(new SimpleDateFormat("dd/MM/yyyy").parse(dataFinalStringPdf).getTime());
						listModelLogin = daoRelatorio.listaUsuarioPorData(dataInicialPdf, dataFinalPdf, super.getUserLogado(request));
					}
					
					HashMap<String, Object> parametros = new HashMap<String,Object>();	
					parametros.put("PARAM_SUB_REPORT", request.getServletContext().getRealPath("relatorio") + File.separator);
					
					byte[] relatorio = null;
					String extensao = "";
					
					if(acao.equalsIgnoreCase("imprimirrelatoriopdf")) {
						relatorio = new ReportUtil().geraRelatorioPDF(listModelLogin, "relatorio-user-jsp", parametros, request.getServletContext());
						extensao = "pdf";
					}else if(acao.equalsIgnoreCase("imprimirrelatorioexcel")) {
						relatorio = new ReportUtil().geraRelatorioExcel(listModelLogin, "relatorio-user-jsp", parametros, request.getServletContext());
						extensao = "xls";
					}
					
					response.setHeader("Content-Disposition","attachment;filename=arquivo." + extensao);
					response.getOutputStream().write(relatorio);
					
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
