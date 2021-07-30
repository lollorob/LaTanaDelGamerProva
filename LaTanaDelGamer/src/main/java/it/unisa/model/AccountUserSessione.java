package it.unisa.model;

public class AccountUserSessione {
	
	private final String nome,cognome;
	private final String username;
	private final boolean is_admin;
	
	
	public AccountUserSessione(AccountUserBean account) {
		this.nome = account.getNome();
		this.cognome = account.getCognome();
		this.username = account.getUsername();
		this.is_admin = account.isAdmin();
	}
	
	public String getNome() {
		return nome;
	}
	
	public String getCognome() {
		return cognome;
	}
	
	public String getUsername() {
		return username;
	}
	
	public boolean isAdmin() {
		return is_admin;
	}

}
