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
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.OneToMany;
import javax.persistence.Table;

@Entity
@Table(name="voie")
public class VoieEntity implements Serializable{

	private static final long serialVersionUID = 1L;

	@Id
	@GeneratedValue(strategy=GenerationType.IDENTITY) 
	private long id;
	private String nom;
	private String hauteur;
	private String cotation;
	@Column(name="nbrepoints")
	private String nbrePoints;
	
	@ManyToOne(cascade=CascadeType.ALL)
	@JoinColumn(name="id_secteur")
	private SecteurEntity secteurEntity;
		
	@OneToMany(mappedBy="voieEntity",fetch=FetchType.EAGER, cascade=CascadeType.ALL )
	private List<LongueurEntity> longueurEntities;
	
	// Setters et getters clés étrangères
	public SecteurEntity getSecteurEntity() {
		return secteurEntity;
	}
	public void setSecteurEntity(SecteurEntity secteurEntity) {
		this.secteurEntity = secteurEntity;
	}
	public List<LongueurEntity> getLongueurEntities() {
		return longueurEntities;
	}
	public void setLongueurEntities(List<LongueurEntity> longueurEntities) {
		this.longueurEntities = longueurEntities;
	}
	
	// Setters et Getters Attributs et clé primaire
	public long getId() {
		return id;
	}
	public void setId(long id) {
		this.id = id;
	}
	public String getNom() {
		return nom;
	}
	public void setNom(String nom) {
		this.nom = nom;
	}
	public String getHauteur() {
		return hauteur;
	}
	public void setHauteur(String hauteur) {
		this.hauteur = hauteur;
	}
	public String getCotation() {
		return cotation;
	}
	public void setCotation(String cotation) {
		this.cotation = cotation;
	}
	public String getNbrePoints() {
		return nbrePoints;
	}
	public void setNbrePoints(String nbrePoints) {
		this.nbrePoints = nbrePoints;
	}
	
	
	
	
	
}
