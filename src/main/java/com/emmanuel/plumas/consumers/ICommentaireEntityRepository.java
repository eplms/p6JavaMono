package com.emmanuel.plumas.consumers;

import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.data.repository.CrudRepository;
import org.springframework.stereotype.Repository;

import com.emmanuel.plumas.models.CommentaireEntity;

@Repository
@Qualifier("ICommentaireEntityRepository")
public interface ICommentaireEntityRepository extends CrudRepository <CommentaireEntity, Long>{

}
