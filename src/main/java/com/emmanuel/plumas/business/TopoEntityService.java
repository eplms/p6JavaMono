package com.emmanuel.plumas.business;

import java.util.TreeSet;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;

import com.emmanuel.plumas.consumers.ITopoEntityRepository;
import com.emmanuel.plumas.models.TopoEntity;

@Service
@Qualifier("TopoEntityService")
public class TopoEntityService {
	
	@Autowired
	@Qualifier ("ITopoEntityRepository")
	private ITopoEntityRepository topoRepository;

	
	public TreeSet<TopoEntity> getTopoBySpotId(Long idSpot) {
		TreeSet<TopoEntity> topoEntitiesOrdonned= (TreeSet<TopoEntity>) topoRepository.findBySpotEntities_Id(idSpot);
		return topoEntitiesOrdonned;
	}
	
}
