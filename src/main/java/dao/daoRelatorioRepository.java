package dao;

import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import connection.SingleConnection;
import entities.ModelLogin;
import net.bytebuddy.dynamic.scaffold.MethodRegistry.Prepared;

public class daoRelatorioRepository {
	
	private Connection connection;
	
	public daoRelatorioRepository() {
		connection = SingleConnection.getConnection();
	}
	
	public List<ModelLogin> resultSetList(ResultSet resultSet) throws SQLException {
		ModelLogin modelLogin = new ModelLogin();
		List<ModelLogin> lista = new ArrayList<ModelLogin>();

		while (resultSet.next()) {
			String name = resultSet.getString("name");
			String loginUser = resultSet.getString("login");
			long id = resultSet.getLong("id");
			String email = resultSet.getString("email");
			String senha = resultSet.getString("senha");
			String cargo = resultSet.getString("cargo");
			String sexo = resultSet.getString("sexo");
			String UF = resultSet.getString("UF");
			String bairro = resultSet.getString("bairro");
			String numero = resultSet.getString("numero");
			String logradouro = resultSet.getString("logradouro");
			String localidade = resultSet.getString("localidade");
			String cep = resultSet.getString("cep");
			Date dataNascimento = resultSet.getDate("datanascimento");
			Double salarioMensal = resultSet.getDouble("salariomensal");

			modelLogin = new ModelLogin(id, name,  email,  loginUser, senha, cargo, sexo,
					 cep,  bairro,  logradouro,  localidade,  UF,  numero,  dataNascimento,  salarioMensal);
			lista.add(modelLogin);

		}

		return lista;
	}
	
	
	public List<ModelLogin> listaUsuariosRelatorio(Long userLogado) throws Exception {
		String sql = "SELECT * FROM model_login WHERE useradmin = false ORDER BY id ASC";
		PreparedStatement sttm = connection.prepareStatement(sql);
		ResultSet resultSet = sttm.executeQuery();

		return this.resultSetList(resultSet);
	}
	
	
	public List<ModelLogin> listaUsuarioPorData(Date dataInicial, Date dataFinal, Long userLogado) throws SQLException{
		String sql = "SELECT * FROM model_login WHERE useradmin = false AND datanascimento BETWEEN ? AND ? ORDER BY id ASC";
		PreparedStatement sttm = connection.prepareStatement(sql);
		sttm.setDate(1, dataInicial);
		sttm.setDate(2, dataFinal);
		
		
		ResultSet resultSet = sttm.executeQuery();
		
		return resultSetList(resultSet);
		
	}

}
