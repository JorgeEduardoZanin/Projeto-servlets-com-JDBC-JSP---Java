package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import connection.SingleConnection;
import entities.ModelLogin;
import net.bytebuddy.dynamic.scaffold.MethodRegistry.Prepared;
import services.UserService;

public class daoUserRepository {

	private Connection connection;
	private UserService userService = new UserService();

	public daoUserRepository() {
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
			
			modelLogin = new ModelLogin(id, name, email, loginUser, senha, cargo, sexo, UF, bairro, numero, logradouro, localidade, cep);
			lista.add(modelLogin);
			
		}
		
		return lista;
	}

	public ModelLogin resultSet(ResultSet resultSet) throws SQLException {
		ModelLogin modelLogin = new ModelLogin();
		
		while (resultSet.next()) {
			String name = resultSet.getString("name");
			String loginUser = resultSet.getString("login");
			long id = resultSet.getLong("id");
			String email = resultSet.getString("email");
			String senha = resultSet.getString("senha");
			String cargo = resultSet.getString("cargo");
			String sexo = resultSet.getString("sexo");
			String fotoUser = resultSet.getString("fotouser");
			String UF = resultSet.getString("UF");
			String bairro = resultSet.getString("bairro");
			String numero = resultSet.getString("numero");
			String logradouro = resultSet.getString("logradouro");
			String localidade = resultSet.getString("localidade");
			String cep = resultSet.getString("cep");
			String extensaofotouser = resultSet.getString("extensaofotouser");
			
			modelLogin = new ModelLogin(id, name, email, loginUser, senha, cargo, sexo, UF, bairro, numero, logradouro, localidade, cep);
			modelLogin.setFotoUser(fotoUser);
			modelLogin.setExtensaoFotoUser(extensaofotouser);
		}
		
		return modelLogin;
	}
	
	public void updateFoto(ModelLogin modelLogin) throws SQLException {

		if (modelLogin.getFotoUser() != null && !modelLogin.getFotoUser().isEmpty()) {
			String sql = "UPDATE model_login SET fotouser=(?), extensaofotouser=(?) WHERE login=(?)";
			PreparedStatement sttm = connection.prepareStatement(sql);

			sttm.setString(1, modelLogin.getFotoUser());
			sttm.setString(2, modelLogin.getExtensaoFotoUser());
			sttm.setString(3, modelLogin.getLogin());

			sttm.executeUpdate();
			connection.commit();
		}
	}

	public ModelLogin createUser(ModelLogin modelLogin, long userLogado) throws SQLException {

		try {
			PreparedStatement sttm = null;

			String login = modelLogin.getLogin();
			String senha = modelLogin.getSenha();
			String name = modelLogin.getName();
			String email = modelLogin.getEmail();
			String cargo = modelLogin.getCargo();
			String sexo = modelLogin.getSexo();
			String UF = modelLogin.getUF();
			String cep = modelLogin.getCep();
			String logradouro = modelLogin.getLogradouro();
			String numero = modelLogin.getNumero();
			String bairro = modelLogin.getSexo();
			String localidade = modelLogin.getLocalidade();

			if (modelLogin.newId()) {
				String sql = "INSERT INTO model_login(login, senha, name, email, user_id, cargo, sexo, UF, cep, logradouro, numero, bairro, localidade) VALUES (?, ?, ?, ?, ?, ?, ?, ? ,? ,?, ? , ?, ?);";
				sttm = connection.prepareStatement(sql);

				sttm.setString(1, login);
				sttm.setString(2, senha);
				sttm.setString(3, name);
				sttm.setString(4, email);
				sttm.setLong(5, userLogado);
				sttm.setString(6, cargo);
				sttm.setString(7, sexo);
				sttm.setString(8, UF);
				sttm.setString(9, cep);
				sttm.setString(10, logradouro);
				sttm.setString(11, numero);
				sttm.setString(12, bairro);
				sttm.setString(13, localidade);

				sttm.execute();
				connection.commit();

				this.updateFoto(modelLogin);

				return this.getUserGeneric(modelLogin.getLogin());
			}

			String sql = "UPDATE model_login SET login=(?), senha=(?), name=(?), email=(?), cargo=(?), sexo=(?), UF=(?), cep=(?), logradouro=(?), numero=(?), bairro=(?), localidade=(?) WHERE id=(?);";
			sttm = connection.prepareStatement(sql);

			sttm.setString(1, login);
			sttm.setString(2, senha);
			sttm.setString(3, name);
			sttm.setString(4, email);
			sttm.setLong(13, modelLogin.getId());
			sttm.setString(5, cargo);
			sttm.setString(6, sexo);
			sttm.setString(7, UF);
			sttm.setString(8, cep);
			sttm.setString(9, logradouro);
			sttm.setString(10, numero);
			sttm.setString(11, bairro);
			sttm.setString(12, localidade);

			sttm.executeUpdate();
			connection.commit();

			this.updateFoto(modelLogin);

			return this.getUserGeneric(modelLogin.getLogin());

		} catch (Exception e) {
			e.printStackTrace();
			connection.rollback();
			return null;
		}

	}

	public ModelLogin getUserGeneric(String login) throws Exception {

		String sql = "SELECT * FROM model_login WHERE login = (?) AND useradmin = false;";
		PreparedStatement sttm = connection.prepareStatement(sql);
		sttm.setString(1, login);
		ResultSet resultSet = sttm.executeQuery();

		return this.resultSet(resultSet);
	}

	public ModelLogin getUserLogado(String login) throws Exception {
		
		String sql = "SELECT * FROM model_login WHERE login = (?);";
		PreparedStatement sttm = connection.prepareStatement(sql);
		sttm.setString(1, login);
		ResultSet resultSet = sttm.executeQuery();

		return this.resultSet(resultSet);
	}

	public ModelLogin getUser(String login, long userLogado) throws Exception {

		String sql = "SELECT * FROM model_login WHERE login = (?) AND useradmin = false AND user_id = (?);";
		PreparedStatement sttm = connection.prepareStatement(sql);
		sttm.setString(1, login);
		sttm.setLong(2, userLogado);
		ResultSet resultSet = sttm.executeQuery();

		return this.resultSet(resultSet);
	}
	
	public int totalPaginas(long userLogado) throws Exception{
		
		String sql = "SELECT count(1) as total FROM model_login WHERE user_id =(?);";
		PreparedStatement sttm = connection.prepareStatement(sql);
		sttm.setLong(1, userLogado);
		ResultSet resultSet = sttm.executeQuery();
		
		return userService.totalPaginasPaginacao(resultSet);
		
	}
	
	public List<ModelLogin> listaUsersPaginacao(Long userLogado, Integer offset) throws Exception {
		String sql = "SELECT * FROM model_login WHERE useradmin = false AND user_id = (?) ORDER BY name LIMIT 5 OFFSET ?;";
		PreparedStatement sttm = connection.prepareStatement(sql);
		sttm.setLong(1, userLogado);
		sttm.setInt(2, offset);
		ResultSet resultSet = sttm.executeQuery();

		return this.resultSetList(resultSet);
	}

	public List<ModelLogin> listaUsers(Long userLogado) throws Exception {
		String sql = "SELECT * FROM model_login WHERE useradmin = false AND user_id =(?) ORDER BY id ASC LIMIT 5;";
		PreparedStatement sttm = connection.prepareStatement(sql);
		sttm.setLong(1, userLogado);
		ResultSet resultSet = sttm.executeQuery();

		return this.resultSetList(resultSet);
	}
	

	public ModelLogin getUserId(String id, long userLogado) throws Exception {

		String sql = "SELECT * FROM model_login WHERE id = (?) AND useradmin = false AND user_id =(?);";
		PreparedStatement sttm = connection.prepareStatement(sql);
		sttm.setLong(1, Long.parseLong(id));
		sttm.setLong(2, userLogado);
		ResultSet resultSet = sttm.executeQuery();

		return this.resultSet(resultSet);
	}

	public List<ModelLogin> getUserList(String nameUser, long userLogado) throws Exception {

		String sql = "SELECT * FROM model_login WHERE upper(name) like upper(?) AND useradmin = false AND user_id =(?) LIMIT 5";
		PreparedStatement sttm = connection.prepareStatement(sql);
		sttm.setString(1, "%" + nameUser + "%");
		sttm.setLong(2, userLogado);
		ResultSet resultSet = sttm.executeQuery();

		return this.resultSetList(resultSet);
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
