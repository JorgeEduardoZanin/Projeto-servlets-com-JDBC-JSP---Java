package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import connection.SingleConnection;
import entities.ModelLogin;
import entities.ModelTelefone;

public class daoTelefoneRepository {

	private Connection connection;
	private daoUserRepository daoUser = new daoUserRepository();
	
	public daoTelefoneRepository() {
		connection = SingleConnection.getConnection();
	}
	
	public List<ModelTelefone> resultSet(ResultSet resultSet) throws Exception {
		
		ModelTelefone modelTelefone = new ModelTelefone();
		List<ModelTelefone> telefoneUser = new ArrayList<ModelTelefone>();
		
		
		
		while(resultSet.next()) {
			Long idUserPai = resultSet.getLong("usuario_pai_id");
			Long idUserCad = resultSet.getLong("usuario_cad_id");
			
			String  numero = resultSet.getString("numero");
			ModelLogin userPai = daoUser.buscaPorId(idUserPai);
			ModelLogin userCadastro = daoUser.buscaPorId(idUserCad);	

			modelTelefone = new ModelTelefone(numero, userPai, userCadastro);
			modelTelefone.setId(resultSet.getLong("id"));
			telefoneUser.add(modelTelefone);
		}
		
		return telefoneUser;
	}
	
	
	public void createTelefone(ModelTelefone modelTelefone) throws SQLException {

		String numero = modelTelefone.getNumero();
		Long idPai = modelTelefone.getUsuario_pai_id().getId();
		Long idCad = modelTelefone.getUsuario_cad_id().getId();

		PreparedStatement sttm = null;
	 
			String sql = "INSERT INTO telefone (numero, usuario_pai_id, usuario_cad_id) VALUES ( ?, ?, ?);";
			sttm = connection.prepareStatement(sql);

			sttm.setString(1, numero);
			sttm.setLong(2, idPai);
			sttm.setLong(3, idCad);

			sttm.execute();
			connection.commit();

	}
	
	
	public List<ModelTelefone> getTelefone(String userPaiId) throws Exception {
		String sql = "SELECT * FROM telefone WHERE usuario_pai_id = (?) ORDER BY id ASC;";
		PreparedStatement sttm = connection.prepareStatement(sql);
		sttm.setLong(1, Long.parseLong(userPaiId));
		ResultSet resultSet = sttm.executeQuery();
		
		return this.resultSet(resultSet);
	
	}
	
	public void deleteTel(long id) throws SQLException {

		String sql = "DELETE FROM telefone WHERE id =(?)";
		PreparedStatement sttm = connection.prepareStatement(sql);
		sttm.setLong(1, id);
		sttm.executeUpdate();

		connection.commit();

	}
	

}
