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

import com.emmanuel.plumas.business.LongueurEntityService;
import com.emmanuel.plumas.business.VoieEntityService;
import com.emmanuel.plumas.models.LongueurEntity;
import com.emmanuel.plumas.models.UserEntity;
import com.emmanuel.plumas.models.VoieEntity;

@Controller
public class LongueurController {

	@Autowired
	@Qualifier("VoieEntityService")
	private VoieEntityService voieEntityService;
	
	@Autowired
	@Qualifier("LongueurEntityService")
	private LongueurEntityService longueurEntityService;
	
	@ModelAttribute("longueurCreation")
	public LongueurEntity setLongueurCreation()	{
		return new LongueurEntity();
	}
	
	@GetMapping(value="/creationlongueur")
	public String afficherFormulaireCreationLongueur(HttpSession httpSession,ModelMap model,@RequestParam("idvoie") Long idVoie) {
		VoieEntity voieEntity=voieEntityService.getVoie(idVoie);
		UserEntity userConnecte=(UserEntity) httpSession.getAttribute("userConnection");
		if(userConnecte.getIdentifiant().equals(voieEntity.getSecteurEntity().getSpotEntity().getUserEntity().getIdentifiant())){
			model.addAttribute("voie",voieEntity);
			return "creationlongueur";
		}else {
			return "redirect:/connectionutilisateur";
		}
	}
	
	@PostMapping(value="/creationlongueur")
	public String recupererCreationLongueur(ModelMap model,@ModelAttribute("longueurCreation") LongueurEntity longueurEntity) {
		VoieEntity voieEntity=voieEntityService.getVoie(longueurEntity.getVoieEntity().getId());
		longueurEntity.setVoieEntity(voieEntity);
		longueurEntityService.creerNouvelleLongueur(longueurEntity);
		model.addAttribute("longueur",longueurEntity);
		return "confirmationcreationlongueur";
	}
}
