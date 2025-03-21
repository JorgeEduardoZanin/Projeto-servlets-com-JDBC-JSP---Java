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

public class daoUserRepository {

	private Connection connection;

	public daoUserRepository() {
		connection = SingleConnection.getConnection();
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

			if (modelLogin.newId()) {
				String sql = "INSERT INTO model_login(login, senha, name, email, user_id, cargo, sexo) VALUES (?, ?, ?, ?, ?, ?, ?);";
				sttm = connection.prepareStatement(sql);

				sttm.setString(1, login);
				sttm.setString(2, senha);
				sttm.setString(3, name);
				sttm.setString(4, email);
				sttm.setLong(5, userLogado);
				sttm.setString(6, cargo);
				sttm.setString(7, sexo);

				sttm.execute();
				connection.commit();

				this.updateFoto(modelLogin);

				return this.getUserGeneric(modelLogin.getLogin());
			}

			String sql = "UPDATE model_login SET login=(?), senha=(?), name=(?), email=(?), cargo=(?), sexo=(?) WHERE id=(?);";
			sttm = connection.prepareStatement(sql);

			sttm.setString(1, login);
			sttm.setString(2, senha);
			sttm.setString(3, name);
			sttm.setString(4, email);
			sttm.setLong(7, modelLogin.getId());
			sttm.setString(5, cargo);
			sttm.setString(6, sexo);

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
		ModelLogin modelLogin = new ModelLogin();

		String sql = "SELECT * FROM model_login WHERE login = (?) AND useradmin = false;";
		PreparedStatement sttm = connection.prepareStatement(sql);
		sttm.setString(1, login);
		ResultSet resultSet = sttm.executeQuery();

		while (resultSet.next()) {
			String name = resultSet.getString("name");
			String loginUser = resultSet.getString("login");
			long id = resultSet.getLong("id");
			String email = resultSet.getString("email");
			String senha = resultSet.getString("senha");
			String cargo = resultSet.getString("cargo");
			String sexo = resultSet.getString("sexo");
			String fotoUser = resultSet.getString("fotouser");
			modelLogin.setFotoUser(fotoUser);

			modelLogin = new ModelLogin(id, name, email, loginUser, senha, cargo, sexo);
		}

		return modelLogin;
	}

	public ModelLogin getUserLogado(String login) throws Exception {
		ModelLogin modelLogin = new ModelLogin();

		String sql = "SELECT * FROM model_login WHERE login = (?);";
		PreparedStatement sttm = connection.prepareStatement(sql);
		sttm.setString(1, login);
		ResultSet resultSet = sttm.executeQuery();

		while (resultSet.next()) {
			String name = resultSet.getString("name");
			String loginUser = resultSet.getString("login");
			long id = resultSet.getLong("id");
			String email = resultSet.getString("email");
			String senha = resultSet.getString("senha");
			boolean userAdmin = resultSet.getBoolean("useradmin");
			String cargo = resultSet.getString("cargo");
			String sexo = resultSet.getString("sexo");
			String fotoUser = resultSet.getString("fotouser");

			modelLogin.setFotoUser(fotoUser);
			modelLogin.setId(id);
			modelLogin.setLogin(loginUser);
			modelLogin.setEmail(email);
			modelLogin.setName(name);
			modelLogin.setSenha(senha);
			modelLogin.setUserAdmin(userAdmin);
			modelLogin.setCargo(cargo);
			modelLogin.setSexo(sexo);
		}

		return modelLogin;
	}

	public ModelLogin getUser(String login, long userLogado) throws Exception {
		ModelLogin modelLogin = new ModelLogin();

		String sql = "SELECT login, senha, id, name, email FROM model_login WHERE login = (?) AND useradmin = false AND user_id = (?);";
		PreparedStatement sttm = connection.prepareStatement(sql);
		sttm.setString(1, login);
		sttm.setLong(2, userLogado);
		ResultSet resultSet = sttm.executeQuery();

		while (resultSet.next()) {
			String name = resultSet.getString("name");
			String loginUser = resultSet.getString("login");
			long id = resultSet.getLong("id");
			String email = resultSet.getString("email");
			String senha = resultSet.getString("senha");
			String cargo = resultSet.getString("cargo");
			String sexo = resultSet.getString("sexo");
			String fotoUser = resultSet.getString("fotouser");

			modelLogin.setFotoUser(fotoUser);

			modelLogin = new ModelLogin(id, name, email, loginUser, senha, cargo, sexo);
		}

		return modelLogin;
	}

	public List<ModelLogin> listaUsers(Long userLogado) throws Exception {
		ModelLogin modelLogin = new ModelLogin();
		List<ModelLogin> users = new ArrayList<>();
		String sql = "SELECT * FROM model_login WHERE useradmin = false AND user_id =(?) ORDER BY id ASC;";
		PreparedStatement sttm = connection.prepareStatement(sql);
		sttm.setLong(1, userLogado);
		ResultSet resultSet = sttm.executeQuery();

		while (resultSet.next()) {
			String name = resultSet.getString("name");
			String loginUser = resultSet.getString("login");
			long id = resultSet.getLong("id");
			String email = resultSet.getString("email");
			String senha = resultSet.getString("senha");
			String cargo = resultSet.getString("cargo");
			String sexo = resultSet.getString("sexo");

			modelLogin = new ModelLogin(id, name, email, loginUser, senha, cargo, sexo);
			users.add(modelLogin);
		}

		return users;
	}

	public ModelLogin getUserId(String id, long userLogado) throws Exception {
		ModelLogin modelLogin = new ModelLogin();

		String sql = "SELECT * FROM model_login WHERE id = (?) AND useradmin = false AND user_id =(?);";
		PreparedStatement sttm = connection.prepareStatement(sql);
		sttm.setLong(1, Long.parseLong(id));
		sttm.setLong(2, userLogado);
		ResultSet resultSet = sttm.executeQuery();

		while (resultSet.next()) {
			String name = resultSet.getString("name");
			String loginUser = resultSet.getString("login");
			long idUser = resultSet.getLong("id");
			String email = resultSet.getString("email");
			String senha = resultSet.getString("senha");
			String cargo = resultSet.getString("cargo");
			String sexo = resultSet.getString("sexo");
			String fotoUser = resultSet.getString("fotouser");

		
			modelLogin = new ModelLogin(idUser, name, email, loginUser, senha, cargo, sexo);
			modelLogin.setFotoUser(fotoUser);
		}

		return modelLogin;
	}

	public List<ModelLogin> getUserList(String nameUser, long userLogado) throws Exception {

		List<ModelLogin> listaUser = new ArrayList<ModelLogin>();
		ModelLogin modelLogin = new ModelLogin();

		String sql = "SELECT * FROM model_login WHERE upper(name) like upper(?) AND useradmin = false AND user_id =(?)";
		PreparedStatement sttm = connection.prepareStatement(sql);
		sttm.setString(1, "%" + nameUser + "%");
		sttm.setLong(2, userLogado);
		ResultSet resultSet = sttm.executeQuery();

		while (resultSet.next()) {
			String name = resultSet.getString("name");
			String loginUser = resultSet.getString("login");
			long id = resultSet.getLong("id");
			String email = resultSet.getString("email");
			String senha = resultSet.getString("senha");
			String cargo = resultSet.getString("cargo");
			String sexo = resultSet.getString("sexo");

			modelLogin = new ModelLogin(id, name, email, loginUser, senha, cargo, sexo);
			listaUser.add(modelLogin);
		}

		return listaUser;
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
