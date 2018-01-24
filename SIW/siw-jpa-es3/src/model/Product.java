package model;

import java.util.*;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.ManyToMany;
import javax.persistence.NamedQuery;
import javax.persistence.Column;

@Entity
@NamedQuery(name = "findAllProducts", query = "SELECT p FROM Product p")
public class Product {
	
	@Id
	@GeneratedValue(strategy = GenerationType.AUTO)
	private Long id;
	
	@Column(nullable = false,unique = true)
	private String name;
	@Column(length=2000)
	private String description;
	
	@Column(nullable = false)
	private Float price;
	
	@ManyToMany(mappedBy = "productsList")
	private List<Provider> providersList;

	/* Getter and Setter */

	public String getName() {
		return name;
	}
	
	public void setName(String name) {
		this.name = name;
	}
	
	public String getDescription() {
		return description;
	}
	
	public void setDescription(String description) {
		this.description = description;
	}
	
	public Float getPrice() {
		return price;
	}
	
	public void setPrice(Float price) {
		this.price = price;
	}
	
	public List<Provider> getProvidersList() {
		return providersList;
	}
	
	public void setProvidersList(List<Provider> providersList) {
		this.providersList = providersList;
	}
	
	public Long getId() {
		return id;
	}
}
