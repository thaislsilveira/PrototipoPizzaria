/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package br.com.CrudPizzariaPrototipo.model;

/**
 *
 * @author Thais Silveira
 */
public class Entregador {

    private int idEntregador;
    private String nomeEntregador;

    public Entregador() {
    }

    public Entregador(int idEntregador, String nomeEntregador) {
        this.idEntregador = idEntregador;
        this.nomeEntregador = nomeEntregador;
    }

    public int getIdEntregador() {
        return idEntregador;
    }

    public void setIdEntregador(int idEntregador) {
        this.idEntregador = idEntregador;
    }

    public String getNomeEntregador() {
        return nomeEntregador;
    }

    public void setNomeEntregador(String nomeEntregador) {
        this.nomeEntregador = nomeEntregador;
    }  
}
