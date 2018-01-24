package model;

import java.util.Date;
import java.util.List;

import javax.persistence.*;
public class Main {

	public static void main(String[] args) {
		/*
		EntityManagerFactory emf = Persistence.createEntityManagerFactory("model-unit");
		EntityManager em = emf.createEntityManager();
		Customer c = new Customer();
		Address a = new Address();
		a.setCity("Albano");
		a.setCountry("Lazio");
		a.setState("Italy");
		a.setStreet("Via del cancro");
		a.setZipCode("HS");
		c.setFirstName("Emanuele");
		c.setLastName("Grassi");
		c.setDateOfBirth(new Date(19999));
		c.setEmail("Ema.grassi@stup.copypasterino.hs");
		c.setPhoneNumber("PagineGialle");
		c.setRegistrationDate(new Date(471364796));
		EntityTransaction tx = em.getTransaction();
		tx.begin();
		em.persist(c);
		c.setAddres(a);
		tx.commit();
		em.close();
		emf.close();
		*/
		//CustomerFacade.addCusotmer("Luca","leone","@Luc","boh",new Date(135478578), new Date(97336764),"@Leon","Roma","Italy","824c21","Lazio");
//		List<Customer> tmp= CustomerFacade.GetAllCusotmer();		
//		for(Customer c : tmp)
//			System.out.println(c.toString());
		//CustomerFacade.addOrder(201);
		System.out.println(CustomerFacade.GetAllOrders(201).toString());		
	}
}
