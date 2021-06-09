package it.unisa.model;

import java.sql.SQLException;
import java.util.Collection;

public class AccountUserModelDS implements EntityModel<AccountUserBean> {

	@Override
	public AccountUserBean doRetrieveByKey(Object chiave) throws SQLException {
		String username = (String)chiave;
		return null;
	}

	@Override
	public Collection<AccountUserBean> doRetrieveAll(String ordine) throws SQLException {
		
		return null;
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
