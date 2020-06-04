package com.emmanuel.plumas.business;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;

import com.emmanuel.plumas.consumers.ICommentaireEntityRepository;
import com.emmanuel.plumas.models.CommentaireEntity;

@Service
@Qualifier("CommentaireEntityService")
public class CommentaireEntityService {

	@Autowired
	@Qualifier("ICommentaireEntityRepository")
	private  ICommentaireEntityRepository commentaireRepository;

	public void supprimerCommentaire(Long idCommentaire) {
		commentaireRepository.deleteById(idCommentaire);
	}

	public void sauvegarderCommentaire(CommentaireEntity commentaireEntity) {
		commentaireRepository.save(commentaireEntity);
	}

	public CommentaireEntity recupererCommentaire(Long idCommentaire) {
		return commentaireRepository.findById(idCommentaire).get();
	}
	
}
