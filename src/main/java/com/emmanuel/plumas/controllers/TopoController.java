package com.emmanuel.plumas.controllers;

import java.util.TreeSet;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.emmanuel.plumas.business.SpotEntityService;
import com.emmanuel.plumas.business.TopoEntityService;
import com.emmanuel.plumas.models.TopoEntity;

@Controller
public class TopoController {

	@Autowired
	@Qualifier("SpotEntityService")
	private SpotEntityService spotEntityService; 
	
	@Autowired
	@Qualifier("TopoEntityService")
	private TopoEntityService topoService;
	
	@GetMapping(value="/listeTopos")
	public String afficherListeTopos (ModelMap model, @RequestParam("idSpot")String idSpot) {
		model.addAttribute("spot",spotEntityService.getSpot(new Long(idSpot)));
		TreeSet<TopoEntity> topoEntities=topoService.getTopoBySpotId(new Long(idSpot));		
		model.addAttribute("topos",topoEntities);
		return "listetopos";
	}
}
