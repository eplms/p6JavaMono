package com.emmanuel.plumas.models;

import java.io.Serializable;
import java.util.List;
import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.OneToMany;
import javax.persistence.Table;

//Ne pas faire d'import org.hibernate

//la classe UserEntity est mappée avec la table utilisateur
@Entity
@Table(name = "utilisateur")	
public class UserEntity implements Serializable {
	
	private static final long serialVersionUID = 1L;
	@Id
	@GeneratedValue(strategy=GenerationType.IDENTITY) 
	private Long id;
	private String identifiant;
	private String password;
	@Column (name="droitadministrateur")
	private Boolean droitAdministrateur;
	private String adresseMail;
	
	@OneToMany(mappedBy="userEntity", fetch=FetchType.EAGER, cascade=CascadeType.ALL)
	private List<SpotEntity> spotEntities;
	
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
	public List<SpotEntity> getSpotEntities() {
		return spotEntities;
	}
	public void setSpotEntities(List<SpotEntity> spotEntities) {
		this.spotEntities = spotEntities;
	}
	
	
}
