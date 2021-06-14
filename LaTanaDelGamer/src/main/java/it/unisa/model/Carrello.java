package it.unisa.model;

import java.util.ArrayList;

public class Carrello {
	private ArrayList<ProdottoBean> carrello;
	private double totale ;
	
	public Carrello () {
		carrello = new ArrayList<>();
		totale = 0.0;
	}
	
	
	public void aggiungiProdotto(ProdottoBean prodotto) {

        boolean presente = false;
        for (int i = 0; i < carrello.size(); i++)
        {
            if (carrello.get(i).getId_prodotto() == prodotto.getId_prodotto())
            {
                presente = true;
            }
        }
        if (prodotto != null && presente == false)
        {
            this.carrello.add(prodotto);
            this.totale = prodotto.getPrezzo() + totale;
        }
	}
	
    public void svuotaCarrello()
    {
        carrello.removeAll(carrello);
        this.totale = 0.0;
    }

    public ProdottoBean doretrieveById(int id)
    {
        ProdottoBean prodotto = null;
        for (int i = 0; i < carrello.size(); i++)
        {
            if (carrello.get(i).getId_prodotto() == id)
            {
                prodotto = carrello.get(i);
            }
        }
        return prodotto;
    }

    public ProdottoBean doretrieveByIndex(int index)
    {
        return carrello.get(index);
    }

    public int getSize()
    {
        return this.carrello.size();
    }

    public void rimuoviQuadrobyId(int id)
    {
        for (int i = 0; i < carrello.size(); i++)
        {
            ProdottoBean temp = carrello.get(i);
            if (temp.getId_prodotto() == id)
            {
                this.totale = this.totale - temp.getPrezzo();
                carrello.remove(i);
            }
        }
    }

    public Double getTotale()
    {
        return this.totale;
    }

}
