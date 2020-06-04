package com.emmanuel.plumas.controllers;

import java.util.Date;
import java.util.List;
//import java.util.TreeSet;
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

import com.emmanuel.plumas.business.ReservationEntityService;
import com.emmanuel.plumas.business.SpotEntityService;
import com.emmanuel.plumas.business.TopoEntityService;
import com.emmanuel.plumas.business.UserEntityService;
import com.emmanuel.plumas.formulaire.FormulaireEntity;
import com.emmanuel.plumas.models.ReservationEntity;
import com.emmanuel.plumas.models.SpotEntity;
import com.emmanuel.plumas.models.TopoEntity;
import com.emmanuel.plumas.models.UserEntity;

@Controller
public class TopoController {

	@Autowired
	@Qualifier("SpotEntityService")
	private SpotEntityService spotService; 
	
	@Autowired
	@Qualifier("TopoEntityService")
	private TopoEntityService topoService;
	
	@Autowired
	@Qualifier("UserEntityService")
	private UserEntityService userService;
	
	@Autowired
	@Qualifier("ReservationEntityService")
	private ReservationEntityService reservationService;
	
	@ModelAttribute("formulaireTopoCreation")
	public FormulaireEntity setFormulaireTopo(){
		return new FormulaireEntity();
	}
	
	@ModelAttribute("topoModification")
	public TopoEntity setModificationTopo() {
		return new TopoEntity();
	}
	
	@GetMapping(value="/listeToposBis")
	public String afficherListeToposBis (ModelMap model, @RequestParam("idSpot")String idSpot) {
		model.addAttribute("spot",spotService.getSpot(new Long(idSpot)));
		List<TopoEntity> topoEntities=topoService.getTopoBySpotId(new Long(idSpot));		
		model.addAttribute("topos",topoEntities);
		return "listetoposbis";
	}
	
	@GetMapping(value="/listeTopos")
	public String afficherListeTopos(ModelMap model) {
		List<TopoEntity> topoEntities=topoService.getAllTopos();
		// decrypter les mots de passe des userEntities
		
		model.addAttribute("topos", topoEntities);
		return "listetopos";
	}
	
	@GetMapping(value="/creationTopo")
	public String afficherCreationTopo(ModelMap model, HttpSession httpSession) {
		if (httpSession.getAttribute("userConnection")!=null) {
			TreeSet<SpotEntity> spotEntities =(TreeSet<SpotEntity>) spotService.getAllSpot();			
			//List<String> nomSpots=spotService.getAllNom();
			//model.addAttribute("nomSpots", nomSpots);
			model.addAttribute("spots",spotEntities);
			return "creationtopo";
		}else {
			//retour au formulaire de connection si l'utilisateu n'est pas connecté
			return "redirect:/connectionutilisateur";
		}
	}
		
	@PostMapping(value="/creationTopo")
	public String creerTopo(ModelMap model,@ModelAttribute ("formulaireTopoCreation")FormulaireEntity formulaire, HttpSession httpSession) {
		TopoEntity topoEntity= new TopoEntity();

		UserEntity userEntity=(UserEntity) httpSession.getAttribute("userConnection");
		userEntity=userService.getUserByIdentifiantAndPassword(userEntity);
		topoEntity.setUserEntity(userEntity);
		
		topoEntity.setNom(formulaire.getNom());
		topoEntity.setDescription(formulaire.getDescription());
	
		topoEntity.setSpotEntities(spotService.getSpotsById(formulaire.getId()));
		
		topoEntity.setDateParution(new Date());
		topoEntity.setDisponible(true);	
		
		topoEntity.setSpotEntities(topoEntity.getSpotEntities());
		
		topoService.sauvegarderTopo(topoEntity);
		model.addAttribute("topo",topoEntity);
		return "confirmationcreationtopo";	
	}
	
	@GetMapping(value="/detailtopo")
	public String afficherDetailTopo(ModelMap model, @RequestParam("idTopo") String idTopo) {
		TopoEntity topoEntity=topoService.getTopoById(new Long(idTopo));
		model.addAttribute("topo",topoEntity);
		return "detailtopo";
	}
	
	@PostMapping(value="/detailtopo")
	public String afficherTopoModifie(ModelMap model,@ModelAttribute("topoModification")TopoEntity topo) {
		TopoEntity topoEntity=topoService.getTopoById(new Long(topo.getId()));	
			//Passage des réservations en close
			if(topo.getDisponible()) {
				List<ReservationEntity> reservationEntities=reservationService.getReservationByTopo(topoEntity.getId());
				for (ReservationEntity reservationEntity : reservationEntities) {
					if(reservationEntity.getStatutReservation().contentEquals("reserve")) {
						reservationEntity.setStatutReservation("close");
						reservationService.sauvegarderReservation(reservationEntity);
					}
				}
			}
			//sauvegarde du topo avec la nouvelle disponibilité
			topoEntity.setDisponible(topo.getDisponible()); 
			topoService.sauvegarderTopo(topoEntity);
			model.addAttribute("topo",topoEntity);
			return "detailtopo";
	}
	
	
}
