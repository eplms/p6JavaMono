package com.emmanuel.plumas.controllers;

import java.util.Date;
import java.util.TreeSet;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.SessionAttributes;

import com.emmanuel.plumas.business.SpotEntityService;
import com.emmanuel.plumas.models.SpotEntity;
import com.emmanuel.plumas.models.UserEntity;


@Controller
@SessionAttributes("userConnection")
public class Spot {

	
	@Autowired
	@Qualifier("SpotEntityService")
	private SpotEntityService spotEntityService;
	
	@ModelAttribute("spotCreation")
	public SpotEntity setSpotCreation() {
		return new SpotEntity();
	}
	
	@GetMapping(value="/spot")
	public String afficherListeSpots(ModelMap model) {
			TreeSet <SpotEntity> listeSpot= spotEntityService.getAllSpot();
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
	
	@GetMapping(value="/creation")
	public String afficherCreationSpot(HttpSession httpSession) {
		//Vérification de la connection avant d'accéder à la page connection
		if (httpSession.getAttribute("userConnection")!=null) {
			return "creationspot";
		}else {
			//retour au formulaire de connection si l'utilisateu n'est pas connecté
			return "redirect:/connectionutilisateur";
		}
		
	}
	
	@PostMapping(value="/creation")
	public String recupereCreationSpot(@ModelAttribute("spotCreation") SpotEntity spotEntity, ModelMap model,HttpSession httpSession) {
			/* Renseignement de la date du système lors de la création du spot */
			Date dateCreationSpot = new Date();
			spotEntity.setDateCreation(dateCreationSpot);
			/* tagOfficiel mis en false par défaut */
			spotEntity.setTagOfficiel(false);
			/* Récupération de l'utilisateur dans la variable de session */
			UserEntity userConnection=(UserEntity) httpSession.getAttribute("userConnection");
			spotEntity.setUserEntity(userConnection);
			
			model.addAttribute("spotentity", spotEntity);
			return "confirmationcreationspot";
		
	}
	
	
}