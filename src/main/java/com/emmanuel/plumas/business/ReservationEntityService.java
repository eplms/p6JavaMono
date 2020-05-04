package com.emmanuel.plumas.business;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;

import com.emmanuel.plumas.consumers.IReservationEntityRepository;
import com.emmanuel.plumas.models.ReservationEntity;

@Service
@Qualifier("ReservationEntityService")
public class ReservationEntityService {

	@Autowired
	@Qualifier("IReservationEntityRepository")
	private IReservationEntityRepository reservationRepository;
	
	@Autowired
	@Qualifier("TopoEntityService")
	private TopoEntityService topoService;
	
	@Autowired
	@Qualifier("UserEntityService")
	private UserEntityService userService;

	public void sauvegarderReservation(Long idTopo, String idUser) {
		ReservationEntity reservationEntity = new ReservationEntity();
		reservationEntity.setTopoEntity(topoService.getTopoById(idTopo));
		reservationEntity.setUserEntity(userService.getUserByIdentifiant(idUser));
		reservationEntity.setStatutReservation("en attente");
		reservationRepository.save(reservationEntity);
	}
	
	
}
