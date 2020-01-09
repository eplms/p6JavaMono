package com.emmanuel.plumas.consumers;

import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.data.repository.CrudRepository;
import org.springframework.stereotype.Repository;

import com.emmanuel.plumas.models.UserEntity;

@Repository
@Qualifier("IUserEntityRepository")
public interface IUserEntityRepository extends CrudRepository<UserEntity, Long>{
	// Pas de déclaration de méthode nécessaire pour les méthodes classiques du crud
}
