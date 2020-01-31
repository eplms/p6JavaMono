package com.emmanuel.plumas.controllers;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.emmanuel.plumas.business.SpotEntityService;
import com.emmanuel.plumas.models.SpotEntity;


@Controller
public class Spot {

	
	@Autowired
	@Qualifier("SpotEntityService")
	private SpotEntityService spotEntityService;
	
	
	
	@GetMapping(value="/spot")
	public String afficherListeSpots(ModelMap model) {
	      List <SpotEntity> listeSpot=(List<SpotEntity>) spotEntityService.getAllSpot();
	      model.addAttribute("listeSpot",listeSpot);
	    //spécifie le nom de la jsp à retourner en String, ici spot.jsp
	     return "spot";
	}
		
	@GetMapping(value="/detailspot")
	public String afficherDetailSpot(ModelMap model, @RequestParam("id") String idSpot) {
	     SpotEntity spot= spotEntityService.getSpot(new Long(idSpot));
	      model.addAttribute("spot",spot);
	    //spécifie le nom de la jsp à retourner en String, ici detailspot.jsp
	     return "detailspot";
	}
}