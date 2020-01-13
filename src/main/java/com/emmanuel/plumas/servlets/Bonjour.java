package com.emmanuel.plumas.servlets;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;


import com.emmanuel.plumas.business.UserEntityService;
import com.emmanuel.plumas.models.UserEntity;

/**
 * Servlet implementation class Bonjour
 */
@Controller
public class Bonjour extends HttpServlet {
	private static final long serialVersionUID = 1L;
     
	@Autowired
	@Qualifier("UserEntityService")
	private UserEntityService u;
    /**
     * @see HttpServlet#HttpServlet()
     */
    public Bonjour() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		
		//ClassPathXmlApplicationContext appContext= new ClassPathXmlApplicationContext("applicationContext.xml"); 	
		//UserEntityService userEntityService = (UserEntityService) appContext.getBean("userEntityService");
		
		UserEntity nom=u.getUser((long) 1);

		request.setAttribute("nom",nom);

		//Ligne d'appel de la jsp accueil qui se trouve dans WEB-INF
		this.getServletContext().getRequestDispatcher("/WEB-INF/bonjour.jsp").forward(request,response);
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
