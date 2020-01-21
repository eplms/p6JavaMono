package com.emmanuel.plumas.business;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;

import com.emmanuel.plumas.consumers.ILieuEntityRepository;
import com.emmanuel.plumas.models.LieuEntity;

@Service
@Qualifier("LieuEntityService")
public class LieuEntityService {
	
	@Autowired
	@Qualifier("ILieuEntityRepository")
	private ILieuEntityRepository lieuRepository;
	
	public LieuEntity getLieu(Long id) {
		LieuEntity l= lieuRepository.findById(id).get();
		return l;
		
	}
	
}
