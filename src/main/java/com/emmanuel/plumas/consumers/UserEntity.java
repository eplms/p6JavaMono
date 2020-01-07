package com.emmanuel.plumas.consumers;


public class UserEntity {
	 
	private Long id;
	private String identifiant;
	private String password;
	private Boolean droitAdministrateur;
	private String adresseMail;
	public Long getId() {
		return id;
	}
	public void setId(Long id) {
		this.id = id;
	}
	public String getIdentifiant() {
		return identifiant;
	}
	public void setIdentifiant(String identifiant) {
		this.identifiant = identifiant;
	}
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}
	public Boolean getDroitAdministrateur() {
		return droitAdministrateur;
	}
	public void setDroitAdministrateur(Boolean droitAdministrateur) {
		this.droitAdministrateur = droitAdministrateur;
	}
	public String getAdresseMail() {
		return adresseMail;
	}
	public void setAdresseMail(String adresseMail) {
		this.adresseMail = adresseMail;
	}
	@Override
	public String toString() {
		return "UserEntity [id=" + id + ", identifiant=" + identifiant + ", password=" + password
				+ ", droitAdministrateur=" + droitAdministrateur + ", adresseMail=" + adresseMail + "]";
	}
	
}
