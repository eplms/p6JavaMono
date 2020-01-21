package com.emmanuel.plumas.business;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;

import com.emmanuel.plumas.consumers.ILieuEntityRepository;
import com.emmanuel.plumas.models.LieuEntity;
import com.emmanuel.plumas.models.UserEntity;

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
	
	public List<LieuEntity> getAllLieu() {
		List<LieuEntity> u = (List<LieuEntity>) lieuRepository.findAll();
		return u;
			
	}
	
}
