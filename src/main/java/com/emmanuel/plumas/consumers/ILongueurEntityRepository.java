package com.emmanuel.plumas.consumers;

import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.data.repository.CrudRepository;
import org.springframework.stereotype.Repository;

import com.emmanuel.plumas.models.LongueurEntity;

@Repository
@Qualifier("ILongueurEntityRepository")
public interface ILongueurEntityRepository extends CrudRepository<LongueurEntity,Long>{

}
