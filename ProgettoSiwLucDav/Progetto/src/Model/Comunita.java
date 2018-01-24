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
import javax.persistence.JoinColumn;
import javax.persistence.NamedQueries;
import javax.persistence.NamedQuery;
import javax.persistence.OneToMany;

import Exceptions.*;

@Entity
@NamedQueries(value = {
		@NamedQuery(name = "findAllUtenti", query = "SELECT u FROM Utente u"),
		@NamedQuery(name = "findAllAttivita", query = "SELECT a FROM Attivita a") })
public class Comunita {

	@Id
	@GeneratedValue(strategy = GenerationType.AUTO)
	private Long id;
	@Column
	private String nome;

	@OneToMany(cascade = { CascadeType.ALL }, fetch= FetchType.EAGER)
	@JoinColumn(name = "comunita_id")
	private List<Utente> utenti;

	@OneToMany(cascade = { CascadeType.ALL }, fetch= FetchType.EAGER)
	@JoinColumn(name = "comunita_id")
	private List<Attivita> attivita;

	public Comunita() {
		this.utenti = new ArrayList<Utente>();
	}

	private Utente UtenteByEmail(String email) {
		Utente res = null;
		for (Utente u : this.utenti)
			if (u.getEmail().equalsIgnoreCase(email)) {
				res = u;
				break;
			}
		return res;
	}

	public Utente GetUser(String email) throws UtenteNonEsistenteException {
		Utente res = UtenteByEmail(email);
		if (res == null)
			throw new UtenteNonEsistenteException();
		return res;
	}

	public void aggiungiUtente(Utente nuovoUtente)
			throws UtenteGiaEsistenteException {
		if(this.utenti==null)
			this.utenti = new ArrayList<Utente>();
		if (UtenteByEmail(nuovoUtente.getEmail()) != null)
			throw new UtenteGiaEsistenteException();
		else
			this.utenti.add(nuovoUtente);
	}

	public void addAttivita(Attivita a) {
		if (this.attivita == null)
			this.attivita = new ArrayList<Attivita>();
		this.attivita.add(a);
	}

	public List<Attivita> getAttivita() {
		return attivita;
	}

	public List<Membro> getMembri() {
		List<Membro> membri = new ArrayList<Membro>();
		for (Utente m : utenti) {
			if (m instanceof Membro)
				membri.add((Membro) m);
		}
		return membri;
	}

	public List<Startup> getStartups() {
		List<Startup> startups = new ArrayList<Startup>();
		for (Utente s : utenti) {
			if (s instanceof Startup)
				startups.add((Startup) s);
		}
		return startups;
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

	@Override
	public int hashCode() {
		final int prime = 31;
		int result = 1;
		result = prime * result + ((id == null) ? 0 : id.hashCode());
		result = prime * result + ((nome == null) ? 0 : nome.hashCode());
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
		Comunita other = (Comunita) obj;
		if (id == null) {
			if (other.id != null)
				return false;
		} else if (!id.equals(other.id))
			return false;
		if (nome == null) {
			if (other.nome != null)
				return false;
		} else if (!nome.equals(other.nome))
			return false;
		return true;
	}
}
