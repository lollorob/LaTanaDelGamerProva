package it.unisa.model;

import java.io.Serializable;

public class CategoriaBean implements Serializable {

	private static final long serialVersionUID = 1L;
	
	String nome;
	String descrizione;
	
	public CategoriaBean() {
		nome = "";
		descrizione = "";
	}

	public String getNome() {
		return nome;
	}

	public void setNome(String nome) {
		this.nome = nome;
	}

	public String getDescrizione() {
		return descrizione;
	}

	public void setDescrizione(String descrizione) {
		this.descrizione = descrizione;
	}

	@Override
	public boolean equals(Object other) {
		return this.getNome() ==  ((CategoriaBean) other).getNome();
	}
	
	@Override
	public String toString() {
		return " (" + nome + descrizione + ") ";
	}

}
