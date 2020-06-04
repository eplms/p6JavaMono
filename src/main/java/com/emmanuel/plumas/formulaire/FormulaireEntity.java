package com.emmanuel.plumas.formulaire;

import java.util.List;

public class FormulaireEntity {
	
	
	private String nom;
	private String description;
	private List<Long> id;
		
	
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
	public List<Long> getId() {
		return id;
	}
	public void setId(List<Long> id) {
		this.id = id;
	}
	
	
	
}
