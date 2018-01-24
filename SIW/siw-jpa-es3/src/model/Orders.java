package model;
import java.util.Date;
import java.util.List;

import javax.persistence.*;

@Entity
@Table(name = "orders")
public class Orders {
	
	public Orders(Date creationTime, Customer customer,
			List<OrderLine> orderLines) {		
		this.creationTime = creationTime;
		this.customer = customer;
		this.orderLines = orderLines;
	}
	public Orders()
	{}
	@Id
	@GeneratedValue(strategy = GenerationType.AUTO)
	private Long id;
	
	@Column(nullable = false)
	@Temporal(TemporalType.TIMESTAMP)
	private Date creationTime;
	
	//molti ordini hanno un customer
	@ManyToOne
	private Customer customer;

	@OneToMany(cascade={CascadeType.REMOVE})
	@JoinColumn(name = "orders_id")
	private List<OrderLine> orderLines;

	public Date getCreationTime() {
		return creationTime;
	}

	public void setCreationTime(Date creationTime) {
		this.creationTime = creationTime;
	}

	public Customer getCustomer() {
		return customer;
	}

	public void setCustomer(Customer customer) {
		this.customer = customer;
	}

	public List<OrderLine> getOrderLines() {
		return orderLines;
	}

	public void setOrderLines(List<OrderLine> orderLines) {
		this.orderLines = orderLines;
	}

	public Long getId() {
		return id;
	}
	@Override
	public String toString() {
		return "Orders [id=" + id + ", creationTime=" + creationTime + ", customer=[" + 
	customer.getId()+","+customer.getFirstName()+ "] ]";
	}
	
}
