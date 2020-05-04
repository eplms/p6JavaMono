package com.emmanuel.plumas.business;

import java.util.List;
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

	
	public List<TopoEntity> getTopoBySpotId(Long idSpot) {
		List<TopoEntity> topoEntitiesOrdonned= (List<TopoEntity>) topoRepository.findBySpotEntities_Id(idSpot);
		return topoEntitiesOrdonned;
	}
	
	public List<TopoEntity> getAllTopos(){
		List<TopoEntity> topoEntities= (List<TopoEntity>) topoRepository.findAll();
		return topoEntities;
	}
	
	public void sauvegarderTopo(TopoEntity topoEntity) {
		topoRepository.save(topoEntity);
	}

	public TopoEntity getTopoById(Long idTopo) {
		TopoEntity topoEntity=topoRepository.findById(idTopo).get();
		return topoEntity;
	}

	public TopoEntity getTopoByUserId(Long id) {
		TopoEntity topoEntity=topoRepository.findByUserEntityId(id);
		
		return topoEntity;
	}
}
