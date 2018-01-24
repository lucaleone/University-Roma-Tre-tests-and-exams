package Model;

import javax.persistence.Column;
import javax.persistence.Entity;

import Exceptions.NotNullableFieldException;

@Entity
public class Startup extends Utente {

	@Column(nullable = true,length = 10000)
	private String descrizione;
	
	@Column(nullable = true, length = 1000)
	private String descrizioneBreve;
	
	@Column(nullable = true)
	private String dataCreazione;
	
	@Column(nullable = true)
	private String motto;

	public Startup(String nome, String email, String password,
			String descrizioneBreve, String descrizione, String avatar,
			String motto, String sitoWeb, String facebook, String twitter,
			String linkedIn) throws NotNullableFieldException {
		super(nome, email, password, avatar, sitoWeb, facebook, twitter,
				linkedIn);
		this.descrizione = descrizione;
		this.descrizioneBreve = descrizioneBreve;
		this.motto = motto;
	}

	public Startup() {
	}

	public Startup(String nome, String email, String password)
			throws NotNullableFieldException {
		super(nome, email, password);
	}

	public String getDataCreazione() {
		return dataCreazione;
	}

	public void setDataCreazione(String dataCreazione) {
		this.dataCreazione = dataCreazione;
	}

	public String getDescrizione() {
		return descrizione;
	}

	public void setDescrizione(String descrizione) {
		this.descrizione = descrizione;
	}

	public String getDescrizioneBreve() {
		return descrizioneBreve;
	}

	public void setDescrizioneBreve(String descrizioneBreve) {
		this.descrizioneBreve = descrizioneBreve;
	}

	public String getMotto() {
		return motto;
	}

	public void setMotto(String motto) {
		this.motto = motto;
	}

	@Override
	public int hashCode() {
		final int prime = 31;
		int result = super.hashCode();
		result = prime * result
				+ ((dataCreazione == null) ? 0 : dataCreazione.hashCode());
		result = prime * result
				+ ((descrizione == null) ? 0 : descrizione.hashCode());
		result = prime
				* result
				+ ((descrizioneBreve == null) ? 0 : descrizioneBreve.hashCode());
		result = prime * result + ((motto == null) ? 0 : motto.hashCode());
		return result;
	}

	@Override
	public boolean equals(Object obj) {
		if (this == obj)
			return true;
		if (!super.equals(obj))
			return false;
		if (getClass() != obj.getClass())
			return false;
		Startup other = (Startup) obj;
		if (dataCreazione == null) {
			if (other.dataCreazione != null)
				return false;
		} else if (!dataCreazione.equals(other.dataCreazione))
			return false;
		if (descrizione == null) {
			if (other.descrizione != null)
				return false;
		} else if (!descrizione.equals(other.descrizione))
			return false;
		if (descrizioneBreve == null) {
			if (other.descrizioneBreve != null)
				return false;
		} else if (!descrizioneBreve.equals(other.descrizioneBreve))
			return false;
		if (motto == null) {
			if (other.motto != null)
				return false;
		} else if (!motto.equals(other.motto))
			return false;
		return true;
	}
}
