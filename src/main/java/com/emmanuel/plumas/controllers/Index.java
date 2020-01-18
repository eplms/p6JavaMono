package com.emmanuel.plumas.controllers;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.GetMapping;
import com.emmanuel.plumas.business.UserEntityService;
import com.emmanuel.plumas.models.UserEntity;



@Controller
public class Index {

	
	@Autowired
	@Qualifier("UserEntityService")
	private UserEntityService u;
	@GetMapping(value="/index")
	public String afficherUser(ModelMap model) {
	      UserEntity nom=u.getUser((long) 2);
	      model.addAttribute("nom",nom);
	    //spécifie le nom de la jsp à retourner en String, ici bonjour2.jsp
	     return "index";

	}
}
