package dao;

import java.io.Serializable;
import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import connection.SingleConnection;
import entities.ModelLogin;
import entities.ModelTelefone;

public class daoGraficoRepository implements Serializable {

	private static final long serialVersionUID = 1L;
	private Connection connection;
	
	
	public daoGraficoRepository() {
		connection = SingleConnection.getConnection();
	}
	
	
	public Double resultSetMediaSecretaria(ResultSet resultSet) throws Exception {
		
		int quantidadeSecretaria = 0;
		Double totalSalarios = 0.0;

		while (resultSet.next()) {
		
			Double salarioMensal = resultSet.getDouble("salariomensal");
			
			totalSalarios += salarioMensal;
			quantidadeSecretaria += 1;
		}
		return totalSalarios / quantidadeSecretaria;
	}
	
	public Double mediaSalarioSecretaria() throws Exception{
		
		String sql = "SELECT salariomensal FROM model_login WHERE cargo=(?)";
		PreparedStatement sttm = connection.prepareStatement(sql);
		sttm.setString(1, "Secretaria");
		ResultSet resultSet = sttm.executeQuery();
		
		return this.resultSetMediaSecretaria(resultSet);
		
	}
	
	public Double resultSetMediaFinanceiro(ResultSet resultSet) throws Exception {
		
		int quantidadeFinanceiro = 0;
		Double totalSalarios = 0.0;

		while (resultSet.next()) {
		
			Double salarioMensal = resultSet.getDouble("salariomensal");
			
			totalSalarios += salarioMensal;
			quantidadeFinanceiro += 1;
		}
		return totalSalarios / quantidadeFinanceiro;
	}
	
	public Double mediaSalarioFinanceiro() throws Exception{
		
		String sql = "SELECT salariomensal FROM model_login WHERE cargo=(?)";
		PreparedStatement sttm = connection.prepareStatement(sql);
		sttm.setString(1, "Financeiro");
		ResultSet resultSet = sttm.executeQuery();
		
		return this.resultSetMediaFinanceiro(resultSet);
		
	}
	
public Double resultSetMediaAdmin(ResultSet resultSet) throws Exception {
		
		int quantidadeFinanceiro = 0;
		Double totalSalarios = 0.0;

		while (resultSet.next()) {
		
			Double salarioMensal = resultSet.getDouble("salariomensal");
			
			totalSalarios += salarioMensal;
			quantidadeFinanceiro += 1;
		}
		return totalSalarios / quantidadeFinanceiro;
	}
	
	public Double mediaSalarioAdmin() throws Exception{
		
		String sql = "SELECT salariomensal FROM model_login WHERE cargo=(?)";
		PreparedStatement sttm = connection.prepareStatement(sql);
		sttm.setString(1, "Administrador");
		ResultSet resultSet = sttm.executeQuery();
		
		return this.resultSetMediaFinanceiro(resultSet);
		
	}
	
	
	

}
