package com.emmanuel.plumas.models;

import java.io.Serializable;
import java.util.Set;
import javax.persistence.CascadeType;
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
@Table(name="secteur")
public class SecteurEntity implements Serializable{

	private static final long serialVersionUID = 1L;
	
	@Id
	@GeneratedValue(strategy=GenerationType.IDENTITY)
	private long id;
	private String nom;
	private String description;
	
	
	@ManyToOne
	@JoinColumn(name="id_spot")
	private SpotEntity spotEntity;
	
	
	@OneToMany(fetch=FetchType.EAGER, cascade=CascadeType.ALL)
	@JoinColumn(name="id_secteur")
	private Set<VoieEntity> voieEntities;
	
	
	// Getter et setter clé étrangère
	
	public SpotEntity getSpotEntity() {
		return spotEntity;
	}
	public void setSpotEntity(SpotEntity spotEntity) {
		this.spotEntity = spotEntity;
	}
	
	public Set<VoieEntity> getVoieEntities() {
		return voieEntities;
	}
	public void setVoieEntities(Set<VoieEntity> voieEntities) {
		this.voieEntities = voieEntities;
	}
	
	
	//getters et setters attributs
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
	public String getDescription() {
		return description;
	}
	public void setDescription(String description) {
		this.description = description;
	}
	
	
	
	
	
	
}
	