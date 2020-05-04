package com.emmanuel.plumas.controllers;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.emmanuel.plumas.business.ReservationEntityService;
import com.emmanuel.plumas.business.TopoEntityService;
import com.emmanuel.plumas.models.TopoEntity;

@Controller
public class ReservationController {

	@Autowired
	@Qualifier("TopoEntityService")
	private TopoEntityService topoService;
	
	@Autowired
	@Qualifier("ReservationEntityService")
	private ReservationEntityService reservationService;
	
	@GetMapping(value="/demandereservationtopo")
	public String afficherDemandeReservationTopo(ModelMap model, @RequestParam ("idTopo") String idTopo, @RequestParam("identifiantUtilisateur") String identifiantUser) {
		TopoEntity topoEntity=topoService.getTopoById(new Long(idTopo));
		reservationService.sauvegarderReservation(new Long(idTopo), identifiantUser);
		model.addAttribute("topo",topoEntity);
		return "demandereservationtopo";
	}
	
	@GetMapping(value="/gestionreservation")
	public String afficherGestionReservation(ModelMap model,HttpSession httpSession,@RequestParam("iduser") String identifiantUser) {
		
		//ReservationEntity reservationProprioEntity=reservationService.getAllReservationByTopo();
		model.addAttribute("utilisateur",httpSession.getAttribute("userConnection"));
		//model.addAttribute("reservationProprietaire",reservationProprioEntity);
		return "gestionreservation";
	}
	
}
