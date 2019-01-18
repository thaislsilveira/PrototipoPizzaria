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
public class Mesa {
    
    private int idMesa;  
    private int qtdCadeiras;
    private int statusMesa;
    private int localMesa;

    public Mesa() {
    }

    public Mesa(int idMesa, int qtdCadeiras, int statusMesa, int localMesa) {
        this.idMesa = idMesa;
        this.qtdCadeiras = qtdCadeiras;
        this.statusMesa = statusMesa;
        this.localMesa = localMesa;
    }

    public int getIdMesa() {
        return idMesa;
    }

    public void setIdMesa(int idMesa) {
        this.idMesa = idMesa;
    }

    public int getQtdCadeiras() {
        return qtdCadeiras;
    }

    public void setQtdCadeiras(int qtdCadeiras) {
        this.qtdCadeiras = qtdCadeiras;
    }

    public int getStatusMesa() {
        return statusMesa;
    }

    public void setStatusMesa(int statusMesa) {
        this.statusMesa = statusMesa;
    }

    public int getLocalMesa() {
        return localMesa;
    }

    public void setLocalMesa(int localMesa) {
        this.localMesa = localMesa;
    }

    
}
