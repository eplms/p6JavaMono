package com.emmanuel.plumas.models;

import java.io.Serializable;
import java.lang.Comparable;
import java.util.Date;
import java.util.Set;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.JoinTable;
import javax.persistence.ManyToMany;
import javax.persistence.ManyToOne;
import javax.persistence.Table;

@Entity
@Table(name="topo")
public class TopoEntity implements Serializable,Comparable<TopoEntity>{
	
	private static final long serialVersionUID = 1L;
	
	@Id
	@GeneratedValue(strategy=GenerationType.IDENTITY)
	private Long id;
	private String nom;
	private String description;
	@Column(name="dateparution")
	private Date dateParution;
	@Column(name="disponibilite")
	private Boolean disponible;
	
	@ManyToOne
	@JoinColumn(name="id_utilisateur")
	private UserEntity userEntity;
	
	
	@ManyToMany(fetch = FetchType.EAGER)
	@JoinTable(name="spot_topo",joinColumns=@JoinColumn(name="id_topo"),inverseJoinColumns=@JoinColumn(name="id_spot"))
	private Set<SpotEntity> spotEntities;
	
	
	/* Getters et Setters attributs et clé primaire*/
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
	public String getDescription() {
		return description;
	}
	public void setDescription(String description) {
		this.description = description;
	}
	public Date getDateParution() {
		return dateParution;
	}
	public void setDateParution(Date dateParution) {
		this.dateParution = dateParution;
	}
	public Boolean getDisponible() {
		return disponible;
	}
	public void setDisponible(Boolean disponible) {
		this.disponible = disponible;
	}
	
	/* Getter et setter clé étrangère*/
	
	public Set<SpotEntity> getSpotEntities() {
		return spotEntities;
	}
	public void setSpotEntities(Set<SpotEntity> spotEntities) {
		this.spotEntities = spotEntities;
	}
	
	@Override
	public int compareTo(TopoEntity o) {
		return 0;
	}
	public UserEntity getUserEntity() {
		return userEntity;
	}
	public void setUserEntity(UserEntity userEntity) {
		this.userEntity = userEntity;
	}
	
	
}
