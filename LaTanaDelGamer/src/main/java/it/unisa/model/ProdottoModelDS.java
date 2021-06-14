package it.unisa.model;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.Collection;
import java.util.LinkedList;

import javax.sql.DataSource;

import it.unisa.utils.Utility;

public class ProdottoModelDS implements EntityModel<ProdottoBean> {

	private DataSource ds = null;
	
	public ProdottoModelDS(DataSource ds) {
		this.ds = ds;
	}
	
	@Override
	public ProdottoBean doRetrieveByKey(Object chiave) throws SQLException {
		int code = (int)chiave;
		Connection connection = null;
		PreparedStatement preparedStatement = null;

		ProdottoBean prodotto = new ProdottoBean();

		String selectSQL = "SELECT * FROM prodotto WHERE id_prodotto = ?";

		try {
			connection = ds.getConnection();
			preparedStatement = connection.prepareStatement(selectSQL);
			preparedStatement.setInt(1, code);

			Utility.print("doRetrieveByKey: " + preparedStatement.toString());
			ResultSet rs = preparedStatement.executeQuery();

			while (rs.next()) {
				prodotto.setId_prodotto(rs.getInt("id_prodotto"));
				prodotto.setNome(rs.getString("nome"));
				prodotto.setPrezzo(rs.getFloat("prezzo"));
				prodotto.setDescrizione(rs.getString("descrizione"));
				prodotto.setCasaproduttrice(rs.getString("casaproduttrice"));
				prodotto.setQuantita(rs.getInt("quantita"));
				prodotto.setnomeCategoria(rs.getString("nome_categoria"));
				
			}

			Utility.print(prodotto.toString());
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

		return prodotto;
	}

	@Override
	public Collection<ProdottoBean> doRetrieveAll(String ordine) throws SQLException {
		Connection connection = null;
		PreparedStatement preparedStatement = null;
		
		String selectSQL = "SELECT * FROM prodotto";
		
		if(ordine != null && !ordine.equals("")) {
			selectSQL += " ORDER BY " + ordine;
		}
		
		Collection<ProdottoBean> prodotti = new LinkedList<ProdottoBean>();
		
		try {
			connection = ds.getConnection();
			preparedStatement = connection.prepareStatement(selectSQL);
			
			Utility.print("doRetriveAll: " + preparedStatement.toString());
			
			ResultSet rs = preparedStatement.executeQuery();
			
			while(rs.next()) {
				ProdottoBean prodotto = new ProdottoBean();
				
				prodotto.setId_prodotto(rs.getInt("id_prodotto"));
				prodotto.setNome(rs.getString("nome"));
				prodotto.setPrezzo(rs.getFloat("prezzo"));
				prodotto.setDescrizione(rs.getString("descrizione"));
				prodotto.setCasaproduttrice(rs.getString("casaproduttrice"));
				prodotto.setQuantita(rs.getInt("quantita"));
				prodotto.setCopertina(rs.getString("copertina"));
				prodotto.setnomeCategoria(rs.getString("nome_categoria"));

				
				prodotti.add(prodotto);
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
		
		return prodotti;
		
		
	}

	@Override
	public void doSave(ProdottoBean item) throws SQLException {
		Connection connection = null;
		PreparedStatement preparedStatement = null;

		String insertSQL = "INSERT INTO prodotto" + " (id_prodotto, nome, prezzo, descrizione, casaproduttrice, quantita, copertina, nome_categoria) VALUES (?, ?, ?, ?, ?, ?, ?, ?)";

		try {
			connection = ds.getConnection();
			connection.setAutoCommit(false);
			preparedStatement = connection.prepareStatement(insertSQL);

			preparedStatement.setInt(1, item.getId_prodotto());
			preparedStatement.setString(2, item.getNome());
			preparedStatement.setFloat(3, item.getPrezzo());
			preparedStatement.setString(4, item.getDescrizione());
			preparedStatement.setString(5, item.getCasaProduttrice());
			preparedStatement.setInt(6, item.getQuantita());
			preparedStatement.setString(7, item.getCopertina());
			preparedStatement.setString(8, item.getnomeCategoria());
			
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
	public void doUpdate(ProdottoBean item) throws SQLException {
		Connection connection = null;
		PreparedStatement preparedStatement = null;

		String updateSQL = "UPDATE prodotto SET " + "nome = ?, prezzo = ?, descrizione = ?, casaproduttrice = ?, quantita = ?, copertina = ?, nome_categoria = ? WHERE id_prodotto = ?";

		try {
			connection = ds.getConnection();
			connection.setAutoCommit(false);
			preparedStatement = connection.prepareStatement(updateSQL);

			
			preparedStatement.setString(1, item.getNome());
			preparedStatement.setFloat(2, item.getPrezzo());
			preparedStatement.setString(3, item.getDescrizione());
			preparedStatement.setString(4, item.getCasaProduttrice());
			preparedStatement.setInt(5,item.getQuantita());
			preparedStatement.setString(6, item.getCopertina());
			preparedStatement.setString(7, item.getnomeCategoria());

			preparedStatement.setInt(8, item.getId_prodotto());
			
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
	public void doDelete(ProdottoBean item) throws SQLException {
		Connection connection = null;
		PreparedStatement preparedStatement = null;

		String deleteSQL = "DELETE FROM prodotto WHERE id_prodotto = ?";

		try {
			connection = ds.getConnection();
			connection.setAutoCommit(false);
			preparedStatement = connection.prepareStatement(deleteSQL);
			preparedStatement.setInt(1, item.getId_prodotto());

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

