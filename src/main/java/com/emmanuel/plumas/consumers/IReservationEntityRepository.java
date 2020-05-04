package com.emmanuel.plumas.consumers;

import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.data.repository.CrudRepository;
import org.springframework.stereotype.Repository;

import com.emmanuel.plumas.models.ReservationEntity;

@Repository
@Qualifier("IReservationEntityRepository")
public interface IReservationEntityRepository extends CrudRepository<ReservationEntity,Long>{

}
