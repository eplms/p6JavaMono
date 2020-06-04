package com.emmanuel.plumas.controllers;

import java.util.Date;
import java.util.List;
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
import com.emmanuel.plumas.business.LieuEntityService;
import com.emmanuel.plumas.business.SpotEntityService;
import com.emmanuel.plumas.business.UserEntityService;
import com.emmanuel.plumas.models.CommentaireEntity;
import com.emmanuel.plumas.models.LieuEntity;
import com.emmanuel.plumas.models.SpotEntity;
import com.emmanuel.plumas.models.UserEntity;



@Controller
public class SpotController {

	
	@Autowired
	@Qualifier("SpotEntityService")
	private SpotEntityService spotEntityService;
	
	@Autowired
	@Qualifier ("LieuEntityService")
	private LieuEntityService lieuEntityService;
	
	@Autowired
	@Qualifier ("UserEntityService")
	private UserEntityService userEntityService;
		
	
	@ModelAttribute("spotCreation")
	public SpotEntity setSpotCreation() {
		return new SpotEntity();
	}
	
	@ModelAttribute("spotRecherche")
	public SpotEntity setSpotRecherche() {
		return new SpotEntity();
	}
	
	@ModelAttribute("creationCommentaire")
	public CommentaireEntity setCommentaireEntity() {
		return new CommentaireEntity();
	}
	
	@GetMapping(value="/listespot")
	public String afficherListeSpots(ModelMap model) {
			TreeSet <SpotEntity> listeSpot= spotEntityService.getAllSpot();
			model.addAttribute("listeSpot",listeSpot);
			//spécifie le nom de la jsp à retourner en String, ici spot.jsp
			return "listespot";
	}
		
	@GetMapping(value="/detailspot")
	public String afficherDetailSpot(ModelMap model, @RequestParam("id") String idSpot) {
	     SpotEntity spot= spotEntityService.getSpot(new Long(idSpot));
	      model.addAttribute("spot",spot);
	    //spécifie le nom de la jsp à retourner en String, ici detailspot.jsp
	     return "detailspot";
	}
	
	// Création methode @PostMapping pour transformer le spot avec le tag officiel
	@PostMapping(value="/detailspot")
	public String officialiserSpot(ModelMap model, @ModelAttribute("spotCreation") SpotEntity spotEntity) {
		//Changer le statut du spot et récupérer le spot incluant les modifications
		SpotEntity spot=spotEntityService.upDateSpot(spotEntity);
		//transmettre le spot mis à jour après changement de statut
		model.addAttribute("spot",spot);
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
	
	@GetMapping(value="/recherchespot")
	public String afficherFormulaireRechercheSpot() {
		return "recherchespot";
	}
	
	@PostMapping(value="/recherchespot")
	public String rechercheSpot(ModelMap model,@ModelAttribute("spotRecherche") SpotEntity spotEntity) {
		List<SpotEntity> spotEntities=spotEntityService.getSpotByNameOrVille(spotEntity.getNom(),spotEntity.getLieuEntity().getVille());
		model.addAttribute("spots", spotEntities);
		return  "listespotsrecherches";
	}
}
