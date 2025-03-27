package entities;

import java.io.Serializable;
import java.util.Objects;

public class ModelTelefone implements Serializable{

	private static final long serialVersionUID = 1L;
	
	private Long id;
	private String numero;
	
	private ModelLogin usuario_pai_id;
	private ModelLogin usuario_cad_id;
	
	public ModelTelefone(){
	}
	
	public ModelTelefone( String numero, ModelLogin usuario_pai_id, ModelLogin usuario_cad_id) {
		this.numero = numero;
		this.usuario_pai_id = usuario_pai_id;
		this.usuario_cad_id = usuario_cad_id;
	}
	
	public long getId() {
		return id;
	}
	public void setId(long id) {
		this.id = id;
	}
	public String getNumero() {
		return numero;
	}
	public void setNumero(String numero) {
		this.numero = numero;
	}
	public ModelLogin getUsuario_pai_id() {
		return usuario_pai_id;
	}
	public void setUsuario_pai_id(ModelLogin usuario_pai_id) {
		this.usuario_pai_id = usuario_pai_id;
	}
	public ModelLogin getUsuario_cad_id() {
		return usuario_cad_id;
	}
	public void setUsuario_cad_id(ModelLogin usuario_cad_id) {
		this.usuario_cad_id = usuario_cad_id;
	}

	@Override
	public int hashCode() {
		return Objects.hash(id);
	}

	@Override
	public boolean equals(Object obj) {
		if (this == obj)
			return true;
		if (obj == null)
			return false;
		if (getClass() != obj.getClass())
			return false;
		ModelTelefone other = (ModelTelefone) obj;
		return id == other.id;
	}
	
	public boolean newId() {
		if (this.id != null && this.id > 0) {
			return false;
		}
		return true;
	}
	
	
	

}
