package model;


import java.util.*;

import javax.persistence.*;

@Entity
@NamedQuery(name = "findAllProducts", query = "SELECT p FROM Product p")
public class Comunita {

	public Comunita() {
	}

	public Comunita(String nome) {
		this.nome = nome;
	}

	@Id
	@GeneratedValue(strategy = GenerationType.AUTO)
	private Long id;
	@Column
	private String nome;
	@OneToMany(cascade = {CascadeType.ALL})
	@JoinColumn(name = "comunita_id")
	List<Product> prodotti;
	
//	@OneToOne(cascade = {CascadeType.ALL})
//	@JoinColumn(name = "comunita_prodotto")
//	Product prodotto;

	public List<Product> getProdotti() {
		if(prodotti==null)
			prodotti = new ArrayList<Product>();
		return prodotti;
	}
	public void setProdotti(List<Product> prodotti) {
		this.prodotti = prodotti;
	}

	public String getNome() {
		return nome;
	}

	public void setNome(String nome) {
		this.nome = nome;
	}

	public Long getId() {
		return id;
	}

	public void setId(Long id) {
		this.id = id;
	}

//	public Product getProdotto() {
//		return prodotto;
//	}
//
//	public void setProdotto(Product prodotto) {
//		this.prodotto = prodotto;
//	}
}
