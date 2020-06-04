package com.emmanuel.plumas.consumers;

import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.data.repository.CrudRepository;
import org.springframework.stereotype.Repository;

import com.emmanuel.plumas.models.LieuEntity;


@Repository
@Qualifier("ILieuEntityRepository")
public interface ILieuEntityRepository extends CrudRepository<LieuEntity,Long>{

	LieuEntity findByVille(String ville);

}
