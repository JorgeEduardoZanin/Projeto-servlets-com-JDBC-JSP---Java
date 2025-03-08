package entities;

import java.io.Serializable;

public class ModelLogin implements Serializable {

	private static final long serialVersionUID = 1L;
	
	private Long id;
	private String name;
	private String email;
	private String login;
	private String senha;
	
	public ModelLogin () {
		
	}
	
	public ModelLogin(Long id, String name, String email, String login, String senha) {
		this.id = id;
		this.name = name;
		this.email = email;
		this.login = login;
		this.senha = senha;
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

	@Override
	public String toString() {
		return "ModelLogin [id=" + id + ", name=" + name + ", email=" + email + ", login=" + login + ", senha=" + senha
				+ "]";
	}
	
	public boolean newId() {
		if(this.id !=null && this.id > 0) {
			return false;
		}
		return true;
	}
	
	
	
}
