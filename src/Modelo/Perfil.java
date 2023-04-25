package Modelo;

public class Perfil {

	  private int idperfil;
	  private String nomperfil;
	  
	public Perfil() {

	}

	public Perfil(int idperfil, String nomperfil) {
		super();
		this.idperfil = idperfil;
		this.nomperfil = nomperfil;
	}

	public int getIdperfil() {
		return idperfil;
	}

	public void setIdperfil(int idperfil) {
		this.idperfil = idperfil;
	}

	public String getNomperfil() {
		return nomperfil;
	}

	public void setNomperfil(String nomperfil) {
		this.nomperfil = nomperfil;
	}


	  
}
