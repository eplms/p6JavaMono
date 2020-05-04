package com.emmanuel.plumas.controllers;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.emmanuel.plumas.business.TopoEntityService;
import com.emmanuel.plumas.models.TopoEntity;

@Controller
public class ReservationController {

	@Autowired
	@Qualifier("TopoEntityService")
	private TopoEntityService topoService;
	
	@GetMapping(value="/demandereservationtopo")
	public String afficherDemandeReservationTopo(ModelMap model, @RequestParam ("idTopo") String idTopo) {
		TopoEntity topoEntity=topoService.getTopoById(new Long(idTopo));
		model.addAttribute("topo",topoEntity);
		return "demandereservationtopo";
	}
	
}
