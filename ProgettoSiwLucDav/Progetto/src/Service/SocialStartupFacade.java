package Service;


import java.util.List;


import javax.ejb.Stateless;
import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import javax.persistence.Query;


import Exceptions.PasswordNonValidaException;
import Exceptions.UtenteGiaEsistenteException;
import Exceptions.UtenteNonEsistenteException;
import Model.*;
//importare il seguente quando si deve chiamare la facade
//@EJB(beanName="SocialStartupFacade")
//private SocialStartupFacade facade;


@Stateless(name = "SocialStartupFacade")
public class SocialStartupFacade {


	public SocialStartupFacade() {
	}


	@PersistenceContext(unitName = "StartupLucDav")
	private EntityManager em;


	// public static Comunita GetComunita() {
	// if (comunita == null) {
	// comunita = new Comunita();
	// SocialStartupFacade.CreaDatiFinti(comunita);
	// }
	// return comunita;
	// }


	// viene chiamato solo la prima volta dagli amministratori di sistema
	public void initSocialStartup() {
		Comunita c = new Comunita();
		c.setNome("SocialStartupComunita");
		CreaDatiFinti(c);
		em.persist(c);		
	}


	public Comunita GetComunita() {
		Query q = em.createQuery("SELECT c FROM Comunita c");
		return  (Comunita) q.getSingleResult();
	}


	public Utente GetUser(String email) throws UtenteNonEsistenteException {
		Comunita c = em.find(Comunita.class, 1);
		Utente u = c.GetUser(email);
		return u;
	}


	public Utente GetUser(String email, String password)
			throws PasswordNonValidaException, UtenteNonEsistenteException {
		Comunita c = em.find(Comunita.class, 1);
		Utente u = c.GetUser(email);
		u.checkPassword(password);
		return u;
	}
	
	@SuppressWarnings("unchecked")
	public List<Attivita> GetTop90Attivita()
	{
		//Query q = em.createQuery("LIMIT 90 SELECT a FROM Attivita a");
		Query q = em.createQuery("SELECT a FROM Attivita a");
		return (List<Attivita>)q.getResultList();
	}
	
	@SuppressWarnings("unchecked")
	public List<Attivita> GetAllAttivtaUtente(String emailUtente)
	{
		Query q = em.createQuery("SELECT a FROM Attivita a, Utente u WHERE a.utente==u.id && u.email=="+emailUtente);
		return (List<Attivita>)q.getResultList();
	}
	public void aggiungiUtente(Utente nuovoUtente)
			throws UtenteGiaEsistenteException {
		Comunita c = GetComunita();
		c.aggiungiUtente(nuovoUtente);
		 em.persist(nuovoUtente);
		 em.merge(c);
	}


	public void aggiungiAttivita(Attivita attivita, Utente utente) {
		Comunita c = GetComunita();
		c.addAttivita(attivita);


		em.persist(attivita);
		em.merge(c);
		em.merge(utente);
	}


	public void aggiungiFollowingMembro(Utente u, String emailMembroDaSeguire) {
		try {
			Membro m = (Membro) u;
			m.addMembroAmico((Membro) GetUser(emailMembroDaSeguire));
			em.merge(u);
		} catch (Exception e) {
		}
	}


	public void aggiungiFollowingStartup(Utente u, String emailStartupDaSeguire) {
		try {
			u.addStartup((Startup) GetUser(emailStartupDaSeguire));
			em.merge(u);
		} catch (Exception e) {
		}
	}


	public void modificaMembro(Membro m, String avatar, String biografia,
			String annoDiNascita, String sitoWeb, String facebook,
			String twitter, String linkedIn) {
		m.setAvatar(avatar);
		m.setBiografia(biografia);
		m.setFacebook(facebook);
		m.setLinkedIn(linkedIn);
		m.setSitoWeb(sitoWeb);
		m.setTwitter(twitter);
		m.setAnnoDiNascita(annoDiNascita);
		em.merge(m);
	}


	public void modificaStartup(Startup s, String dataCreazione,
			String descrizioneBreve, String descrizione, String avatar,
			String motto, String sitoWeb, String facebook, String twitter,
			String linkedIn) {
		s.setAvatar(avatar);
		s.setDataCreazione(dataCreazione);
		s.setDescrizione(descrizione);
		s.setDescrizioneBreve(descrizioneBreve);
		s.setMotto(motto);
		s.setSitoWeb(sitoWeb);
		s.setFacebook(facebook);
		s.setTwitter(twitter);
		s.setLinkedIn(linkedIn);
		em.merge(s);
	}


