package com.emmanuel.plumas.controllers;

import java.time.LocalTime;
import java.util.Date;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.emmanuel.plumas.business.CommentaireEntityService;
import com.emmanuel.plumas.business.SpotEntityService;
import com.emmanuel.plumas.business.UserEntityService;
import com.emmanuel.plumas.models.CommentaireEntity;
import com.emmanuel.plumas.models.UserEntity;

@Controller
public class CommentaireController {
	
	@Autowired
	@Qualifier("CommentaireEntityService")
	private CommentaireEntityService commentaireService;
	
	@Autowired
	@Qualifier("SpotEntityService")
	private SpotEntityService spotService;
	
	@Autowired
	@Qualifier("UserEntityService")
	private UserEntityService userService;
	
	@ModelAttribute("creationCommentaire")
	public CommentaireEntity setCommentaireEntity() {
		return new CommentaireEntity();
	}

	
	@GetMapping(value="/deleteComment")
	public String supprimerCommentaire(ModelMap model,@RequestParam("idComment") String idCommentaire, @RequestParam("idSpot") String idSpot) {
		commentaireService.supprimerCommentaire(new Long(idCommentaire));
		return "redirect:/detailspot?id="+idSpot;
	}
	
	@PostMapping(value="/ajouterCommentaire")
	public String ajouterCommentaire(ModelMap model,@ModelAttribute("creationCommentaire") CommentaireEntity commentaireEntity) {		
		UserEntity userEntity=userService.getUserByIdentifiantAndPassword(commentaireEntity.getUserEntity());
		commentaireEntity.setUserEntity(userEntity);
		commentaireEntity.setDateCommentaire(new Date());
		commentaireEntity.setHeureCommentaire(LocalTime.now());
		commentaireService.ajouterCommentaire(commentaireEntity);
		return "redirect:/detailspot?id="+commentaireEntity.getSpotEntity().getId();
	}
	
}
