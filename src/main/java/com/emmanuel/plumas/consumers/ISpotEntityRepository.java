package com.emmanuel.plumas.consumers;

import java.util.List;

import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.data.repository.CrudRepository;
import org.springframework.stereotype.Repository;

import com.emmanuel.plumas.models.LieuEntity;
import com.emmanuel.plumas.models.SpotEntity;

@Repository
@Qualifier("ISpotEntityRepository")
public interface ISpotEntityRepository extends CrudRepository<SpotEntity, Long>{

	List<SpotEntity> findByNomOrLieuEntity(String nom, LieuEntity lieuEntity);

	//List<SpotEntity> findAllById(List<Long> list);

}
