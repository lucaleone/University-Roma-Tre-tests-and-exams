package model;

import javax.persistence.Column;
import javax.persistence.Entity;

@Entity
public class ProdMare extends Product {
	public ProdMare() {
	}

	public ProdMare(String nome, String prezzo, int metriSottAcqua) {
		super(nome, prezzo);
		this.metriSottAcqua = metriSottAcqua;
	}
	@Column
	private Integer metriSottAcqua;

	public Integer getMetriSottAcqua() {
		return metriSottAcqua;
	}

	public void setMetriSottAcqua(int metriSottAcqua) {
		this.metriSottAcqua = metriSottAcqua;
	}
}
