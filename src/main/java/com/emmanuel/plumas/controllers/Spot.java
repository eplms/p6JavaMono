package com.emmanuel.plumas.controllers;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.SessionAttributes;

import com.emmanuel.plumas.business.SpotEntityService;
import com.emmanuel.plumas.models.SpotEntity;


@Controller
@SessionAttributes("userConnection")
public class Spot {

	
	@Autowired
	@Qualifier("SpotEntityService")
	private SpotEntityService spotEntityService;
	
	
	@GetMapping(value="/spot")
	public String afficherListeSpots(ModelMap model,HttpSession httpSession) {
		//Vérification de la connection avant d'accéder à la liste des spots
		
		if(httpSession.getAttribute("userConnection")!=null) {
			List <SpotEntity> listeSpot=(List<SpotEntity>) spotEntityService.getAllSpot();
			model.addAttribute("listeSpot",listeSpot);
			//spécifie le nom de la jsp à retourner en String, ici spot.jsp
			return "spot";
		}else {
			//retour au formulaire de connection si l'utilisateur n'est pas connecté
			return "redirect:/connectionutilisateur";
		}
	}
		
	@GetMapping(value="/detailspot")
	public String afficherDetailSpot(ModelMap model, @RequestParam("id") String idSpot) {
	     SpotEntity spot= spotEntityService.getSpot(new Long(idSpot));
	      model.addAttribute("spot",spot);
	    //spécifie le nom de la jsp à retourner en String, ici detailspot.jsp
	     return "detailspot";
	}
}