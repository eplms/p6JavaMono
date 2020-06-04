package com.emmanuel.plumas.business;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;

import com.emmanuel.plumas.consumers.ISecteurEntityRepository;
import com.emmanuel.plumas.models.SecteurEntity;


@Service
@Qualifier("SecteurEntityService")
public class SecteurEntityService {
	
	@Autowired
	@Qualifier("ISecteurEntityRepository")
	private ISecteurEntityRepository secteurRepository;
	
	public SecteurEntity getSecteur(long id) {
		return secteurRepository.findById(id).get();
	}

	public void creerNouveauSecteur(SecteurEntity secteurEntity) {
		secteurRepository.save(secteurEntity);
	}
	
}
