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
public class ProdutoPedido {

    private int idProdutoPedido;
    private int qtdPedido;
    private Produto produto;
    private Pedido pedido;

    public ProdutoPedido() {
    }

    public ProdutoPedido(int idProdutoPedido, int qtdPedido, Produto produto, Pedido pedido) {
        this.idProdutoPedido = idProdutoPedido;
        this.qtdPedido = qtdPedido;
        this.produto = produto;
        this.pedido = pedido;
    }

    public int getIdProdutoPedido() {
        return idProdutoPedido;
    }

    public void setIdProdutoPedido(int idProdutoPedido) {
        this.idProdutoPedido = idProdutoPedido;
    }

    public int getQtdPedido() {
        return qtdPedido;
    }

    public void setQtdPedido(int qtdPedido) {
        this.qtdPedido = qtdPedido;
    }

    public Produto getProduto() {
        if (produto == null) {
            produto = new Produto();
        }
        return produto;
    }

    public void setProduto(Produto produto) {
        this.produto = produto;
    }

    public Pedido getPedido() {
        if (pedido == null) {
            pedido = new Pedido();
        }
        return pedido;
    }

    public void setPedido(Pedido pedido) {
        this.pedido = pedido;
    } 
}
