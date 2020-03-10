package com.emmanuel.plumas.consumers;

import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.data.repository.CrudRepository;
import org.springframework.stereotype.Repository;

import com.emmanuel.plumas.models.UserEntity;

@Repository
@Qualifier("IUserEntityRepository")
public interface IUserEntityRepository extends CrudRepository<UserEntity, Long>{
	// Pas de déclaration de méthode nécessaire pour les méthodes classiques du crud
	
	/* Méthode déclarée à partir des mots clés find By et And et d'attribut
	 Spring Data Jpa sait implémenter tout seul la méthode */
	public UserEntity findByIdentifiantAndPassword(String identifiant, String password);
	
	public UserEntity findByIdentifiantOrAdresseMail(String identifiant, String adresseMail);

	public UserEntity findByIdentifiant(String identifiant);
}
