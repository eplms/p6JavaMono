package com.emmanuel.plumas.controllers;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestParam;

import com.emmanuel.plumas.business.SecteurEntityService;
import com.emmanuel.plumas.business.SpotEntityService;
import com.emmanuel.plumas.models.SecteurEntity;
import com.emmanuel.plumas.models.SpotEntity;


@Controller
public class Spot {

	
	@Autowired
	@Qualifier("SpotEntityService")
	private SpotEntityService l;
	@GetMapping(value="/spot")
	public String afficherSpot(ModelMap model) {
	      List <SpotEntity> nomSpot=(List<SpotEntity>) l.getAllSpot();
	      model.addAttribute("nomSpot",nomSpot);
	    //spécifie le nom de la jsp à retourner en String, ici spot.jsp
	     return "spot";

	}
	@Autowired
	@Qualifier("SecteurEntityService")
	private SecteurEntityService s;	
	@GetMapping(value="/detailspot")
	public String afficherDetailSpot(ModelMap model, @RequestParam("detailspot") String detailSpot) {
	      List <SecteurEntity> nomSecteur=(List<SecteurEntity>) s.getAllSecteur();
	      model.addAttribute("nomSecteur",nomSecteur);
	      model.addAttribute("detail",detailSpot);
	    //spécifie le nom de la jsp à retourner en String, ici detailspot.jsp
	     return "detailspot";

	}
}