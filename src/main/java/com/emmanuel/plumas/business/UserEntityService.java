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
		UserEntity userEntity= userRepository.findById(id).get();
		return userEntity;
	}

/* Première version de la vérification de la vérification d'user
	public Boolean verifierUserEnregistre(UserEntity utilisateurConnecte) {
		boolean utilisateurExistantBase =false;
		List<UserEntity> allUser=(List<UserEntity>) userRepository.findAll();
		for(UserEntity userEntity:allUser){
			if((userEntity.getIdentifiant().contentEquals(utilisateurConnecte.getIdentifiant())&&
					(userEntity.getPassword().contentEquals(utilisateurConnecte.getPassword())))){
						utilisateurExistantBase=true;
						return utilisateurExistantBase;
			}else {
				utilisateurExistantBase=false;
			}
		}
		return utilisateurExistantBase;
	}
	
*/
	public Boolean verifierUserEnregistre(UserEntity userEntity) {
		boolean utilisateurExistantBase =false;
		UserEntity utilisateurBase=userRepository.findByIdentifiantAndPassword(userEntity.getIdentifiant(), userEntity.getPassword());
		if(utilisateurBase!=null) {
			utilisateurExistantBase =true;
		}
		return utilisateurExistantBase;	
	}
}