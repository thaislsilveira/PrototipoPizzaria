/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package br.com.CrudPizzariaPrototipo.model;

/**
 *
 * @author PC 05
 */
public class Cidade {

    private int idCidade;
    private String nomeCidade;
    private Estado estado;

    public Cidade() {
    }

    public Cidade(int idCidade, String nomeCidade, Estado estado) {
        this.idCidade = idCidade;
        this.nomeCidade = nomeCidade;
        this.estado = estado;
    }

    public int getIdCidade() {
        return idCidade;
    }

    public void setIdCidade(int idCidade) {
        this.idCidade = idCidade;
    }

    public String getNomeCidade() {
        return nomeCidade;
    }

    public void setNomeCidade(String nomeCidade) {
        this.nomeCidade = nomeCidade;
    }

    public Estado getEstado() {
        if(estado == null){
            estado = new Estado();
        } 
        return estado;
    }

    public void setEstado(Estado estado) {
        this.estado = estado;
    }   
}
