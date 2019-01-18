/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package br.com.CrudPizzariaPrototipo.dao;

import br.com.CrudPizzariaPrototipo.model.Pedido;
import br.com.CrudPizzariaPrototipo.model.ProdutoPedido;
import br.com.CrudPizzariaPrototipo.utils.ConnectionFactory;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Timestamp;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;

/**
 *
 * @author Thais Silveira
 */
public class PedidoImplDAO implements GenericDAO {

    private Connection conexao;

    public PedidoImplDAO() throws Exception {
        try {
            this.conexao = ConnectionFactory.getConnection();
            System.out.println("Conectado com sucesso");
        } catch (Exception ex) {
            throw new Exception("Problemas ao conectar no BD! Erro:" + ex.getMessage());
        }
    }

    @Override
    public Boolean cadastrar(Object objeto) {
        Pedido oPedido = (Pedido) objeto;
        Boolean retorno = false;

        if (oPedido.getIdPedido() == 0) {
            retorno = this.inserir(oPedido);
        } else {
            retorno = this.alterar(oPedido);
        }
        return retorno;
    }

    @Override
    public Boolean inserir(Object objeto) {
        Pedido oPedido = (Pedido) objeto;
        PreparedStatement stmt = null;
        ResultSet rs = null;
        String sql = "Insert into pedido (dataHora, statusPedido, tipoPedido, desconto, subTotal, valorTotal, idCliente, idEntregador, idFuncionario, idMesa) values (?,?,?,?,?,?,?,?,?,?);";

        try {

            stmt = conexao.prepareStatement(sql, new String[]{"idpedido"});
            stmt.setTimestamp(1, new Timestamp(System.currentTimeMillis()));
            stmt.setString(2, oPedido.getStatusPedido());
            stmt.setInt(3, oPedido.getTipoPedido());
            stmt.setFloat(4, oPedido.getDesconto());
            stmt.setFloat(5, oPedido.getSubTotal());
            stmt.setFloat(6, oPedido.getValorTotal());
            stmt.setInt(7, oPedido.getCliente().getIdCliente());
            stmt.setInt(8, oPedido.getEntregador().getIdEntregador());
            stmt.setInt(9, oPedido.getFuncionario().getIdFuncionario());
            stmt.setInt(10, oPedido.getMesa().getIdMesa());
            stmt.execute();
            rs = stmt.getGeneratedKeys();
            if(rs.next()){
                oPedido.setIdPedido(rs.getInt(1));
                for(ProdutoPedido produtopedido: oPedido.getProdutoPedidoList()){
                    produtopedido.getPedido().setIdPedido(oPedido.getIdPedido());
                    ProdutoPedidoImplDAO produtoPedidoDAO = new ProdutoPedidoImplDAO();
                    produtoPedidoDAO.inserir(produtopedido);
                }
            }
            return true;
        } catch (Exception ex) {
            System.out.println("Problemas ao cadastrar Produto!Erro: " + ex.getMessage());
            return false;
        } finally {
            try {
                ConnectionFactory.closeConnection(conexao, stmt);
            } catch (Exception ex) {
                System.out.println("Problemas ao fechar os parâmetros de conexao! Erro: " + ex.getMessage());
            }
        }
    }

    @Override
    public Boolean alterar(Object objeto) {
        Pedido oPedido = (Pedido) objeto;
        PreparedStatement stmt = null;
        String sql = "update pedido set dataHora=?, statusPedido=?, tipoPedido=?, desconto=?, subTotal=?, valorTotal=?, idCliente=?, idEntregador=?, idFuncionario=?, idMesa=? where idPedido=?";

        try {
            stmt = conexao.prepareStatement(sql);
            stmt.setDate(1, new java.sql.Date(oPedido.getDataHora().getTime()));
            stmt.setString(2, oPedido.getStatusPedido());
            stmt.setInt(3, oPedido.getTipoPedido());
            stmt.setFloat(4, oPedido.getDesconto());
            stmt.setFloat(5, oPedido.getSubTotal());
            stmt.setFloat(6, oPedido.getValorTotal());
            stmt.setInt(7, oPedido.getCliente().getIdCliente());
            stmt.setInt(8, oPedido.getEntregador().getIdEntregador());
            stmt.setInt(9, oPedido.getFuncionario().getIdFuncionario());
            stmt.setInt(10, oPedido.getMesa().getIdMesa());
            stmt.setInt(11, oPedido.getIdPedido());
            stmt.execute();
            return true;
        } catch (Exception ex) {
            System.out.println("Problemas ao alterar pedido! Erro: " + ex.getMessage());
            return false;
        } finally {
            try {
                ConnectionFactory.closeConnection(conexao, stmt);
            } catch (Exception ex) {
                System.out.println("Problemas ao fechar os parametros de conexão! Erro" + ex.getMessage());
            }
        }
    }

