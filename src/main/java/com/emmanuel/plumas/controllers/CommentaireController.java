package com.emmanuel.plumas.controllers;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.emmanuel.plumas.business.CommentaireEntityService;
import com.emmanuel.plumas.business.SpotEntityService;

@Controller
public class CommentaireController {
	
	@Autowired
	@Qualifier("CommentaireEntityService")
	private CommentaireEntityService commentaireService;
	
	@Autowired
	@Qualifier("SpotEntityService")
	private SpotEntityService spotService;
	
	
	@GetMapping(value="/deleteComment")
	public String supprimerCommentaire(ModelMap model,@RequestParam("idComment") String idCommentaire, @RequestParam("idSpot") String idSpot) {
		commentaireService.supprimerCommentaire(new Long(idCommentaire));
		return "redirect:/detailspot?id="+idSpot;
	}
	
}
