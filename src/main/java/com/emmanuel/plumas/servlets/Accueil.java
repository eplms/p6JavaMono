package com.emmanuel.plumas.servlets;

import java.io.IOException;

import javax.persistence.EntityManager;
import javax.persistence.EntityManagerFactory;
import javax.persistence.Persistence;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.emmanuel.plumas.models.UserEntity;

/**
 * Servlet implementation class Accueil
 */
public class Accueil extends HttpServlet {
	private static final long serialVersionUID = 1L;


    public Accueil() {
        // TODO Auto-generated constructor stub
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		//response.getWriter().append("Served at: ").append(request.getContextPath());
		
		EntityManagerFactory emf= Persistence.createEntityManagerFactory("WeClimbDB");
		EntityManager em=emf.createEntityManager();
		UserEntity u=em.find(UserEntity.class,(long) 1);
		
		//String name= u.getIdentifiant();
		request.setAttribute("utilisateur",u);

		
		//Ligne d'appel de la jsp accueil qui se trouve dans WEB-INF
		this.getServletContext().getRequestDispatcher("/WEB-INF/accueil.jsp").forward(request,response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
