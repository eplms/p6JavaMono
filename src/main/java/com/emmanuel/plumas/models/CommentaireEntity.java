package com.emmanuel.plumas.models;

import java.io.Serializable;
import java.time.LocalTime;
import java.util.Date;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;

@Entity
@Table(name="commentaire")
public class CommentaireEntity implements Serializable{

	private static final long serialVersionUID = 1L;
	
	@Id
	@GeneratedValue(strategy=GenerationType.IDENTITY)
	private Long id;
	@Column(name="date")
	private Date dateCommentaire;
	private String contenu;
	@Column(name="heure")
	private LocalTime heureCommentaire;
	
	@ManyToOne
	@JoinColumn(name="id_spot")
	private SpotEntity spotEntity;
	
	@ManyToOne
	@JoinColumn(name="id_utilisateur")
	private UserEntity userEntity;
	
	//Getter et Setter des attributs
	public Long getId() {
		return id;
	}
	public void setId(Long id) {
		this.id = id;
	}
	public Date getDateCommentaire() {
		return dateCommentaire;
	}
	public void setDateCommentaire(Date dateCommentaire) {
		this.dateCommentaire = dateCommentaire;
	}
	public LocalTime getHeureCommentaire() {
		return heureCommentaire;
	}
	public void setHeureCommentaire(LocalTime heureCommentaire) {
		this.heureCommentaire = heureCommentaire;
	}
	public String getContenu() {
		return contenu;
	}
	public void setContenu(String contenu) {
		this.contenu = contenu;
	}
	
	// Getters et Setters clés étrangères
	public SpotEntity getSpotEntity() {
		return spotEntity;
	}
	public void setSpotEntity(SpotEntity spotEntity) {
		this.spotEntity = spotEntity;
	}
	public UserEntity getUserEntity() {
		return userEntity;
	}
	public void setUserEntity(UserEntity userEntity) {
		this.userEntity = userEntity;
	}
		
}
