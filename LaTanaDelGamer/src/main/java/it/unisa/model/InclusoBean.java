package it.unisa.model;

import java.io.Serializable;

public class InclusoBean implements Serializable {

	private static final long serialVersionUID = 1L;
	
	int id_ordine;
	int id_prodotto;
	int quantita;
	private OrdineBean ordine;
	private ProdottoBean prodotto;
	
	public InclusoBean() {
		id_ordine = 0;
	    id_prodotto = 0;
		quantita = 0;
	}
	
	public OrdineBean getOrdine() {
		return ordine;
	}

	public void setOrdine(OrdineBean ordine) {
		this.ordine = ordine;
	}

	public ProdottoBean getProdotto() {
		return prodotto;
	}

	public void setProdotto(ProdottoBean prodotto) {
		this.prodotto = prodotto;
	}

	public int getId_ordine() {
		return id_ordine;
	}

	public void setId_ordine(int id_ordine) {
		this.id_ordine = id_ordine;
	}

	public int getId_prodotto() {
		return id_prodotto;
	}

	public void setId_prodotto(int id_prodotto) {
		this.id_prodotto = id_prodotto;
	}

	public int getQuantita() {
		return quantita;
	}

	public void setQuantita(int quantita) {
		this.quantita = quantita;
	}
	
	@Override
	public boolean equals(Object other) {
		return (this.getId_ordine() ==  ((InclusoBean) other).getId_ordine()) && (this.getId_prodotto() == ((InclusoBean) other).getId_prodotto());
	}
	
	@Override
	public String toString() {
		return " (" + id_ordine + id_prodotto + "," + quantita + ") ";
	}

}
