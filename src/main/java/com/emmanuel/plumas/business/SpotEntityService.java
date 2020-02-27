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
		return spotRepository.findById(id).get();
	}
	
	public List<SpotEntity> getAllSpot() {
		return (List<SpotEntity>) spotRepository.findAll();		
	}
	
}
