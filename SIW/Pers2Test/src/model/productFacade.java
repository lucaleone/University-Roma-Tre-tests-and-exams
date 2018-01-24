package model;

import java.util.List;

import javax.ejb.Stateless;
import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import javax.persistence.Query;

@Stateless(name = "pFacade")
public class productFacade {
	@PersistenceContext(unitName = "testPersLuca")
	private EntityManager em;

	public void createProds() {
		ProdMare pm1 = new ProdMare("mare1", "20e", 30);
		ProdMare pm2 = new ProdMare("mare2", "7e", 7);
		ProdMare pm3 = new ProdMare("mare3", "32e", 50);
		ProdMontagna pmont1 = new ProdMontagna("mont1", "84s", 850);
		ProdMontagna pmont2 = new ProdMontagna("mont2", "150e", 5000);
		
		Product p1 = new Product("p1", "2000e");
		Product p2 = new Product("p2", "700e");
		Comunita c = new Comunita("testtttt");
//		c.setProdotto(p1);
//		c.getProdotti().add(p1);
//		c.getProdotti().add(p2);
		
		c.getProdotti().add(pm1);
		c.getProdotti().add(pm2);
		c.getProdotti().add(pm3);
		c.getProdotti().add(pmont1);
		c.getProdotti().add(pmont2);		
		em.persist(c);
	}
	public List<Product> getAll()
	{
		Query q = em.createNamedQuery("findAllProducts");
		return q.getResultList();
	}
}
