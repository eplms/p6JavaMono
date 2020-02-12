package com.emmanuel.plumas.controllers;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.SessionAttributes;

import com.emmanuel.plumas.business.UserEntityService;
import com.emmanuel.plumas.models.UserEntity;

@Controller
@SessionAttributes({"userConnection","userCreation"})
public class ConnectionUtilisateur {

	@Autowired
	@Qualifier("UserEntityService")
	private UserEntityService userEntityService;
	
	
	@ModelAttribute("userConnection")
	public UserEntity getUserConnection() {
		return new UserEntity();
	}
	
	@ModelAttribute("userCreation")
	public UserEntity getUserCreation() {
		return new UserEntity();
	}
	
	@GetMapping("/connectionutilisateur")
	public String afficherFormulaireConnection() {
		return "formulaireconnection";
	}
	
	@PostMapping("/connectionutilisateur")
	public String recupererConnectionUtilisateur(@ModelAttribute("userConnection") UserEntity userConnecte,ModelMap model) {

		boolean utilisateurEnregistre = userEntityService.verifierUserEnregistre(userConnecte);
		if (utilisateurEnregistre) {
			return "connectionreussie";
		}else {
			model.addAttribute("message1","Identifiant et/ou mot de passe incorrect !");
			model.addAttribute("message2","Veuillez saisir à nouveau votre identifiant et votre mot de passe");
			return "formulaireconnection";
		}			
	}
	
	@GetMapping("/connectionreussie")
	public String afficherConnectionReussie(ModelMap model) {
		//model.addAttribute("userconnecte",userConnecte.getIdentifiant());
		// Pas de nécessité de passer l'attribut avec la ligne du dessus car c'est un attribut de cession
		return "connectionreussie";
	}
	
	@GetMapping("/inscription")
	public String AfficherFormulaireInscription(ModelMap model) {
		return "formulaireinscription";
	}
	
	@PostMapping("/inscription")
	public String recupererDonneesCreationUtilisateur( @ModelAttribute("userCreation") UserEntity userCreation,ModelMap model) {
		boolean verifierCreationUtilisateurPossible=userEntityService.verifierCreationUser(userCreation);
		if(verifierCreationUtilisateurPossible) {
			userEntityService.creerNouvelUser(userCreation);
			return "inscriptionreussie";
		} else {
			model.addAttribute("message1","l'Identifiant et/ou l'email existe déjà ");
			model.addAttribute("message2"," Veuillez saisir à nouveau identifiant, mot de passe et mail");
			return "formulaireinscription";
		}
		
	}
	
	@GetMapping("/inscriptionreussie")
	public String afficherInscriptionReussie(ModelMap model) {
		return "inscriptionreussie";
	}
}
