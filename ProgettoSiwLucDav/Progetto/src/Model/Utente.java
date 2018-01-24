package Model;

import java.util.ArrayList;
import java.util.List;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.OneToMany;

import Exceptions.*;


@Entity
public abstract class Utente {

	@Id
	@GeneratedValue(strategy = GenerationType.AUTO)
	private Long id;
	
	@Column(nullable = false,unique = true)
	private String email;
	
	@Column(nullable = false)
	private String password;
	
	@Column(nullable = true)
	private String avatar;
	
	@Column(nullable = false,unique = true)
	private String nome;
	
	@Column(nullable = true)
	private String sitoWeb;
	
	@Column(nullable = true)
	private String facebook;
	
	@Column(nullable = true)
	private String linkedIn;
	
	@Column(nullable = true)
	private String twitter;
	
	@OneToMany(mappedBy="utente", cascade = {CascadeType.ALL},  fetch= FetchType.EAGER)
	private List<Attivita> attivita;
	@OneToMany(cascade = {CascadeType.ALL},  fetch= FetchType.EAGER)
	private List<Startup> startupsFollowing;

	public Utente(String nome, String email, String password, String avatar,
			String sitoWeb, String facebook, String twitter, String linkedIn)
			throws NotNullableFieldException {
		this(nome, email, password);
		this.avatar = avatar;
		this.sitoWeb = sitoWeb;
		this.facebook = facebook;
		this.linkedIn = linkedIn;
		this.twitter = twitter;

	}

	public Utente(String nome, String email, String password)
			throws NotNullableFieldException {
		if (nome.isEmpty() || email.isEmpty() || password.isEmpty())
			throw new NotNullableFieldException();
		this.nome = nome;
		this.email = email;
		this.password = password;
	}

	public void checkPassword(String password)
			throws PasswordNonValidaException {
		if (!this.password.equals(password)) {
			throw new PasswordNonValidaException();
		}
	}

	public Utente() {
	}

	public void addAttivita(Attivita a) {
		if (this.attivita == null)
			this.attivita = new ArrayList<Attivita>();
		this.attivita.add(a);
	}

	public List<Attivita> getAttivita() {
		if (this.attivita == null)
			this.attivita = new ArrayList<Attivita>();
		return attivita;
	}
	
	public void addStartup(Startup s) {
		if (this.startupsFollowing == null)
			this.startupsFollowing = new ArrayList<Startup>();
		this.startupsFollowing.add(s);
	}
	
	public List<Startup> getStartupsFollowing() {
		if (this.startupsFollowing == null)
			this.startupsFollowing = new ArrayList<Startup>();
		return startupsFollowing;
	}
	
	public Long getId() {
		return id;
	}
	
	public String getNome() {
		return nome;
	}

	public String getFacebook() {
		return facebook;
	}

	public void setFacebook(String facebook) {
		this.facebook = facebook;
	}

	public String getSitoWeb() {
		return sitoWeb;
	}

	public void setSitoWeb(String sitoWeb) {
		this.sitoWeb = sitoWeb;
	}

	public String getLinkedIn() {
		return linkedIn;
	}

	public void setLinkedIn(String linkedIn) {
		this.linkedIn = linkedIn;
	}

	public String getPassword() {
		return password;
	}

	public String getTwitter() {
		return twitter;
	}

	public void setTwitter(String twitter) {
		this.twitter = twitter;
	}

	public String getEmail() {
		return email;
	}

	public String getAvatar() {
		return avatar;
	}

	public void setAvatar(String avatar) {
		this.avatar = avatar;
	}

	@Override
	public int hashCode() {
		final int prime = 31;
		int result = 1;
		result = prime * result + ((avatar == null) ? 0 : avatar.hashCode());
		result = prime * result + ((email == null) ? 0 : email.hashCode());
		result = prime * result
				+ ((facebook == null) ? 0 : facebook.hashCode());
		result = prime * result + ((id == null) ? 0 : id.hashCode());
		result = prime * result
				+ ((linkedIn == null) ? 0 : linkedIn.hashCode());
		result = prime * result + ((nome == null) ? 0 : nome.hashCode());
		result = prime * result
				+ ((password == null) ? 0 : password.hashCode());
		result = prime * result + ((sitoWeb == null) ? 0 : sitoWeb.hashCode());
		result = prime * result + ((twitter == null) ? 0 : twitter.hashCode());
		return result;
	}

	@Override
	public boolean equals(Object obj) {
		if (this == obj)
			return true;
		if (obj == null)
			return false;
		if (getClass() != obj.getClass())
			return false;
		Utente other = (Utente) obj;
		if (avatar == null) {
			if (other.avatar != null)
				return false;
		} else if (!avatar.equals(other.avatar))
			return false;
		if (email == null) {
			if (other.email != null)
				return false;
		} else if (!email.equals(other.email))
			return false;
		if (facebook == null) {
			if (other.facebook != null)
				return false;
		} else if (!facebook.equals(other.facebook))
			return false;
		if (id == null) {
			if (other.id != null)
				return false;
		} else if (!id.equals(other.id))
			return false;
		if (linkedIn == null) {
			if (other.linkedIn != null)
				return false;
		} else if (!linkedIn.equals(other.linkedIn))
			return false;
		if (nome == null) {
			if (other.nome != null)
				return false;
		} else if (!nome.equals(other.nome))
			return false;
		if (password == null) {
			if (other.password != null)
				return false;
		} else if (!password.equals(other.password))
			return false;
		if (sitoWeb == null) {
			if (other.sitoWeb != null)
				return false;
		} else if (!sitoWeb.equals(other.sitoWeb))
			return false;
		if (twitter == null) {
			if (other.twitter != null)
				return false;
		} else if (!twitter.equals(other.twitter))
			return false;
		return true;
	}

}