    @Override
    public Boolean excluir(int numero) {
        int idPedido = numero;
        PreparedStatement stmt = null;
        String sql = "delete from produtoPedido where idPedido=?;delete from pedido where idPedido=?;";
        try {
            stmt = conexao.prepareStatement(sql);
            stmt.setInt(1, idPedido);
            stmt.setInt(2, idPedido);

            stmt.execute();
            return true;
        } catch (Exception ex) {
            System.out.println("Problemas ao excluir pedido! Erro: " + ex.getMessage());
            return false;
        } finally {
            try {
                ConnectionFactory.closeConnection(conexao, stmt);
            } catch (Exception ex) {
                System.out.println("Problemas ao fechar os parametros de conexao! Erro: " + ex.getMessage());
            }
        }
    }

    @Override
    public Object carregar(int numero) {
        int idPedido = numero;
        PreparedStatement stmt = null;
        ResultSet rs = null;
        Pedido oPedido = null;
        String sql = "select p.*, c.*, e.*, f.*, m.* from pedido p inner join cliente c on p.idcliente = c.idcliente"
                + " inner join entregador e on p.identregador = e.identregador "
                + " inner join funcionario f on p.idfuncionario = f.idfuncionario "
                + " inner join mesa m on p.idMesa = m.idMesa where p.idPedido = ?";

        try {
            stmt = conexao.prepareStatement(sql);
            stmt.setInt(1, idPedido);
            rs = stmt.executeQuery();

            while (rs.next()) {
                oPedido = new Pedido();
                oPedido.setIdPedido(rs.getInt("idPedido"));
                oPedido.setDataHora(rs.getTimestamp("dataHora"));
                oPedido.setStatusPedido(rs.getString("statusPedido"));
                oPedido.setTipoPedido(rs.getInt("tipoPedido"));
                oPedido.setDesconto(rs.getFloat("desconto"));
                oPedido.setSubTotal(rs.getFloat("subTotal"));
                oPedido.setValorTotal(rs.getFloat("valorTotal"));
                oPedido.getCliente().setIdCliente(rs.getInt("idCliente"));
                oPedido.getCliente().setNomeCliente(rs.getString("nomeCliente"));
                oPedido.getEntregador().setIdEntregador(rs.getInt("idEntregador"));
                oPedido.getEntregador().setNomeEntregador(rs.getString("nomeEntregador"));
                oPedido.getFuncionario().setIdFuncionario(rs.getInt("idFuncionario"));
                oPedido.getFuncionario().setNomeFuncionario(rs.getString("nomeFuncionario"));
                oPedido.getMesa().setIdMesa(rs.getInt("idMesa"));
                oPedido.setProdutoPedidoList((List<ProdutoPedido>)(Object)new ProdutoPedidoImplDAO().Listar(oPedido.getIdPedido()));

            }
            return oPedido;
        } catch (Exception ex) {
            System.out.println("Problemas ao carregar Pedido!"
                    + "Erro: " + ex.getMessage());
            return null;
        } finally {
            try {
                ConnectionFactory.closeConnection(conexao, stmt, rs);
            } catch (Exception ex) {
                System.out.println("Problemas ao fechar os parâmetros de conexão! Erro: "
                        + ex.getMessage());
            }
        }
    }

