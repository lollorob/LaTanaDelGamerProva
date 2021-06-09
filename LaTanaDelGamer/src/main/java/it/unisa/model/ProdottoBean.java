package it.unisa.model;

import java.io.Serializable;

public class ProdottoBean implements Serializable {

	private static final long serialVersionUID = 1L;
	
	int id_prodotto;
	String nome ;
    float prezzo ;
    String descrizione ;
    String casaProduttrice;
    String nomeCategoria;
    private CategoriaBean categoria;
    

	public ProdottoBean() {
    	id_prodotto=-1;
    	nome="" ;
        prezzo=-1;
        descrizione="" ;
        casaProduttrice="";
        nomeCategoria="";
    }
    
    public int getId_prodotto() {
		return id_prodotto;
	}
	public void setId_prodotto(int id_prodotto) {
		this.id_prodotto = id_prodotto;
	}
	public String getNome() {
		return nome;
	}
	public void setNome(String nome) {
		this.nome = nome;
	}
	public float getPrezzo() {
		return prezzo;
	}
	public void setPrezzo(float prezzo) {
		this.prezzo = prezzo;
	}
	public String getDescrizione() {
		return descrizione;
	}
	public void setDescrizione(String descrizione) {
		this.descrizione = descrizione;
	}
	public String getCasaProduttrice() {
		return casaProduttrice;
	}
	public void setCasaproduttrice(String casaProduttrice) {
		this.casaProduttrice = casaProduttrice;
	}
	public String getnomeCategoria() {
		return nomeCategoria;
	}
	public void setnomeCategoria(String nomeCategoria) {
		this.nomeCategoria = nomeCategoria;
	}
	
	public CategoriaBean getCategoria() {
		return categoria;
	}

	public void setCategoria(CategoriaBean categoria) {
		this.categoria = categoria;
	}
}
