package com.emmanuel.plumas.consumers;

import java.util.TreeSet;

import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.CrudRepository;
import org.springframework.stereotype.Repository;

import com.emmanuel.plumas.models.TopoEntity;


@Repository
@Qualifier("ITopoEntityRepository")
public interface ITopoEntityRepository extends CrudRepository<TopoEntity,Long>{
	
	@Query("select t from TopoEntity t join SpotEntity s where s.id=2")
	public TreeSet<TopoEntity> findBySpotEntities_Id(Long Id);
	
}
