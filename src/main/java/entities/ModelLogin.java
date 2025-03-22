package entities;

import java.io.Serializable;

public class ModelLogin implements Serializable {

	private static final long serialVersionUID = 1L;

	private Long id;

	private String name;
	private String email;
	private String login;
	private String senha;
	private String cargo;
	private String sexo;
	private String cep;
	private String bairro;
	private String logradouro;
	private String localidade;
	private String UF;
	private String numero;

	private String fotoUser;
	private String extensaoFotoUser;

	private boolean userAdmin;

	public ModelLogin() {

	}

	public ModelLogin(Long id, String name, String email, String login, String senha, String cargo, String sexo,
			String cep, String bairro, String logradouro, String localidade, String UF, String numero) {
		
		this.id = id;
		this.name = name;
		this.email = email;
		this.login = login;
		this.senha = senha;
		this.cargo = cargo;
		this.sexo = sexo;
		this.cep = cep;
		this.bairro = bairro;
		this.logradouro = logradouro;
		this.localidade = localidade;
		this.UF = UF;
		this.numero = numero;
	}

	public Long getId() {
		return id;
	}

	public void setId(Long id) {
		this.id = id;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getLogin() {
		return login;
	}

	public void setLogin(String login) {
		this.login = login;
	}

	public String getSenha() {
		return senha;
	}

	public void setSenha(String senha) {
		this.senha = senha;
	}

	public boolean getUserAdmin() {
		return userAdmin;
	}

	public void setUserAdmin(boolean userAdmin) {
		this.userAdmin = userAdmin;
	}

	public String getCargo() {
		return cargo;
	}

	public void setCargo(String cargo) {
		this.cargo = cargo;
	}

	public String getSexo() {
		return sexo;
	}

	public void setSexo(String sexo) {
		this.sexo = sexo;
	}

	public String getFotoUser() {
		return fotoUser;
	}

	public void setFotoUser(String fotoUser) {
		this.fotoUser = fotoUser;
	}

	public String getExtensaoFotoUser() {
		return extensaoFotoUser;
	}

	public void setExtensaoFotoUser(String extensaoFotoUser) {
		this.extensaoFotoUser = extensaoFotoUser;
	}

	public String getCep() {
		return cep;
	}

	public void setCep(String cep) {
		this.cep = cep;
	}

	public String getBairro() {
		return bairro;
	}

	public void setBairro(String bairro) {
		this.bairro = bairro;
	}

	public String getLogradouro() {
		return logradouro;
	}

	public void setLogradouro(String logradouro) {
		this.logradouro = logradouro;
	}

	public String getLocalidade() {
		return localidade;
	}

	public void setLocalidade(String localidade) {
		this.localidade = localidade;
	}

	public String getUF() {
		return UF;
	}

	public void setUF(String uF) {
		UF = uF;
	}

	public String getNumero() {
		return numero;
	}

	public void setNumero(String numero) {
		this.numero = numero;
	}

	@Override
	public String toString() {
		return "ModelLogin [id=" + id + ", name=" + name + ", email=" + email + ", login=" + login + ", senha=" + senha
				+ "]";
	}

	public boolean newId() {
		if (this.id != null && this.id > 0) {
			return false;
		}
		return true;
	}

}
