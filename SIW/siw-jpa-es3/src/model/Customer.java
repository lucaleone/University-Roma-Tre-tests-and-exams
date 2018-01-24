package model;

import java.util.*;

import javax.persistence.*;

@Entity
@Table(uniqueConstraints=@UniqueConstraint(columnNames={"firstname","lastname"}))
@NamedQuery(name = "findAllCustomer", query = "SELECT c FROM Customer c")
public class Customer {
	
	@Id
	@GeneratedValue(strategy = GenerationType.AUTO)
	private Long id;
	
	@Column(nullable = false)
	private String firstName;
	
	@Column(nullable = false)
	private String lastName;
	
	@Column(nullable = false,unique = true)
	private String email;
	
	@Column(nullable = false,unique = true)
	private String phoneNumber;
	
	@Column(nullable = false)
	@Temporal(TemporalType.DATE)
	private Date dateOfBirth;
	
	@Column(nullable = false)
	@Temporal(TemporalType.TIMESTAMP)
	private Date registrationDate;
	
	@OneToMany(mappedBy="customer",cascade = {CascadeType.REMOVE})
	@OrderBy("creationTime asc")
	private List<Orders> listOrder;
	
	@OneToOne(cascade = {CascadeType.PERSIST,CascadeType.REMOVE})
	@JoinColumn(name = "customer_address")
	private Address addres;

	public Customer(String firstName, String lastName, String email,
			String phoneNumber, Date dateOfBirth, Date registrationDate,
			Address addres) {
		this.firstName = firstName;
		this.lastName = lastName;
		this.email = email;
		this.phoneNumber = phoneNumber;
		this.dateOfBirth = dateOfBirth;
		this.registrationDate = registrationDate;
		this.addres = addres;
	}
	
	public Customer(){}

	public String getFirstName() {
		return firstName;
	}

	public void setFirstName(String firstName) {
		this.firstName = firstName;
	}

	public String getLastName() {
		return lastName;
	}

	public void setLastName(String lastName) {
		this.lastName = lastName;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getPhoneNumber() {
		return phoneNumber;
	}

	public void setPhoneNumber(String phoneNumber) {
		this.phoneNumber = phoneNumber;
	}

	public Date getDateOfBirth() {
		return dateOfBirth;
	}

	public void setDateOfBirth(Date dateOfBirth) {
		this.dateOfBirth = dateOfBirth;
	}

	public Date getRegistrationDate() {
		return registrationDate;
	}

	public void setRegistrationDate(Date registrationDate) {
		this.registrationDate = registrationDate;
	}

	public List<Orders> getListOrder() {
		return listOrder;
	}

	public void setListOrder(List<Orders> listOrder) {
		this.listOrder = listOrder;
	}

	public Long getId() {
		return id;
	}

	public Address getAddres() {
		return addres;
	}

	public void setAddres(Address addres) {
		this.addres = addres;
	}

	@Override
	public String toString() {
		return "Customer [id=" + id + ", firstName=" + firstName
				+ ", lastName=" + lastName + ", email=" + email
				+ ", phoneNumber=" + phoneNumber + ", dateOfBirth="
				+ dateOfBirth + ", registrationDate=" + registrationDate
				+ ", listOrder=" + listOrder + ", addres=" + addres + "]";
	}
}
