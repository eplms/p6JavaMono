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
import com.emmanuel.plumas.business.VoieEntityService;
import com.emmanuel.plumas.models.SecteurEntity;
import com.emmanuel.plumas.models.UserEntity;
import com.emmanuel.plumas.models.VoieEntity;


@Controller
public class VoieController {

	@Autowired
	@Qualifier("VoieEntityService")
	private VoieEntityService voieEntityService;
	
	@Autowired
	@Qualifier("SecteurEntityService")
	private SecteurEntityService secteurEntityService;
	
	@ModelAttribute("voieCreation")
	public VoieEntity setVoieCreation() {
		return new VoieEntity();
	}
	
	
	@GetMapping(value="/detailvoie")
	public String afficherDetailVoie(ModelMap model,@RequestParam("id") String idVoie) {
		VoieEntity voieEntity=voieEntityService.getVoie(new Long(idVoie));
		model.addAttribute("voie",voieEntity);
		return "detailvoie";
	}
	
	@GetMapping(value="/creationvoie")
	public String afficherFormulaireCreationVoie(HttpSession httpSession, ModelMap model, @RequestParam("idsecteur") Long idSecteur) {
		SecteurEntity secteurEntity=secteurEntityService.getSecteur(idSecteur);
		UserEntity userConnecte =(UserEntity) httpSession.getAttribute("userConnection");
		if (userConnecte.getIdentifiant().equals(secteurEntity.getSpotEntity().getUserEntity().getIdentifiant())) {
			model.addAttribute("secteur",secteurEntity);
			return "creationvoie";
		}else {
			return "redirect:/connectionutilisateur";
		}
	}
	@PostMapping(value="/creationvoie")
	public String recupererCreationVoie(ModelMap model,@ModelAttribute("voieCreation") VoieEntity voieEntity) {
		SecteurEntity secteurEntity=secteurEntityService.getSecteur(voieEntity.getSecteurEntity().getId());
		voieEntity.setSecteurEntity(secteurEntity);
		voieEntityService.creerNouvelVoie(voieEntity);
		model.addAttribute("voie",voieEntity);
		return "confirmationcreationvoie";
	}
}
