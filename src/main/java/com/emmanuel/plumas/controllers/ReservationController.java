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
		reservationService.sauvegarderReservation(new Long(idTopo), identifiantUser);
		model.addAttribute("topo",topoEntity);
		return "demandereservationtopo";
	}
	
	@GetMapping(value="/gestionreservation")
	public String afficherGestionReservation(ModelMap model,HttpSession httpSession) {
		UserEntity userEntity =(UserEntity) httpSession.getAttribute("userConnection");
		userEntity = userService.getUserByIdentifiantAndPassword(userEntity);
		List<ReservationEntity> reservationsProprietaires=reservationService.getReservationByOwner(userEntity.getId());
		model.addAttribute("utilisateur",userEntity);
		model.addAttribute("reservationsProprietaires",reservationsProprietaires);
		//model.addAttribute("reservationDemandeur");
		return "gestionreservation";
	}
	
}
