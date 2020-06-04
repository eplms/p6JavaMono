package com.emmanuel.plumas.business;

import java.util.ArrayList;
import java.util.List;
import java.util.TreeSet;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;

import com.emmanuel.plumas.consumers.ISpotEntityRepository;
import com.emmanuel.plumas.models.LieuEntity;
import com.emmanuel.plumas.models.SpotEntity;

@Service
@Qualifier("SpotEntityService")
public class SpotEntityService {

	@Autowired
	@Qualifier("ISpotEntityRepository")
	private ISpotEntityRepository spotRepository;
	
	@Autowired
	@Qualifier("LieuEntityService")
	private LieuEntityService lieuService;
	
	public SpotEntity getSpot(long id) {
		return spotRepository.findById(id).get();
	}
	
	public TreeSet<SpotEntity> getAllSpot() {
		List<SpotEntity> spotEntities =(List<SpotEntity>) spotRepository.findAll();
		TreeSet<SpotEntity> spotEntitiesOrdonned = new TreeSet<SpotEntity>(spotEntities);
		return spotEntitiesOrdonned;		
	}

	public void creerNouveauSpot(SpotEntity spotEntity) {
		spotRepository.save(spotEntity);
	}
	
	public SpotEntity upDateSpot(SpotEntity spotEntity) {
		SpotEntity spot=getSpot(spotEntity.getId());
		spot.setTagOfficiel(spotEntity.getTagOfficiel());
		spotRepository.save(spot);
		return spot;
	}
	/*
	public TreeSet<SpotEntity> getSpotsById(List<Long> id) {
		List<SpotEntity> spotEntities =(List<SpotEntity>) spotRepository.findAllById(id);
		TreeSet<SpotEntity> spotEntitiesOrdonned = new TreeSet<SpotEntity>(spotEntities);
		return spotEntitiesOrdonned;
	}
	*/
	
	public TreeSet<SpotEntity> getSpotsById(List<Long> id) {
		List<SpotEntity> allSpotEntities =(List<SpotEntity>) spotRepository.findAll();
		List<SpotEntity> spotEntities = new ArrayList<SpotEntity>();
		for(int i=0;i<allSpotEntities.size();i++) {
			for(int j=0;j<id.size();j++) {
				if(allSpotEntities.get(i).getId()==id.get(j)) {
					spotEntities.add(allSpotEntities.get(i));
				}
			}
		}
		TreeSet<SpotEntity> spotEntitiesOrdonned = new TreeSet<SpotEntity>(spotEntities);
		return spotEntitiesOrdonned;
	}
	
	public ArrayList<String> getAllNom(){
		List<SpotEntity> spotEntities =(List<SpotEntity>) spotRepository.findAll();
		ArrayList<String> nomSpots= new ArrayList<String> ();
		for(int i=0;i<spotEntities.size();i++) {
			nomSpots.add(spotEntities.get(i).getNom());
		}
		return nomSpots;
	}

	public List<SpotEntity> getSpotByNameOrVille(String nom, String ville) {
		LieuEntity lieuEntity=lieuService.getLieuByVille(ville);
		List<SpotEntity> spotEntities=spotRepository.findByNomOrLieuEntity(nom,lieuEntity);
		return spotEntities;
	}
}
