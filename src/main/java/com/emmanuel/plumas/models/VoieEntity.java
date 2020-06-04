package com.emmanuel.plumas.models;

import java.io.Serializable;
import java.util.Set;

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
	private int hauteur;
	private String cotation;
	@Column(name="nbrepoints")
	private int nbrePoints;
	
	
	@ManyToOne
	@JoinColumn(name="id_secteur")
	private SecteurEntity secteurEntity;
	
		
	@OneToMany(fetch=FetchType.EAGER, cascade=CascadeType.ALL )
	@JoinColumn(name="id_voie")
	private Set<LongueurEntity> longueurEntities;
	
	//Setters et getters clés étrangères
  	public SecteurEntity getSecteurEntity() {
		return secteurEntity;
	}
	public void setSecteurEntity(SecteurEntity secteurEntity) {
		this.secteurEntity = secteurEntity;
	} 
	public Set<LongueurEntity> getLongueurEntities() {
		return longueurEntities;
	}
	public void setLongueurEntities(Set<LongueurEntity> longueurEntities) {
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
	public int getHauteur() {
		return hauteur;
	}
	public void setHauteur(int hauteur) {
		this.hauteur = hauteur;
	}
	public String getCotation() {
		return cotation;
	}
	public void setCotation(String cotation) {
		this.cotation = cotation;
	}
	public int getNbrePoints() {
		return nbrePoints;
	}
	public void setNbrePoints(int nbrePoints) {
		this.nbrePoints = nbrePoints;
	}
	
	
	
	
	
}
