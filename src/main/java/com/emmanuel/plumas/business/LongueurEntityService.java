package com.emmanuel.plumas.business;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;

import com.emmanuel.plumas.consumers.ILongueurEntityRepository;
import com.emmanuel.plumas.models.LongueurEntity;

@Service
@Qualifier("LongueurEntityService")
public class LongueurEntityService {
	@Autowired
	@Qualifier("ILongueurEntityRepository")
	private ILongueurEntityRepository longueurRepository;

	public void creerNouvelleLongueur(LongueurEntity longueurEntity) {
		longueurRepository.save(longueurEntity);
		
	}
}