	private void CreaDatiFinti(Comunita com) {
		try {
			Startup Nokia = new Startup(
					"Nokia",
					"Nokia@networks.com",
					"Nokia",
					"Nokia | Networks & Technologies",
					"Nokia has a long history of successful change and innovation, adapting to shifts in markets and technologies.",
					"http://www.telefonino.net/new_files/images/global/Nokia-sede_58246_1.jpg",
					"Connecting People", "http://company.nokia.com/en",
					"https://www.facebook.com/nokia", "https://twitter.com/nokia", "https://it.linkedin.com/company/nokia");


			Startup Apple = new Startup(
					"Apple",
					"Apple@networks.com",
					"Apple",
					"Apple Inc.",
					"Apple Inc. is an American multinational technology company headquartered in Cupertino, California, that designs, develops, and sells consumer electronics, computer software, online services, and personal computers. ",
					"https://upload.wikimedia.org/wikipedia/commons/b/b0/Apple_Headquarters_in_Cupertino.jpg",
					"Think different", "https://www.apple.com/",
					"https://www.facebook.com/pages/Apple-USA/406564306080086", "https://twitter.com/hashtag/apple","https://www.linkedin.com/company/apple");

			Startup Microsoft = new Startup(
					"Microsoft",
					"Microsoft@networks.com",
					"Microsoft",
					"Microsoft Corporation",
					"Microsoft Corporation(commonly known as Microsoft) is an American multinational technology company headquartered in Redmond, Washington, that develops, manufactures, licenses, supports and sells computer software, consumer electronics and personal computers and services.",
					"https://upload.wikimedia.org/wikipedia/commons/1/1a/Microsoft_building_17_front_door.jpg",
					"Empowering us all", "https://www.microsoft.com/it-it/default.aspx",
					"https://www.facebook.com/MicrosoftItalia?brand_redir=20528438720", "https://twitter.com/microsoft",
					"https://www.linkedin.com/company/microsoft");
			
			Startup Samsung = new Startup(
					"Samsung",
					"Samsung@networks.com",
					"Samsung",
					"Samsung Electronics",
					"Samsung is a South-Korean multinational conglomerate company headquartered in Samsung Town, Seoul.",
					"https://upload.wikimedia.org/wikipedia/commons/9/98/Ssbld002.jpg",
					"Inspire the World, Create the Future", "http://www.samsung.com/home",
					"https://www.facebook.com/SamsungMobileUSA", "https://twitter.com/samsungmobile",
					"https://www.linkedin.com/company/samsung-electronics");
			
			Membro fanMicrosoft = new Membro(
					"William",
					"Gates",
					"gatesWilliam@gmail.com",
					"gates1991",
					"http://www.wp7connect.com/wp-content/uploads/2012/06/wpstore1.jpg",
					"1991", "http://www.wp7connect.com/2012/06/09/microsoft-opens-windows-phone-gear-shop-for-fans/",
					"https://www.facebook.com/pages/Facebook-USA/125296484157657",
					"https://twitter.com/?lang=en-gb", "https://www.linkedin.com/nhome/");
			
			Membro fanApple = new Membro(
					"Jimmy",
					"Brian",
					"brianJimmy@gmail.com",
					"brian1971",
					"http://guerilla-photographer.smugmug.com/photos/361488549_PESEC-M.jpg",
					"1971", "http://www.cultofmac.com/",
					"https://www.facebook.com/pages/official-Apple-Fan-Page/178245638896058",
					"https://twitter.com/?lang=en-gb", "https://www.linkedin.com/nhome/");
			
			Membro fanSamsung = new Membro(
					"Alad",
					"Haddid",
					"haddidAlad@gmail.com",
					"haddidAlad",
					"http://ww1.prweb.com/prfiles/2011/01/08/643374/SamsungFanZoneEditedDSC1890.JPG",
					"1988", "https://www.facebook.com/SamsungFanPage",
					"https://www.facebook.com/SamsungFanPage",
					"https://twitter.com/?lang=en-gb", "https://www.linkedin.com/nhome/");
			
			Membro fanTecnologie = new Membro(
					"Patrik",
					"Eliot",
					"patrikEliot@hotmail.com",
					"technolove",
					"http://manolobig.com/wordpress/wp-content/uploads/2012/01/Microsoft-Pokes-Fun-At-Ridiculous-Smartphone-Habits-in-New-Ad_600_400-300x200.jpg",
					"1984 ", "http://n-e-r-d.com/",
					"https://www.facebook.com/pages/Facebook-USA/125296484157657", "https://twitter.com/?lang=en-gb", "https://www.linkedin.com/nhome/");
			
			fanApple.setBiografia("Hi All! My name is Jimmy Briand, I am 45 and I'm the best Apple fan in the world!I can't miss any Apple event in the world!");
			fanMicrosoft.setBiografia("Hello All! I'm William Gates ,nephew of the celebrated Bill. I was born in 1991 in Seattle Washington, and like my uncle I am passionate about the new technlogies!! Microsoft lifeStyle!!");
			fanTecnologie.setBiografia("Hiho All! I'm Patrik Eliot, I am born in New York in 1984. Since I was young I preferred to play videogames instead of playing with other guys. Technology one love!!");
			fanSamsung.setBiografia("Hello my name is Haddid Alad I was born in Pakistan in 1987 I really like smartphones and I am a big fun of Samsung technologies .");
			com.aggiungiUtente(Nokia);
			com.aggiungiUtente(Apple);
			com.aggiungiUtente(Microsoft);
			com.aggiungiUtente(Samsung);
			com.aggiungiUtente(fanTecnologie);
			com.aggiungiUtente(fanMicrosoft);
			com.aggiungiUtente(fanApple);
			com.aggiungiUtente(fanSamsung);
			
			Attivita microsoftCompraNokia = new Attivita("Microsoft finalizza l'acquisizione Nokia",
					"Oggi 25 mila dipendenti Nokia hanno ufficialmente un nuovo datore di lavoro: Microsoft.", Microsoft,
					"http://leganerd.com/2014/04/28/microsoft-finalizza-lacquisizione-nokia-nasce-microsoft-mobile/",
					"http://i1.wp.com/leganerd.com/wp-content/uploads/2014/04/msnokia_clk1.jpg?resize=591%2C409",
					"https://www.youtube.com/watch?v=XH91xAGPtsg");

			Attivita nokiaCelebra150 = new Attivita(
					"Nokia celebrates 150 years",
					"Nokia the movie Celebrating 150 years",
					Nokia,
					"http://company.nokia.com/en/about-us/our-company",
					"http://company.nokia.com/sites/default/files/frontpage/movie_2048x786.jpg",
					"https://www.youtube.com/watch?v=K4tUNTqN84Q");


			Attivita eventoAppleJune2015 = new Attivita(
					"Apple event June 2015",
					"Apple event June 2015",
					Apple,
					"https://www.apple.com/it/",
					"http://insideevs.com/wp-content/uploads/2015/02/apple-logo.png",
					"https://www.apple.com/it/environment/#environment-feature-film");


			Attivita newIpadMini3 = new Attivita(
					"New IpodMini3",
					"Apple presents the new Ipod Touch",
					Apple,
					"https://www.apple.com/ipad-mini-3/",
					"https://www.apple.com/ipad/",
					"https://www.apple.com/ipad/change-everything/");

			Attivita SamsungNuovoGalaxy = new Attivita(
					"Samsung lancia nuovo galaxy",
					"Samsung lancia nuovo galaxy", Samsung,
					"http://www.samsung.com/it/home",
					"http://www.samsung.com/it/galaxy/",
					"https://www.youtube.com/watch?v=jBDLOkWkqcE");			

			Attivita microsoftMilano = new Attivita(
					"Microsoft Build arriva a Milano: segui lo streaming live",
					"E' trascorso poco più di 1 mese da Build 2015, evento organizzato da Microsoft a San Francisco e incentrato sul mondo degli sviluppatori. Le molte novità presentate in quella cornice sono in queste settimane riproposte da Microsoft in forma itinerante, con appuntamenti organizzati in varie location.Quest'oggi è la volta di Milano, che per la prima volta ospita un evento di questa portata dedicato agli sviluppatori. Per tutti coloro che sono interessati alle conferenze di Build Milano ma non hanno potuto iscriversi per tempo Microsoft mette a disposizione uno streaming live, embeddato di seguito.",
					Microsoft,
					"http://www.hwupgrade.it/news/programmi/microsoft-build-arriva-a-milano-segui-lo-streaming-live_57601.html",
					"http://www.hwupgrade.it/immagini/build_milano.jpg",
					"https://www.youtube.com/watch?v=Cuvmh2Hhdhk");
			
			Attivita jimmyAi150Apple = new Attivita("Jimmy at AppleEvent june 2015",
					"hello guysss today I am at the best Apple event of June!!!@Apple ", fanApple,
					"https://www.apple.com/it/",
					"http://www.hwupgrade.it/immagini/build_milano.jpghttp://www.tmag.it/wp-content/uploads/2015/06/29d29ea892090b0299a57f0e5c8adcd73a93d5ae_xlarge.jpg",
					"https://www.apple.com/it/environment/#environment-feature-film");
			
			Attivita williamAt150Noklia = new Attivita("Willy at Nokia celebrates 150 years!",
					"hello guys !! today is 150!! happy Birthday @Nokia!! fantastic event!!", fanMicrosoft,
					"http://company.nokia.com/en/about-us/our-company",
					"http://company.nokia.com/sites/default/files/frontpage/movie_2048x786.jpg",
					"https://www.youtube.com/watch?v=K4tUNTqN84Q");
			
			Attivita williamAlMicrosoftMilan = new Attivita("Willy at Microsoft Build event Milan!!",
					"hello guysss today I m in Milan, Italy at the Microsoft Build best event!! here in Milan hot day but I could not miss this event for any reason!!!@Microsoft", fanMicrosoft,
					"http://www.hwupgrade.it/news/programmi/microsoft-build-arriva-a-milano-segui-lo-streaming-live_57601.html",
					"http://www.hwupgrade.it/immagini/build_milano.jpg",
					"https://www.youtube.com/watch?v=Cuvmh2Hhdhk");
			
			Attivita patrickAlMicrosoftAcquistaNokia = new Attivita("Patty At Microsoft buys Nokia",
					"Yo All today Microsoft will finally buy Nokia! I could not miss this event yeahhh!!#Microsoft#Nokia#me#technologyLife @Microsoft", fanTecnologie,
					"http://leganerd.com/2014/04/28/microsoft-finalizza-lacquisizione-nokia-nasce-microsoft-mobile/",
					"http://i1.wp.com/leganerd.com/wp-content/uploads/2014/04/msnokia_clk1.jpg?resize=591%2C409",
					"https://www.youtube.com/watch?v=XH91xAGPtsg");
			
			Attivita jimmyAlApplePresentaIpad = new Attivita("Jimmy at the presentation of new Apple IpadMini3",
					"Hi friendsssss!! Today Apple presents the new IpadMini WOWWW I so excited!!I'm with my friend @patrikNerd yeaaa @Apple", fanApple,
					"https://www.apple.com/ipad-mini-3/",
					"http://darkroom-cdn.s3.amazonaws.com/2014/09/REU-USA-BUSINESS.jpg",
					"https://www.apple.com/ipad/change-everything/");
			
			Attivita PatrikAlApplePresentaIpad = new Attivita("Patty at the presentation of new Apple IpadMini3",
					"Hi guyss!! Today Apple presents the new IpadMini!!!I'm here with my friend @brianJimmy YUHUUU #me#bestFriend @Apple", fanTecnologie,
					"https://www.apple.com/ipad-mini-3/",
					"http://darkroom-cdn.s3.amazonaws.com/2014/09/REU-USA-BUSINESS.jpg",
					"https://www.apple.com/ipad/change-everything/");
			
			Attivita aladAlSamsungNuovoGalaxy = new Attivita("Alad at the presentation of the new Samsung Galaxy",
					"Hello All!! I'm at the presentation of the new Samsung Galaxy YOO!!!Here there are 1000000 people @Samsung", fanSamsung,
					"http://www.samsung.com/it/home",
					"http://www.samsung.com/it/galaxy/",
					"https://www.youtube.com/watch?v=jBDLOkWkqcE");
			
			com.addAttivita(nokiaCelebra150);
			com.addAttivita(eventoAppleJune2015);
			com.addAttivita(newIpadMini3);
			com.addAttivita(SamsungNuovoGalaxy);
			com.addAttivita(microsoftCompraNokia);
			com.addAttivita(microsoftMilano);
			com.addAttivita(jimmyAi150Apple);
			com.addAttivita(patrickAlMicrosoftAcquistaNokia);
			com.addAttivita(jimmyAlApplePresentaIpad);
			com.addAttivita(PatrikAlApplePresentaIpad);
			com.addAttivita(aladAlSamsungNuovoGalaxy);
			com.addAttivita(williamAlMicrosoftMilan);
			com.addAttivita(williamAt150Noklia);


		} catch (Exception e) {
		}
	}
}
