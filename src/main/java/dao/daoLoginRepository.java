package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import connection.SingleConnection;
import entities.ModelLogin;

public class daoLoginRepository {

	private Connection connection;
	
	public daoLoginRepository() {
		connection = SingleConnection.getConnection();
	}
	
	public boolean login(ModelLogin login) throws Exception {
		
		String sql = "SELECT  FROM model_login WHERE login = ? AND senha =?";
		PreparedStatement sttm = connection.prepareStatement(sql);
		sttm.setString(1, login.getLogin());
		sttm.setString(2, login.getSenha());
		
		ResultSet resultSet = sttm.executeQuery();
		
		if(resultSet.next()) {
			return true;
		}
		
		return false;
	}
}
