package com.emmanuel.plumas.business;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;

import com.emmanuel.plumas.consumers.IVoieEntityRepository;
import com.emmanuel.plumas.models.VoieEntity;

@Service
@Qualifier("VoieEntityService")
public class VoieEntityService {
	
	@Autowired
	@Qualifier("IVoieEntityRepository")
	private IVoieEntityRepository voieRepository;
	
	public VoieEntity getVoie(Long id) {
		return voieRepository.findById(id).get();
	}

	public void creerNouvelVoie(VoieEntity voieEntity) {
		voieRepository.save(voieEntity);
	}
}
