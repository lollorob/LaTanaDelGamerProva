package it.unisa.model;

import java.sql.SQLException;
import java.util.Collection;

import javax.sql.DataSource;

public class RecensioneModelDS implements EntityModel<RecensioneBean> {

	private DataSource ds = null;
	
	public RecensioneModelDS(DataSource ds) {
		this.ds = ds;
	}
	
	@Override
	public RecensioneBean doRetrieveByKey(Object chiave) throws SQLException {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public Collection<RecensioneBean> doRetrieveAll(String ordine) throws SQLException {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public void doSave(RecensioneBean item) throws SQLException {
		// TODO Auto-generated method stub

	}

	@Override
	public void doUpdate(RecensioneBean item) throws SQLException {
		// TODO Auto-generated method stub

	}

	@Override
	public void doDelete(RecensioneBean item) throws SQLException {
		// TODO Auto-generated method stub

	}

}
