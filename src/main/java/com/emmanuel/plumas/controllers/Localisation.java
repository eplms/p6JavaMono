package com.emmanuel.plumas.controllers;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.GetMapping;

import com.emmanuel.plumas.business.LieuEntityService;
import com.emmanuel.plumas.models.LieuEntity;

@Controller
public class Localisation {

	
	@Autowired
	@Qualifier("LieuEntityService")
	private LieuEntityService l;
	@GetMapping(value="/localisation")
	public String afficherLieu(ModelMap model) {
	      LieuEntity nom=l.getLieu((long) 2);
	      model.addAttribute("nom",nom);
	    //spécifie le nom de la jsp à retourner en String, ici bonjour2.jsp
	     return "localisation";

	}
}