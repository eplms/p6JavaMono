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

	public Boolean verifierUserEnregistre(UserEntity userEntity) {
		boolean utilisateurExistantBase =false;
		UserEntity utilisateurBase=userRepository.findByIdentifiantAndPassword(userEntity.getIdentifiant(), userEntity.getPassword());
		if(utilisateurBase!=null) {
			utilisateurExistantBase =true;
		}
		return utilisateurExistantBase;	
	}
	
	public Boolean verifierCreationUser(UserEntity userEntity) {
		boolean creationUtilisateurPossible=true;
		UserEntity utilisateurBaseExistant=userRepository.findByIdentifiantOrAdresseMail(userEntity.getIdentifiant(), userEntity.getAdresseMail());
		if(utilisateurBaseExistant!=null) {
			creationUtilisateurPossible=false;
		}
		return creationUtilisateurPossible;
	}
	public void creerNouvelUser(UserEntity userEntity) {
		userEntity.setDroitAdministrateur(false);
		userRepository.save(userEntity);
	}
	
	public UserEntity getUserByIdentifiantAndPassword(UserEntity userEntity) {
		UserEntity utilisateurBase=userRepository.findByIdentifiantAndPassword(userEntity.getIdentifiant(), userEntity.getPassword());
		return utilisateurBase;
	}
	
	public UserEntity getUserByIdentifiant(String identifiant) {
		UserEntity utilisateurBase=userRepository.findByIdentifiant(identifiant);
		return utilisateurBase;
	}

	public boolean verifierDroitAdministrateurUserEnregistre(UserEntity userConnecte) {
		Boolean droitAdministrateur=false;
		UserEntity utilisateurBase=userRepository.findByIdentifiantAndPassword(userConnecte.getIdentifiant(), userConnecte.getPassword());
		if (utilisateurBase.getDroitAdministrateur()) {
			droitAdministrateur=true;
		}
		return droitAdministrateur;
	}
	
	

}