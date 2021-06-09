package it.unisa.model;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.Collection;
import java.util.LinkedList;

import javax.sql.DataSource;

import it.unisa.utils.Utility;


public class AccountUserModelDS implements EntityModel<AccountUserBean> {

	private DataSource ds = null;
	
	public AccountUserModelDS(DataSource ds) {
		this.ds = ds;
	}
	
	
	
	@Override
	public AccountUserBean doRetrieveByKey(Object chiave) throws SQLException {
		String username = (String)chiave;
		return null;
	}

	@Override
	public Collection<AccountUserBean> doRetrieveAll(String ordine) throws SQLException {
		Connection connection = null;
		PreparedStatement preparedStatement = null;
		
		String selectSQL = "SELECT * FROM accountuser";
		
		if(ordine != null && !ordine.equals("")) {
			selectSQL += " ORDER BY " + ordine;
		}
		
		Collection<AccountUserBean> accounts = new LinkedList<AccountUserBean>();
		
		try {
			connection = ds.getConnection();
			preparedStatement = connection.prepareStatement(selectSQL);
			
			Utility.print("doRetriveAll: " + preparedStatement.toString());
			
			ResultSet rs = preparedStatement.executeQuery();
			
			while(rs.next()) {
				AccountUserBean account = new AccountUserBean();
				
				account.setUsername(rs.getString("username"));
				account.seteMail(rs.getString("e_mail"));
				account.setPasswd(rs.getString("passwd") );
				account.setNome(rs.getString("nome"));
				account.setCognome(rs.getString("cognome"));
				account.setData(rs.getString("datadinascita"));
				account.setn_Ordini(rs.getInt("n_ordini"));
				account.setVia(rs.getString("via"));
				account.setNumero(rs.getInt("numero"));
				account.setCap(rs.getLong("cap"));
				account.setCitta(rs.getString("citta"));
				account.setProvincia(rs.getString("provincia"));
				
				accounts.add(account);
			}
			
		} finally {
			try {
			if(preparedStatement != null)
				preparedStatement.close();
			}finally {
			if(connection != null)
				connection.close();
			}
		  }
		
		return accounts;
	}

	@Override
	public void doSave(AccountUserBean item) throws SQLException {
		

	}

	@Override
	public void doUpdate(AccountUserBean item) throws SQLException {
		

	}

	@Override
	public void doDelete(AccountUserBean item) throws SQLException {
		// TODO Auto-generated method stub

	}

}
