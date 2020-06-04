package com.emmanuel.plumas.consumers;

import java.util.List;

import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.CrudRepository;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;

import com.emmanuel.plumas.models.TopoEntity;


@Repository
@Qualifier("ITopoEntityRepository")
public interface ITopoEntityRepository extends CrudRepository<TopoEntity,Long>{
	
	@Query("select t from TopoEntity t join t.spotEntities s where s.id=:Id")
	public List<TopoEntity> findBySpotEntities_Id(@Param("Id")Long Id);

	public TopoEntity findByUserEntityId(Long id);
	
}
