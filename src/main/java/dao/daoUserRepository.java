package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import connection.SingleConnection;
import entities.ModelLogin;

public class daoUserRepository {

	private Connection connection;

	public daoUserRepository() {
		connection = SingleConnection.getConnection();
	}

	public ModelLogin createUser(ModelLogin modelLogin) throws SQLException {

		try {
			PreparedStatement sttm = null;
			
			String login = modelLogin.getLogin();
			String senha = modelLogin.getSenha();
			String name = modelLogin.getName();
			String email = modelLogin.getEmail();
			
			if(modelLogin.newId()) {
			String sql = "INSERT INTO model_login(login, senha, name, email) VALUES (?, ?, ?, ?);";
			sttm = connection.prepareStatement(sql);

		

			sttm.setString(1, login);
			sttm.setString(2, senha);
			sttm.setString(3, name);
			sttm.setString(4, email);

			sttm.execute();
			connection.commit();
		    return this.getUser(modelLogin.getLogin()); 
			}
			
			String sql = "UPDATE model_login SET login=(?), senha=(?), name=(?), email=(?) WHERE id=(?);";
			sttm = connection.prepareStatement(sql);
			
			sttm.setString(1, login);
			sttm.setString(2, senha);
			sttm.setString(3, name);
			sttm.setString(4, email);
			sttm.setLong(5, modelLogin.getId());
			
			sttm.executeUpdate();
			connection.commit();
			
		    return this.getUser(modelLogin.getLogin()); 
			
		} catch (Exception e) {
			e.printStackTrace();
			connection.rollback();
			return null;
		}

	}

	public ModelLogin getUser(String login) throws Exception {
		ModelLogin modelLogin = new ModelLogin();

		String sql = "SELECT login, senha, id, name, email FROM model_login WHERE login = (?);";
		PreparedStatement sttm = connection.prepareStatement(sql);
		sttm.setString(1, login);
		ResultSet resultSet = sttm.executeQuery();

		while (resultSet.next()) {
			String name = resultSet.getString("name");
			String loginUser = resultSet.getString("login");
			long id = resultSet.getLong("id");
			String email = resultSet.getString("email");
			String senha = resultSet.getString("senha");

			modelLogin = new ModelLogin(id, name, email, loginUser, senha);
		}

		return modelLogin;
	}

	public boolean loginUnico(String login) throws Exception {

		String sql = "SELECT count(1) > 0 from model_login WHERE login = (?)";
		PreparedStatement sttm = connection.prepareStatement(sql);
		sttm.setString(1, login);
		ResultSet resultSet = sttm.executeQuery();
		if (resultSet.next()) {
			return resultSet.getBoolean(1); 
		}

		return false;
	}
	
	public void delete(long id) throws SQLException {
		
		String sql = "DELETE FROM model_login WHERE id =(?)";
		PreparedStatement sttm = connection.prepareStatement(sql);
		sttm.setLong(1, id);
		sttm.executeUpdate();
		
		
		connection.commit();
		
	}
}
