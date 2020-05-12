package com.emmanuel.plumas.business;

import java.util.ArrayList;
import java.util.List;
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

	public List<ReservationEntity> getReservationByOwner(Long id) {
		List<ReservationEntity> reservationsEntities=(List<ReservationEntity>) reservationRepository.findAll();
		List<ReservationEntity> reservationsOwnerEntities=new ArrayList<ReservationEntity> ();
		
		for(ReservationEntity reservationEntity : reservationsEntities) {	 
			if(reservationEntity.getTopoEntity().getUserEntity().getId()==id){
				reservationEntity.setTopoEntity(topoService.getTopoById(reservationEntity.getTopoEntity().getId()));
				reservationsOwnerEntities.add(reservationEntity);
			}
		}
		
		return reservationsOwnerEntities;
	}
	
	public List<ReservationEntity> getReservationByBorrower(Long id){
		List<ReservationEntity> reservationsBorrowerEntities=reservationRepository.findByUserEntityId(id);
		return reservationsBorrowerEntities;
	}

	public ReservationEntity getReservationById(Long id) {
		return reservationRepository.findById(id).get();
	}

	public void sauvegarderReservation(ReservationEntity reservationEntity) {
		reservationRepository.save(reservationEntity);
	}

	public List<ReservationEntity> getReservationByTopo(Long id) {
		List <ReservationEntity> reservationEntities=reservationRepository.findByTopoEntityId(id);
		return reservationEntities;
	}
	
	
	
	public ReservationEntity getReservationAttenteByTopoAndByBorrower(String idTopo, String identifiantUser) {
		List<ReservationEntity> reservationEntities=reservationRepository.findByTopoEntityId(new Long(idTopo));
		ReservationEntity reservationE=null;
		for(ReservationEntity reservationEntity:reservationEntities) {
			if((reservationEntity.getUserEntity().getIdentifiant().equals(identifiantUser)) && (reservationEntity.getStatutReservation().contentEquals("en attente"))) {
				reservationE=reservationEntity;
			}
		}
		return reservationE;
	}
	
	
}
