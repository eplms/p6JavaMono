package com.emmanuel.plumas.controllers;

import java.util.List;
//import java.util.TreeSet;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.GetMapping;
//import org.springframework.web.bind.annotation.RequestParam;
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
	
	
	@GetMapping(value="/listeToposBis")
	public String afficherListeToposBis (ModelMap model, @RequestParam("idSpot")String idSpot) {
		model.addAttribute("spot",spotEntityService.getSpot(new Long(idSpot)));
		List<TopoEntity> topoEntities=topoService.getTopoBySpotId(new Long(idSpot));		
		model.addAttribute("topos",topoEntities);
		return "listetoposbis";
	}
	
	@GetMapping(value="/listeTopos")
	public String afficherListeToposBis(ModelMap model) {
		List<TopoEntity> topoEntities=topoService.getAllTopos();
		model.addAttribute("topos", topoEntities);
		return "listetopos";
	}
}
