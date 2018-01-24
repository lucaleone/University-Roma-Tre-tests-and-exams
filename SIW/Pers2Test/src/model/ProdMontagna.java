package model;

import javax.persistence.Column;
import javax.persistence.Entity;

@Entity
public class ProdMontagna extends Product {
	public ProdMontagna() {
	}

	public ProdMontagna(String nome, String prezzo, Integer maxAltezza) {
		super(nome, prezzo);
		MaxAltezza = maxAltezza;
	}
	@Column
	private Integer MaxAltezza;

	public Integer getMaxAltezza() {
		return MaxAltezza;
	}

	public void setMaxAltezza(Integer maxAltezza) {
		MaxAltezza = maxAltezza;
	}
}
