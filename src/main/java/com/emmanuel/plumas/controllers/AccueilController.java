package com.emmanuel.plumas.controllers;

import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.GetMapping;



@Controller
public class AccueilController {

	
	@GetMapping(value="/")
	public String afficherAccueil(ModelMap model) {
	     return "accueil";
	}
}
