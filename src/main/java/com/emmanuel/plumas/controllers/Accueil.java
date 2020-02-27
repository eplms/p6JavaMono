package com.emmanuel.plumas.controllers;

import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.GetMapping;



@Controller
public class Accueil {

	
	@GetMapping(value="/")
	public String afficherUser(ModelMap model) {
	     return "accueil";
	}
}
