package com.emmanuel.plumas.models;

import java.io.Serializable;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;

@Entity
@Table(name="reservation")
public class ReservationEntity implements Serializable {
	
	private static final long serialVersionUID = 1L;
	@Id
	@GeneratedValue(strategy=GenerationType.IDENTITY) 
	private long Id;
	
	/* Clés Etrangères*/
	@ManyToOne
	@JoinColumn(name="id_topo")
	private TopoEntity topoEntity;
	
	@ManyToOne
	@JoinColumn(name="id_utilisateur")
	private UserEntity userEntity;
	
	/* Attribut hors clés étrangères*/
	@Column(name="statutreservation")
	private String statutReservation;

	public long getId() {
		return Id;
	}

	public void setId(long id) {
		Id = id;
	}

	public TopoEntity getTopoEntity() {
		return topoEntity;
	}

	public void setTopoEntity(TopoEntity topoEntity) {
		this.topoEntity = topoEntity;
	}

	public UserEntity getUserEntity() {
		return userEntity;
	}

	public void setUserEntity(UserEntity userEntity) {
		this.userEntity = userEntity;
	}

	public String getStatutReservation() {
		return statutReservation;
	}

	public void setStatutReservation(String statutReservation) {
		this.statutReservation = statutReservation;
	}

}
