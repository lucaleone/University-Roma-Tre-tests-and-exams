package Model;


import javax.persistence.*;
import Exceptions.NotNullableFieldException;

@Entity
public class Attivita {
	
	@Id
	@GeneratedValue(strategy = GenerationType.AUTO)
	private Long id;

	@Column(nullable = false)
	private String titolo;
	
	@Column(length = 10000, nullable = false)
	private String testo;
	
	@Column(nullable = true, length = 600)
	private String url;
	
	@Column(nullable = true, length = 600)
	private String urlImg;
	
	@Column(nullable = true, length = 600)
	private String urlVideo;
	
//	@Column(nullable = true)
//	@Temporal(TemporalType.TIMESTAMP)
//	private Date dataCreazione;
	
	@ManyToOne(cascade = {CascadeType.ALL}, fetch= FetchType.EAGER)
	private Utente utente;	

	public Attivita(String titolo,String testo,Utente utente,String url,String urlImg,String urlVideo)
				throws NotNullableFieldException{
		this(titolo,testo,utente);
		this.url = url;
		this.urlImg = urlImg;
		this.urlVideo = urlVideo;
	}
	
	public Attivita(String titolo,String testo,Utente utente) throws NotNullableFieldException{
		this();
		if(titolo.isEmpty() || testo.isEmpty())
			throw new NotNullableFieldException();
		this.titolo = titolo;
		this.testo = testo;
		this.utente = utente;
		utente.addAttivita(this);
	}
	
	private Attivita(){
		//this.dataCreazione = Calendar.getInstance().getTime();
	}
	
	public Long getId() {
		return id;
	}

	public String getUrl() {
		return url;
	}

	public void setUrl(String url) {
		this.url = url;
	}

	public String getUrlImg() {
		return urlImg;
	}

	public void setUrlImg(String urlImg) {
		this.urlImg = urlImg;
	}

	public String getUrlVideo() {
		return urlVideo;
	}

	public void setUrlVideo(String urlVideo) {
		this.urlVideo = urlVideo;
	}

	public String getTitolo() {
		return titolo;
	}

	public String getTesto() {
		return testo;
	}

	public Utente getUtente() {
		return utente;
	}

	@Override
	public int hashCode() {
		final int prime = 31;
		int result = 1;
		result = prime * result + ((id == null) ? 0 : id.hashCode());
		result = prime * result + ((testo == null) ? 0 : testo.hashCode());
		result = prime * result + ((titolo == null) ? 0 : titolo.hashCode());
		result = prime * result + ((url == null) ? 0 : url.hashCode());
		result = prime * result + ((urlImg == null) ? 0 : urlImg.hashCode());
		result = prime * result
				+ ((urlVideo == null) ? 0 : urlVideo.hashCode());
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
		Attivita other = (Attivita) obj;
		if (id == null) {
			if (other.id != null)
				return false;
		} else if (!id.equals(other.id))
			return false;
		if (testo == null) {
			if (other.testo != null)
				return false;
		} else if (!testo.equals(other.testo))
			return false;
		if (titolo == null) {
			if (other.titolo != null)
				return false;
		} else if (!titolo.equals(other.titolo))
			return false;
		if (url == null) {
			if (other.url != null)
				return false;
		} else if (!url.equals(other.url))
			return false;
		if (urlImg == null) {
			if (other.urlImg != null)
				return false;
		} else if (!urlImg.equals(other.urlImg))
			return false;
		if (urlVideo == null) {
			if (other.urlVideo != null)
				return false;
		} else if (!urlVideo.equals(other.urlVideo))
			return false;
		return true;
	}
}
