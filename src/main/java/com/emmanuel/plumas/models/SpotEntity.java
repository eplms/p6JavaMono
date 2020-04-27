package com.emmanuel.plumas.models;

import java.io.Serializable;
import java.lang.Comparable;
import java.util.Date;
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
@Table(name="spot")
public class SpotEntity implements Serializable,Comparable<SpotEntity>{

	private static final long serialVersionUID = 1L;
	
	@Id
	@GeneratedValue(strategy=GenerationType.IDENTITY)
	private Long id;
	private String nom;
	@Column(name="tagofficiel")
	private Boolean tagOfficiel;
	@Column(name="datecreation")
	private Date dateCreation;
	
	@ManyToOne
	@JoinColumn(name="id_utilisateur")
	private UserEntity userEntity;
	@ManyToOne
	@JoinColumn(name="id_lieu")
	private LieuEntity lieuEntity;
	
	@OneToMany(fetch=FetchType.EAGER, cascade=CascadeType.ALL)
	@JoinColumn(name="id_spot")
	private Set<SecteurEntity> secteurEntities; 
	
	@OneToMany(fetch=FetchType.EAGER)
	@JoinColumn(name="id_spot")
	private Set<CommentaireEntity> commentaireEntities; 
	 
	//getters et setters clés étrangère
	public UserEntity getUserEntity() {
		return userEntity;
	}
	public void setUserEntity(UserEntity userEntity) {
		this.userEntity = userEntity;
	}
	public LieuEntity getLieuEntity() {
		return lieuEntity;
	}
	public void setLieuEntity(LieuEntity lieuEntity) {
		this.lieuEntity = lieuEntity;
	}
	public Set<SecteurEntity> getSecteurEntities() {
		return secteurEntities;
	}
	public void setSecteurEntities(Set<SecteurEntity> secteurEntities) {
		this.secteurEntities = secteurEntities;
	}
	public Set<CommentaireEntity> getCommentaireEntities() {
		return commentaireEntities;
	}
	public void setCommentaireEntities(Set<CommentaireEntity> commentaireEntities) {
		this.commentaireEntities = commentaireEntities;
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
	@Override
	public int compareTo(SpotEntity o) {
		// TODO Auto-generated method stub
		return this.getId().compareTo(o.getId());
	}
}
