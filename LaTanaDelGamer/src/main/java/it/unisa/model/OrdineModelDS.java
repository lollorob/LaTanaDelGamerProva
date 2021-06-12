package it.unisa.model;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.Collection;
import java.util.LinkedList;

import javax.sql.DataSource;

import it.unisa.utils.Utility;

public class OrdineModelDS implements EntityModel<OrdineBean> {

	private DataSource ds = null;
	
	public OrdineModelDS(DataSource ds) {
		this.ds=ds;
	}
	
	
	@Override
	public OrdineBean doRetrieveByKey(Object chiave) throws SQLException {
		int code = (int) chiave;
		Connection connection = null;
		PreparedStatement preparedStatement = null;
		
		OrdineBean ordine = new OrdineBean();

		String selectSQL = "SELECT * FROM ordine WHERE id_ordine = ?";

		try {
			connection = ds.getConnection();
			preparedStatement = connection.prepareStatement(selectSQL);
			preparedStatement.setInt(1, code);

			Utility.print("doRetrieveByKey: " + preparedStatement.toString());
			ResultSet rs = preparedStatement.executeQuery();

			while (rs.next()) {
				ordine.setId_ordine(rs.getInt("id_ordine"));
				ordine.setData_ordine(rs.getString("data_ordine"));
				ordine.setUsername(rs.getString("username") );
				ordine.setEmail_spedizione(rs.getString("email_spedizione"));
				ordine.setImporto(rs.getFloat("importo"));
				ordine.setTipo_pagamento(rs.getString("tipo_pagamento"));
				ordine.setMetodo_pagamento(rs.getString("metodo_pagamento"));
			}

			Utility.print(ordine.toString());
		} finally {
			try {
				if (preparedStatement != null)
					preparedStatement.close();
			} finally {
				if (connection != null) {
					connection.close();
				}
			}
		}

		return ordine;
	}

	@Override
	public Collection<OrdineBean> doRetrieveAll(String order) throws SQLException {
		
		Connection connection = null;
		PreparedStatement preparedStatement = null;
		
		String selectSQL = "SELECT * FROM ordine";
		
		if(order != null && !order.equals("")) {
			selectSQL += " ORDER BY " + order;
		}
		
		Collection<OrdineBean> ordini = new LinkedList<OrdineBean>();
		
		try {
			connection = ds.getConnection();
			preparedStatement = connection.prepareStatement(selectSQL);
			
			Utility.print("doRetriveAll: " + preparedStatement.toString());
			
			ResultSet rs = preparedStatement.executeQuery();
			
			while(rs.next()) {
				OrdineBean ordine = new OrdineBean();
				
				ordine.setId_ordine(rs.getInt("id_ordine"));
				ordine.setData_ordine(rs.getString("data_ordine"));
				ordine.setUsername(rs.getString("username") );
				ordine.setEmail_spedizione(rs.getString("email_spedizione"));
				ordine.setImporto(rs.getFloat("importo"));
				ordine.setTipo_pagamento(rs.getString("tipo_pagamento"));
				ordine.setMetodo_pagamento(rs.getString("metodo_pagamento"));				
				ordini.add(ordine);
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
		
		return ordini;
	}

	@Override
	public void doSave(OrdineBean item) throws SQLException {
		
		Connection connection = null;
		PreparedStatement preparedStatement = null;

		String insertSQL = "INSERT INTO ordine" + " (id_prodotto,data_ordine,username,email_spedizione,importo,tipo_pagamento,metodo_pagamento) VALUES (?, ?, ?, ?, ?, ?, ?, ?)";

		try {
			connection = ds.getConnection();
			connection.setAutoCommit(false);
			preparedStatement = connection.prepareStatement(insertSQL);

			preparedStatement.setInt(1, item.getId_ordine());
			preparedStatement.setString(2, item.getData_ordine());
			preparedStatement.setString(3, item.getUsername());
			preparedStatement.setString(4, item.getEmail_spedizione());
			preparedStatement.setFloat(5, item.getImporto());
			preparedStatement.setString(6, item.getTipo_pagamento());
			preparedStatement.setString(7, item.getMetodo_pagamento());
			
			

			Utility.print("doSave: " + preparedStatement.toString());
			preparedStatement.executeUpdate();

			connection.commit();

		} finally {
			try {
				if (preparedStatement != null)
					preparedStatement.close();
			} finally {
				if (connection != null) {
					connection.close();
				}
			}
		}

	}

	@Override
	public void doUpdate(OrdineBean item) throws SQLException {
		Connection connection = null;
		PreparedStatement preparedStatement = null;

		String updateSQL = "UPDATE ordine SET " + " data_ordine = ?,username = ?,email_spedizione = ?,importo = ?,tipo_pagamento = ?,metodo_pagamento = ? WHERE id_ordine = ?";

		try {
			connection = ds.getConnection();
			connection.setAutoCommit(false);
			preparedStatement = connection.prepareStatement(updateSQL);

			
			preparedStatement.setString(1, item.getData_ordine());
			preparedStatement.setString(2, item.getUsername());
			preparedStatement.setString(3, item.getEmail_spedizione());
			preparedStatement.setFloat(4, item.getImporto());
			preparedStatement.setString(5, item.getTipo_pagamento());
			preparedStatement.setString(6, item.getMetodo_pagamento());
			preparedStatement.setInt(7, item.getId_ordine());
		
			Utility.print("doUpdate: " + preparedStatement.toString());
			preparedStatement.executeUpdate();

			connection.commit();

		} finally {
			try {
				if (preparedStatement != null)
					preparedStatement.close();
			} finally {
				if (connection != null) {
					connection.close();
				}
			}
		}
		

	}

	@Override
	public void doDelete(OrdineBean item) throws SQLException {
		Connection connection = null;
		PreparedStatement preparedStatement = null;

		String deleteSQL = "DELETE FROM ordine WHERE id_ordine = ?";

		try {
			connection = ds.getConnection();
			connection.setAutoCommit(false);
			preparedStatement = connection.prepareStatement(deleteSQL);
			preparedStatement.setString(1, item.getUsername());

			Utility.print("doDelete: " + preparedStatement.toString());
			preparedStatement.executeUpdate();

			connection.commit();

		} finally {
			try {
				if (preparedStatement != null)
					preparedStatement.close();
			} finally {
				if (connection != null) {
					connection.close();
				}
			}
		}
	}


}



