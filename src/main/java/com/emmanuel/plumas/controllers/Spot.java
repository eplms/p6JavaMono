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

import com.emmanuel.plumas.business.LieuEntityService;
import com.emmanuel.plumas.business.SecteurEntityService;
import com.emmanuel.plumas.business.SpotEntityService;
import com.emmanuel.plumas.business.UserEntityService;
import com.emmanuel.plumas.business.VoieEntityService;
import com.emmanuel.plumas.models.LieuEntity;
import com.emmanuel.plumas.models.SecteurEntity;
import com.emmanuel.plumas.models.SpotEntity;
import com.emmanuel.plumas.models.UserEntity;
import com.emmanuel.plumas.models.VoieEntity;


@Controller
@SessionAttributes("userConnection")
public class Spot {

	
	@Autowired
	@Qualifier("SpotEntityService")
	private SpotEntityService spotEntityService;
	
	@Autowired
	@Qualifier ("LieuEntityService")
	private LieuEntityService lieuEntityService;
	
	@Autowired
	@Qualifier ("UserEntityService")
	private UserEntityService userEntityService;
	
	@Autowired
	@Qualifier("SecteurEntityService")
	private SecteurEntityService secteurEntityService;
	
	@Autowired
	@Qualifier("VoieEntityService")
	private VoieEntityService voieEntityService;
	
	
	@ModelAttribute("spotCreation")
	public SpotEntity setSpotCreation() {
		return new SpotEntity();
	}
	
	@ModelAttribute("secteurCreation")
	public SecteurEntity setSecteurCreation() {
		return new SecteurEntity();
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
	
	@GetMapping(value="/detailsecteur")
	public String afficherDetailSecteur(ModelMap model, @RequestParam("id") String idSecteur) {
	     SecteurEntity secteurEntity= secteurEntityService.getSecteur(new Long(idSecteur));
	      model.addAttribute("secteur",secteurEntity);
	    //spécifie le nom de la jsp à retourner en String, ici detailsecteur.jsp
	     return "detailsecteur";
	}
	
	@GetMapping(value="/detailvoie")
	public String afficherDetailVoie(ModelMap model,@RequestParam("id") String idVoie) {
		VoieEntity voieEntity=voieEntityService.getVoie(new Long(idVoie));
		model.addAttribute("voie",voieEntity);
		return "detailvoie";
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
		
		/* Récupération de l'utilisateur V2*/		
		UserEntity user=(UserEntity) httpSession.getAttribute("userConnection");
		user=userEntityService.getUserByIdentifiantAndPassword(user);
		spotEntity.setUserEntity(user);
		
		/* Récupération du lieu V3*/
		LieuEntity lieu=lieuEntityService.getLieuByVilleAndCodePostal(spotEntity.getLieuEntity());
		if(lieu==null) {		
			lieuEntityService.creerNouveauLieu(spotEntity.getLieuEntity());
			lieu=lieuEntityService.getLieuByVilleAndCodePostal(spotEntity.getLieuEntity());
		}
		spotEntity.setLieuEntity(lieu);
		
		/* Création de l'instance de Spot  dans la base */
		spotEntityService.creerNouveauSpot(spotEntity);
		model.addAttribute("spotentity", spotEntity);
		return "confirmationcreationspot";
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
