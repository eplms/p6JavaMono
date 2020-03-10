package com.emmanuel.plumas.business;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;

import com.emmanuel.plumas.consumers.ILieuEntityRepository;
import com.emmanuel.plumas.models.LieuEntity;
import com.emmanuel.plumas.models.SpotEntity;

@Service
@Qualifier("LieuEntityService")
public class LieuEntityService {
	
	@Autowired
	@Qualifier("ILieuEntityRepository")
	private ILieuEntityRepository lieuRepository;
	
	public LieuEntity getLieu(Long id) {
		LieuEntity lieuEntity= lieuRepository.findById(id).get();
		return lieuEntity;
		
	}
	
	public List<LieuEntity> getAllLieu() {
		List<LieuEntity> listeLieu = (List<LieuEntity>) lieuRepository.findAll();
		return listeLieu;
			
	}

	public boolean verifierLieuExistant(SpotEntity spotEntity) {
		boolean lieuExistant=false;
		LieuEntity lieuBase = lieuRepository.findByVille(spotEntity.getLieuEntity().getVille());
		if(lieuBase!=null) {
			lieuExistant=true;
			}	
		return lieuExistant;
	}

	public void creerNouveauLieu(LieuEntity lieuEntity) {
		lieuRepository.save(lieuEntity);		
	}

	public LieuEntity recupererLieuBase(SpotEntity spotEntity) {
		LieuEntity lieuBase=lieuRepository.findByVille(spotEntity.getLieuEntity().getVille());
		return lieuBase;
	}
	
}
