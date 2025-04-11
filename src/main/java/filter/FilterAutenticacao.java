package filter;

import java.io.IOException;
import java.sql.Connection;
import java.sql.SQLException;

import connection.SingleConnection;
import jakarta.servlet.Filter;
import jakarta.servlet.FilterChain;
import jakarta.servlet.FilterConfig;
import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.ServletRequest;
import jakarta.servlet.ServletResponse;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpSession;

public class FilterAutenticacao implements Filter {

	private static Connection connection;

	public FilterAutenticacao() {
	}

	public void destroy() {
		try {
			connection.close();
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}

	public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain)
			throws IOException, ServletException {
		try {
			HttpServletRequest req = (HttpServletRequest) request;
			HttpSession session = req.getSession();

			String usuarioLogado = (String) session.getAttribute("usuario");

			String urlAutenticar = req.getServletPath();

			// Ignorar recursos públicos e a página de login
			if (urlAutenticar.endsWith(".css") || urlAutenticar.endsWith(".js") || urlAutenticar.endsWith(".png")
					|| urlAutenticar.endsWith(".jpg") || urlAutenticar.endsWith(".gif")
					|| urlAutenticar.equalsIgnoreCase("/index.jsp")
					|| urlAutenticar.equalsIgnoreCase("/ServletLogin") || urlAutenticar.equalsIgnoreCase("/principal/ServletLogin")) {
				chain.doFilter(request, response);
				return;
			}

			if (usuarioLogado == null && !urlAutenticar.equalsIgnoreCase("/principal/ServletLogin")) {
				RequestDispatcher redireciona = request.getRequestDispatcher("/index.jsp?url=" + urlAutenticar);
				request.setAttribute("msg", "Por favor realize o login!");
				redireciona.forward(request, response);
				return;
			}

			chain.doFilter(request, response);
			connection.commit();
		} catch (Exception e) {
			e.printStackTrace();
			RequestDispatcher redirecionar = request.getRequestDispatcher("erro.jsp");
			request.setAttribute("msg", e.getMessage());
			redirecionar.forward(request, response);
			try {
				connection.rollback();
			} catch (SQLException e1) {
				e1.printStackTrace();
			}
		}
	}

	public void init(FilterConfig fConfig) throws ServletException {
		connection = SingleConnection.getConnection();
	}

}
