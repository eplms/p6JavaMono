package com.emmanuel.plumas.business;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.security.crypto.bcrypt.BCrypt;
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
		// avant mise en place de la sécurité
		//UserEntity utilisateurBase=userRepository.findByIdentifiantAndPassword(userEntity.getIdentifiant(), userEntity.getPassword());
		
		//Chercher l'user sur la base de son identifiant sans le mdp
		UserEntity utilisateurBase= userRepository.findByIdentifiant(userEntity.getIdentifiant());
		
		// checkpwd vérification entre la saisie du mdp et le modp crypté en base
		if(utilisateurBase!=null && BCrypt.checkpw(userEntity.getPassword(), utilisateurBase.getPassword())) {
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
		// hpwd pour enregioster en base le mpd crypté
		userEntity.setPassword(BCrypt.hashpw(userEntity.getPassword(),BCrypt.gensalt()));
		userEntity.setDroitAdministrateur(false);
		userRepository.save(userEntity);
	}
	
	public UserEntity getUserByIdentifiantAndPassword(UserEntity userEntity) {
		UserEntity utilisateurBase=userRepository.findByIdentifiant(userEntity.getIdentifiant());
		return utilisateurBase;	
	}

	public UserEntity getUserByIdentifiant(String identifiant) {
		UserEntity utilisateurBase=userRepository.findByIdentifiant(identifiant);
		return utilisateurBase;
	}

	public boolean verifierDroitAdministrateurUserEnregistre(UserEntity userConnecte) {
		Boolean droitAdministrateur=false;
		
		UserEntity utilisateurBase=userRepository.findByIdentifiant(userConnecte.getIdentifiant());
			if (utilisateurBase !=null) {
				if (utilisateurBase.getDroitAdministrateur()) {
					droitAdministrateur=true;
				}
			}	
		return droitAdministrateur;
	}	
}