package com.emmanuel.plumas.business;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;

import com.emmanuel.plumas.consumers.IUserEntityRepository;
import com.emmanuel.plumas.models.UserEntity;

@Service
@Qualifier("UserEntityService")
public class UserEntityService {
	
	@Autowired
	@Qualifier("IUserEntityRepository")
	private IUserEntityRepository userRepository;
	
	public UserEntity getUser(Long id) {
		UserEntity u= userRepository.findById(id).get();
		return u;
	}
	
}