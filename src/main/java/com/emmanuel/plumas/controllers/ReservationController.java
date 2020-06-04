package com.emmanuel.plumas.controllers;

import java.util.List;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.emmanuel.plumas.business.ReservationEntityService;
import com.emmanuel.plumas.business.TopoEntityService;
import com.emmanuel.plumas.business.UserEntityService;
import com.emmanuel.plumas.models.ReservationEntity;
import com.emmanuel.plumas.models.TopoEntity;
import com.emmanuel.plumas.models.UserEntity;

@Controller
public class ReservationController {

	@Autowired
	@Qualifier("TopoEntityService")
	private TopoEntityService topoService;
	
	@Autowired
	@Qualifier("ReservationEntityService")
	private ReservationEntityService reservationService;
	
	@Autowired
	@Qualifier("UserEntityService")
	private UserEntityService userService;
	
	@GetMapping(value="/demandereservationtopo")
	public String afficherDemandeReservationTopo(ModelMap model, @RequestParam ("idTopo") String idTopo, @RequestParam("identifiantUtilisateur") String identifiantUser) {
		TopoEntity topoEntity=topoService.getTopoById(new Long(idTopo));
		// rechercher une réservation avec ce topo et cet identifiant utilisateur
		
		ReservationEntity reservationEntity=null;
		reservationEntity=reservationService.getReservationAttenteByTopoAndByBorrower(idTopo,identifiantUser);
		if(reservationEntity!=null) {
			return "redirect:/reservationfaite?idTopo="+idTopo;
		}else {
			reservationService.sauvegarderReservation(new Long(idTopo), identifiantUser);
			model.addAttribute("topo",topoEntity);
			return "demandereservationtopo";
		}
	}
	
	@GetMapping(value="/reservationfaite")
	public String afficherReservationDejaFaite(ModelMap model, @RequestParam("idTopo") String idTopo) {
		TopoEntity topoEntity=topoService.getTopoById(new Long(idTopo));
		model.addAttribute("topo",topoEntity);
		return "reservationfaite";
	}
	
	@GetMapping(value="/gestionreservation")
	public String afficherGestionReservation(ModelMap model,HttpSession httpSession) {
		UserEntity userEntity =(UserEntity) httpSession.getAttribute("userConnection");
		userEntity = userService.getUserByIdentifiantAndPassword(userEntity);
		List<ReservationEntity> reservationsProprietaires=reservationService.getReservationByOwner(userEntity.getId());
		List<ReservationEntity> reservationsDemandeurs=reservationService.getReservationByBorrower(userEntity.getId());
		model.addAttribute("utilisateur",userEntity);
		model.addAttribute("reservationsProprietaires",reservationsProprietaires);
		model.addAttribute("reservationsDemandeurs",reservationsDemandeurs);
		
		return "gestionreservation";
	}
	
	@GetMapping(value="/validationreservationtopo")
	public String validerReservationTopo(ModelMap model, @RequestParam("idReservation")String idReservation) {
		ReservationEntity reservationEntity=reservationService.getReservationById(new Long(idReservation));
		
		// Passer le topo en indisponible
		TopoEntity topoEntity = topoService.getTopoById(reservationEntity.getTopoEntity().getId());
		topoEntity.setDisponible(false);
		topoService.sauvegarderTopo(topoEntity);
		
		//Passer la réservation en mode reserve
		reservationEntity.setStatutReservation("reserve");
		reservationService.sauvegarderReservation(reservationEntity);
		
		model.addAttribute("reservation",reservationEntity);
		return "validationreservationtopo";
	}
	
	@GetMapping(value="/refusreservationtopo")
	public String refuserReservationTopo(ModelMap model, @RequestParam("idReservation")String idReservation) {
		ReservationEntity reservationEntity=reservationService.getReservationById(new Long(idReservation));

		//Passer la réservation en mode refuse
		reservationEntity.setStatutReservation("refuse");
		reservationService.sauvegarderReservation(reservationEntity);
				
		model.addAttribute("reservation",reservationEntity);
		return "refusreservationtopo";
	}
	
	
	@GetMapping(value="/cloturepret")
	public String cloreReservationTopo(ModelMap model, @RequestParam("idReservation") String idReservation) {
		ReservationEntity reservationEntity=reservationService.getReservationById(new Long(idReservation));
		// Passer le topo en disponible
		TopoEntity topoEntity = topoService.getTopoById(reservationEntity.getTopoEntity().getId());
		topoEntity.setDisponible(true);
		topoService.sauvegarderTopo(topoEntity);
		
		//Passer la réservation en mode close
		reservationEntity.setStatutReservation("close");
		reservationService.sauvegarderReservation(reservationEntity);
		model.addAttribute("reservation",reservationEntity);
		
		return "confirmationcloturepret";
	}
}
