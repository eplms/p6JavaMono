package com.emmanuel.plumas.models;

import java.io.Serializable;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;

@Entity
@Table(name="longueur")
public class LongueurEntity implements Serializable{
	
	private static final long serialVersionUID = 1L;
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private long id;
	private String nom;
	private int hauteur;
	private String Cotation;
	private int nbrePoints;
	
	
	@ManyToOne
	@JoinColumn(name="id_voie")
	private VoieEntity voieEntity;
	
	//Getter et Setter clé étrangère
	public VoieEntity getVoieEntity() {
		return voieEntity;
	}
	public void setVoieEntity(VoieEntity voieEntity) {
		this.voieEntity = voieEntity;
	}
	
	
	
	//Getters et setters attributs et clé primaires
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
		return Cotation;
	}
	public void setCotation(String cotation) {
		Cotation = cotation;
	}
	public int getNbrePoints() {
		return nbrePoints;
	}
	public void setNbrePoints(int nbrePoints) {
		this.nbrePoints = nbrePoints;
	}
	
	
	
}
