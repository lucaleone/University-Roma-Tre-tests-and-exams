package model;

import java.util.*;

import javax.persistence.EntityManager;
import javax.persistence.EntityManagerFactory;
import javax.persistence.EntityTransaction;
import javax.persistence.Persistence;
import javax.persistence.Query;

public class CustomerFacade {
	public static void addCusotmer(String firstName, String lastName, String email,
			String phoneNumber, Date dateOfBirth, Date registrationDate, String street,
			String city,String state,String zipCode,String country) {
		EntityManagerFactory ef = Persistence.createEntityManagerFactory("model-unit");
		EntityManager em = ef.createEntityManager();
		Address a = new Address(street,city,state,zipCode,country);
		Customer c = new Customer(firstName,lastName,email,phoneNumber,dateOfBirth,registrationDate,a);
		EntityTransaction tx = em.getTransaction();
		tx.begin();
		em.persist(c);
		tx.commit();
		em.close();
		ef.close();
	}
	public static boolean addOrder(long CustomerId)
	{
		EntityManagerFactory ef = Persistence.createEntityManagerFactory("model-unit");
		EntityManager em = ef.createEntityManager();
		Customer currentCustomer = em.find(Customer.class, 201);
		if(currentCustomer!=null)
		{
			Orders tmp = new Orders(new Date(946699),currentCustomer, null );
			if(currentCustomer.getListOrder()==null)
				currentCustomer.setListOrder(new ArrayList<Orders>());
			currentCustomer.getListOrder().add(tmp);
			EntityTransaction tx = em.getTransaction();
			tx.begin();
			em.persist(currentCustomer);
			em.persist(tmp);
			tx.commit();
			em.close();
			ef.close();
			return true;
		}
		else 
		{
			em.close();
			ef.close(); 
			return false;
		}
	}
	
	public static List<Customer> GetAllCusotmers()
	{
		EntityManagerFactory ef = Persistence.createEntityManagerFactory("model-unit");
		EntityManager em = ef.createEntityManager();
		Query query = em.createNamedQuery("findAllCustomer");
		em.close();
		ef.close();
		return  query.getResultList();
	}
	
	public static List<Orders> GetAllOrders(long CustomerId)
	{
		EntityManagerFactory ef = Persistence.createEntityManagerFactory("model-unit");
		EntityManager em = ef.createEntityManager();
		Query query = em.createQuery(
				"SELECT o FROM Customer c, Orders o WHERE c.id=o.customer.id AND c.id="+CustomerId);
		return  query.getResultList();
	}
}
