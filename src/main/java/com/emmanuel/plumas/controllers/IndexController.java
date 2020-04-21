package com.emmanuel.plumas.controllers;

import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.GetMapping;



@Controller
public class IndexController {

	
	@GetMapping(value="/")
	public String afficherAccueil(ModelMap model, HttpSession httpSession) {
	    model.addAttribute("userconnection"); 
		return "accueil";
	}
}
