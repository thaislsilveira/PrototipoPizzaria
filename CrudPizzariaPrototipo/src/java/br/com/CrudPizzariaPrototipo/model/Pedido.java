/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package br.com.CrudPizzariaPrototipo.model;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;

/**
 *
 * @author Thais Silveira
 */
public class Pedido {

    private int idPedido;
    private Date dataHora;
    private String statusPedido;
    private int tipoPedido;
    private float desconto;
    private float subTotal;
    private float valorTotal;
    private Cliente cliente;
    private Entregador entregador;
    private Funcionario funcionario;  
    private Mesa mesa;
    
    private List<ProdutoPedido> produtoPedidoList;

    public Pedido() {
    }

    public Pedido(int idPedido, Date dataHora, String statusPedido, int tipoPedido, float desconto, float subTotal, float valorTotal, Cliente cliente, Entregador entregador, Funcionario funcionario, Mesa mesa) {
        this.idPedido = idPedido;
        this.dataHora = dataHora;
        this.statusPedido = statusPedido;
        this.tipoPedido = tipoPedido;
        this.desconto = desconto;
        this.subTotal = subTotal;
        this.valorTotal = valorTotal;
        this.cliente = cliente;
        this.entregador = entregador;
        this.funcionario = funcionario;
        this.mesa = mesa;
    }

    public int getIdPedido() {
        return idPedido;
    }

    public void setIdPedido(int idPedido) {
        this.idPedido = idPedido;
    }

    public Date getDataHora() {
        return dataHora;
    }

    public void setDataHora(Date dataHora) {
        this.dataHora = dataHora;
    }

    public String getStatusPedido() {
        return statusPedido;
    }

    public void setStatusPedido(String statusPedido) {
        this.statusPedido = statusPedido;
    }

    public int getTipoPedido() {
        return tipoPedido;
    }

    public void setTipoPedido(int tipoPedido) {
        this.tipoPedido = tipoPedido;
    }

    public float getDesconto() {
        return desconto;
    }

    public void setDesconto(float desconto) {
        this.desconto = desconto;
    }

    public float getSubTotal() {
        return subTotal;
    }

    public void setSubTotal(float subTotal) {
        this.subTotal = subTotal;
    }

    public float getValorTotal() {
        return valorTotal;
    }

    public void setValorTotal(float valorTotal) {
        this.valorTotal = valorTotal;
    }

    public Cliente getCliente() {
        if (cliente == null) {
            cliente = new Cliente();
        }
        return cliente;
    }

    public void setCliente(Cliente cliente) {
        this.cliente = cliente;
    }

    public Entregador getEntregador() {
        if (entregador == null) {
            entregador = new Entregador();
        }
        return entregador;
    }

    public void setEntregador(Entregador entregador) {
        this.entregador = entregador;
    }

    public Funcionario getFuncionario() {
        if (funcionario == null) {
            funcionario = new Funcionario();
        }
        return funcionario;
    }

    public void setFuncionario(Funcionario funcionario) {
        this.funcionario = funcionario;
    }

    public Mesa getMesa() {
        if (mesa == null) {
            mesa = new Mesa();
        }
        return mesa;
    }

    public void setMesa(Mesa mesa) {
        this.mesa = mesa;
    }

    public List<ProdutoPedido> getProdutoPedidoList() {
         if (produtoPedidoList == null) {
            produtoPedidoList = new ArrayList();
        }
        return produtoPedidoList;
    }

    public void setProdutoPedidoList(List<ProdutoPedido> produtoPedidoList) {
        this.produtoPedidoList = produtoPedidoList;
    }
}
