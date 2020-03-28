package com.emmanuel.plumas.controllers;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.GetMapping;

import com.emmanuel.plumas.business.LieuEntityService;
import com.emmanuel.plumas.models.LieuEntity;

@Controller
public class LieuController {

	
	@Autowired
	@Qualifier("LieuEntityService")
	private LieuEntityService l;
	@GetMapping(value="/localisation")
	public String afficherLieu(ModelMap model) {
	      List <LieuEntity> lieu=(List<LieuEntity>) l.getAllLieu();
	      model.addAttribute("lieu",lieu);
	    //spécifie le nom de la jsp à retourner en String, ici localisation.jsp
	     return "localisation";

	}
}