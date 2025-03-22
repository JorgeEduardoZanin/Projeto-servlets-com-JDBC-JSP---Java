package services;

import java.sql.ResultSet;
import java.sql.SQLException;

public class UserService {

	
	public int totalPaginasPaginacao(ResultSet resultSet) throws SQLException{
		
		Double cadastro = resultSet.getDouble("total");
		Double cadastroPorPagina = 5.0;
		
		Double pagina = cadastro / cadastroPorPagina;
		
		Double resto = pagina % 2;
		
		if(resto > 0) {
			pagina++;
		}
		
		return pagina.intValue();
	}
	
}