    @Override
    public List<Object> Listar() {
        List<Object> resultado = new ArrayList<>();
        PreparedStatement stmt = null;
        ResultSet rs = null;

        String sql = "select p.*, c.*, e.*, f.*, m.* from pedido p inner join cliente c on p.idcliente = c.idcliente "
                + " inner join entregador e on p.identregador = e.identregador "
                + " inner join funcionario f on p.idfuncionario = f.idfuncionario "
                + " inner join mesa m on p.idMesa = m.idMesa;";
        try {
            stmt = conexao.prepareStatement(sql);
            rs = stmt.executeQuery();
            while (rs.next()) {
                Pedido oPedido = new Pedido();
                oPedido.setIdPedido(rs.getInt("idPedido"));
                oPedido.setDataHora(rs.getTimestamp("dataHora"));
                oPedido.setStatusPedido(rs.getString("statusPedido"));
                oPedido.setTipoPedido(rs.getInt("tipoPedido"));
                oPedido.setDesconto(rs.getFloat("desconto"));
                oPedido.setSubTotal(rs.getFloat("subTotal"));
                oPedido.setValorTotal(rs.getFloat("valorTotal"));
                oPedido.getCliente().setIdCliente(rs.getInt("idCliente"));
                oPedido.getCliente().setNomeCliente(rs.getString("nomeCliente"));
                oPedido.getEntregador().setIdEntregador(rs.getInt("idEntregador"));
                oPedido.getEntregador().setNomeEntregador(rs.getString("nomeEntregador"));
                oPedido.getFuncionario().setIdFuncionario(rs.getInt("idFuncionario"));
                oPedido.getFuncionario().setNomeFuncionario(rs.getString("nomeFuncionario"));
                oPedido.getMesa().setIdMesa(rs.getInt("idMesa"));
                resultado.add(oPedido);
            }
        } catch (SQLException ex) {
            System.out.println("Problemas ao listar pedido! Erro:"
                    + ex.getMessage());
        } finally {
            try {
                ConnectionFactory.closeConnection(conexao, stmt, rs);
            } catch (Exception ex) {
                System.out.println("Problemas ao fechar os "
                        + "parametros de conexão! Erro: "
                        + ex.getMessage());
            }
        }
        return resultado;

    }
    
    public List<Object> Listar(Integer idCliente) {
        List<Object> resultado = new ArrayList<>();
        PreparedStatement stmt = null;
        ResultSet rs = null;

        String sql = "select p.*, c.*, e.*, f.*, m.* from pedido p inner join cliente c on p.idcliente = c.idcliente "
                + " inner join entregador e on p.identregador = e.identregador "
                + " inner join funcionario f on p.idfuncionario = f.idfuncionario "
                + " inner join mesa m on p.idMesa = m.idMesa where c.idcliente = ?;";
        try {
            stmt = conexao.prepareStatement(sql);
            stmt.setInt(1, idCliente);
            rs = stmt.executeQuery();
            while (rs.next()) {
                Pedido oPedido = new Pedido();
                oPedido.setIdPedido(rs.getInt("idPedido"));
                oPedido.setDataHora(rs.getTimestamp("dataHora"));
                oPedido.setStatusPedido(rs.getString("statusPedido"));
                oPedido.setTipoPedido(rs.getInt("tipoPedido"));
                oPedido.setDesconto(rs.getFloat("desconto"));
                oPedido.setSubTotal(rs.getFloat("subTotal"));
                oPedido.setValorTotal(rs.getFloat("valorTotal"));
                oPedido.getCliente().setIdCliente(rs.getInt("idCliente"));
                oPedido.getCliente().setNomeCliente(rs.getString("nomeCliente"));
                oPedido.getEntregador().setIdEntregador(rs.getInt("idEntregador"));
                oPedido.getEntregador().setNomeEntregador(rs.getString("nomeEntregador"));
                oPedido.getFuncionario().setIdFuncionario(rs.getInt("idFuncionario"));
                oPedido.getFuncionario().setNomeFuncionario(rs.getString("nomeFuncionario"));
                oPedido.getMesa().setIdMesa(rs.getInt("idMesa"));
                resultado.add(oPedido);
            }
        } catch (SQLException ex) {
            System.out.println("Problemas ao listar pedido! Erro:"
                    + ex.getMessage());
        } finally {
            try {
                ConnectionFactory.closeConnection(conexao, stmt, rs);
            } catch (Exception ex) {
                System.out.println("Problemas ao fechar os "
                        + "parametros de conexão! Erro: "
                        + ex.getMessage());
            }
        }
        return resultado;

    }

}
