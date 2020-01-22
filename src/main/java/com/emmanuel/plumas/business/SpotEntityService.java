package com.emmanuel.plumas.business;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;

import com.emmanuel.plumas.consumers.ISpotEntityRepository;
import com.emmanuel.plumas.models.SpotEntity;

@Service
@Qualifier("SpotEntityService")
public class SpotEntityService {

	@Autowired
	@Qualifier("ISpotEntityRepository")
	private ISpotEntityRepository spotRepository;
	
	public SpotEntity getSpot(Long id) {
		SpotEntity s= spotRepository.findById(id).get();
		return s;
		
	}
	
	public List<SpotEntity> getAllSpot() {
		List<SpotEntity> s = (List<SpotEntity>) spotRepository.findAll();
		return s;
			
	}
	
}
