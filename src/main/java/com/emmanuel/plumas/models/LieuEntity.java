package com.emmanuel.plumas.models;

import java.io.Serializable;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name="lieu")
public class LieuEntity implements Serializable{
	private static final long serialVersionUID = 1L;
	
	@Id
	@GeneratedValue(strategy=GenerationType.IDENTITY) 
	private Long id;
	
	private String ville;
	
	@Column (name="codepostal")
	private int codePostal;
	
	
	//setters et getters

	public Long getId() {
		return id;
	}

	public void setId(Long id) {
		this.id = id;
	}

	public String getVille() {
		return ville;
	}

	public void setVille(String ville) {
		this.ville = ville;
	}

	public int getCodePostal() {
		return codePostal;
	}

	public void setCodePostal(int codePostal) {
		this.codePostal = codePostal;
	}

	@Override
	public String toString() {
		return "LieuEntity [id=" + id + ", ville=" + ville + ", codePostal=" + codePostal + "]";
	}
	
	
	

}
