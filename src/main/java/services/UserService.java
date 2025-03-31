package services;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;

import connection.SingleConnection;
import entities.ModelLogin;

public class UserService {

	
	public int totalPaginasPaginacao(ResultSet resultSet) throws SQLException{
		
		resultSet.next();
		Double cadastro = resultSet.getDouble("total");
		Double cadastroPorPagina = 5.0;
		
		Double pagina = cadastro / cadastroPorPagina;
		
		Double resto = pagina % 2;
		
		if(resto > 0) {
			pagina++;
		}
		
		return pagina.intValue();
	}
	
	public void calculaSalario(ModelLogin modelLogin) {
	
		Double salario;
		Double calculaSalario;
		
		
		switch (modelLogin.getCargo().toLowerCase()) {
		
		case "administrador": 
			salario = modelLogin.getSalarioMensal();
			calculaSalario = salario * 0.5;
			modelLogin.setSalarioMensal(calculaSalario + modelLogin.getSalarioMensal());
			break;
		
		case "financeiro": 
			salario = modelLogin.getSalarioMensal();
			calculaSalario = salario * 0.3;
			modelLogin.setSalarioMensal(calculaSalario + modelLogin.getSalarioMensal());
			break;
		
		case "secretaria": 
			salario = modelLogin.getSalarioMensal();
			calculaSalario = salario * 0.1;
			modelLogin.setSalarioMensal(calculaSalario + modelLogin.getSalarioMensal());
			break;	
		}
		
		
	}
	
}
