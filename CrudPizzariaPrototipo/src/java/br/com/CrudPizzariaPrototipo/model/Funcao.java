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
public class Funcao {
    private int idFuncao;
    private String descricaoFuncao;

    public Funcao() {
    }

    public Funcao(int idFuncao, String descricaoFuncao) {
        this.idFuncao = idFuncao;
        this.descricaoFuncao = descricaoFuncao;
    }

    public int getIdFuncao() {
        return idFuncao;
    }

    public void setIdFuncao(int idFuncao) {
        this.idFuncao = idFuncao;
    }

    public String getDescricaoFuncao() {
        return descricaoFuncao;
    }

    public void setDescricaoFuncao(String descricaoFuncao) {
        this.descricaoFuncao = descricaoFuncao;
    }  
}
