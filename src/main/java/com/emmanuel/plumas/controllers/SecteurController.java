package com.emmanuel.plumas.controllers;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.emmanuel.plumas.business.SecteurEntityService;
import com.emmanuel.plumas.business.SpotEntityService;
import com.emmanuel.plumas.models.SecteurEntity;
import com.emmanuel.plumas.models.SpotEntity;
import com.emmanuel.plumas.models.UserEntity;

@Controller
public class SecteurController {

	@Autowired
	@Qualifier("SecteurEntityService")
	private SecteurEntityService secteurEntityService;
	
	@Autowired
	@Qualifier("SpotEntityService")
	private SpotEntityService spotEntityService;
	
	@ModelAttribute("secteurCreation")
	public SecteurEntity setSecteurCreation() {
		return new SecteurEntity();
	}
	
	@GetMapping(value="/detailsecteur")
	public String afficherDetailSecteur(ModelMap model, @RequestParam("id") String idSecteur) {
	     SecteurEntity secteurEntity= secteurEntityService.getSecteur(new Long(idSecteur));
	      model.addAttribute("secteur",secteurEntity);
	    //spécifie le nom de la jsp à retourner en String, ici detailsecteur.jsp
	     return "detailsecteur";
	}
	
	@GetMapping(value="/creationsecteur")
	public String afficherFormulaireCreationSecteur(HttpSession httpSession,@RequestParam("idspot") Long idSpot, ModelMap model) {
		/* Transmission à la jsp du spot dans lequel sera créé l'objet */
		SpotEntity spot=spotEntityService.getSpot(idSpot);
		UserEntity userConnecte= (UserEntity) httpSession.getAttribute("userConnection");
		
		if (userConnecte.getIdentifiant().equals(spot.getUserEntity().getIdentifiant())){
			model.addAttribute("spot",spot);
			return "creationsecteur";
		} else {
			return "redirect:/connectionutilisateur";
		}
	}
	
	@PostMapping(value="/creationsecteur")
	public String recupererCreationSecteur(ModelMap model,@ModelAttribute("secteurCreation") SecteurEntity secteurEntity) {
		//La récupération de l'idspot est suffisante
		secteurEntityService.creerNouveauSecteur(secteurEntity);
		
		model.addAttribute("secteur", secteurEntity);
		return "confirmationcreationsecteur";
	}
	
}
