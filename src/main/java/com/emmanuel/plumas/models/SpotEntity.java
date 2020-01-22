package com.emmanuel.plumas.models;

import java.io.Serializable;
import java.sql.Date;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;

@Entity
@Table(name="spot")
public class SpotEntity implements Serializable{

	private static final long serialVersionUID = 1L;
	
	@Id
	@GeneratedValue(strategy=GenerationType.IDENTITY)
	private Long id;
	private String nom;
	@Column(name="tagofficiel")
	private Boolean tagOfficiel;
	@Column(name="datecreation")
	private Date dateCreation;
	
	@ManyToOne(cascade=CascadeType.ALL)
	@JoinColumn(name="id_utilisateur")
	private UserEntity userEntity;
	
	//getters et setters clés étrangère
	public UserEntity getUserEntity() {
		return userEntity;
	}
	public void setUserEntity(UserEntity userEntity) {
		this.userEntity = userEntity;
	}
	
	//getters et setters clé primaire et attributs
	public Long getId() {
		return id;
	}
	public void setId(Long id) {
		this.id = id;
	}
	public String getNom() {
		return nom;
	}
	public void setNom(String nom) {
		this.nom = nom;
	}
	public Boolean getTagOfficiel() {
		return tagOfficiel;
	}
	public void setTagOfficiel(Boolean tagOfficiel) {
		this.tagOfficiel = tagOfficiel;
	}
	public Date getDateCreation() {
		return dateCreation;
	}
	public void setDateCreation(Date dateCreation) {
		this.dateCreation = dateCreation;
	}
	
	
	
	
}
