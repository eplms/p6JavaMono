package com.emmanuel.plumas.consumers;

import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.data.repository.CrudRepository;
import org.springframework.stereotype.Repository;

import com.emmanuel.plumas.models.SpotEntity;

@Repository
@Qualifier("ISpotEntityRepository")
public interface ISpotEntityRepository extends CrudRepository<SpotEntity, Long>{

}
