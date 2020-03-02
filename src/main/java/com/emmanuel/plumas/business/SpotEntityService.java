package com.emmanuel.plumas.business;

import java.util.HashSet;
import java.util.List;
import java.util.Set;

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
	
	public SpotEntity getSpot(long id) {
		return spotRepository.findById(id).get();
	}
	
	public Set<SpotEntity> getAllSpot() {
		List<SpotEntity> spotEntities =(List<SpotEntity>) spotRepository.findAll();
		Set<SpotEntity> hashSetSpotEntities =new HashSet<SpotEntity>(spotEntities);
		//return (List<SpotEntity>) spotRepository.findAll();
		return hashSetSpotEntities;		
	}
	
}
