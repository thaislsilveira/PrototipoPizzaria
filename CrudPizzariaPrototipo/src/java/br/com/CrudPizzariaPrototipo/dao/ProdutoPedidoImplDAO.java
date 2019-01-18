/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package br.com.CrudPizzariaPrototipo.dao;

import br.com.CrudPizzariaPrototipo.model.ProdutoPedido;
import br.com.CrudPizzariaPrototipo.utils.ConnectionFactory;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

/**
 *
 * @author PC 05
 */
public class ProdutoPedidoImplDAO implements GenericDAO {

    private Connection conexao;

    public ProdutoPedidoImplDAO() throws Exception {
        try {
            this.conexao = ConnectionFactory.getConnection();
            System.out.println("Conectado com sucesso");
        } catch (Exception ex) {
            throw new Exception("Problemas ao conectar no BD! Erro:" + ex.getMessage());
        }
    }

    @Override
    public Boolean cadastrar(Object objeto) {
        ProdutoPedido oProdutoPedido = (ProdutoPedido) objeto;
        Boolean retorno = false;

        if (oProdutoPedido.getIdProdutoPedido() == 0) {
            retorno = this.inserir(oProdutoPedido);
        } else {
            retorno = this.alterar(oProdutoPedido);
        }
        return retorno;
    }

    @Override
    public Boolean inserir(Object objeto) {
        ProdutoPedido oProdutoPedido = (ProdutoPedido) objeto;
        PreparedStatement stmt = null;
        String sql = "Insert into produtoPedido (qtdPedido, idProduto, idPedido) values (?,?,?);";

        try {
            stmt = conexao.prepareStatement(sql);
            stmt.setInt(1, oProdutoPedido.getQtdPedido());
            stmt.setInt(2, oProdutoPedido.getProduto().getIdProduto());
            stmt.setInt(3, oProdutoPedido.getPedido().getIdPedido());
            stmt.execute();
            return true;
        } catch (SQLException ex) {
            System.out.println("Problemas ao cadastrar ProdutoPedido !Erro: " + ex.getMessage());
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
        ProdutoPedido oProdutoPedido = (ProdutoPedido) objeto;
        PreparedStatement stmt = null;
        String sql = "update produtoPedido set qtdPedido=?, idProduto=?, idPedido=? where idProdutoPedido=?";

        try {
            stmt = conexao.prepareStatement(sql);
            stmt.setInt(1, oProdutoPedido.getQtdPedido());
            stmt.setInt(2, oProdutoPedido.getProduto().getIdProduto());
            stmt.setInt(3, oProdutoPedido.getPedido().getIdPedido());
            stmt.setInt(4, oProdutoPedido.getIdProdutoPedido());

            stmt.execute();
            return true;
        } catch (Exception ex) {
            System.out.println("Problemas ao alterar ProdutoPedido ! Erro: " + ex.getMessage());
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
        int idProdutoPedido = numero;
        PreparedStatement stmt = null;
        String sql = "delete from produtoPedido where idProdutoPedido=?;";
        try {
            stmt = conexao.prepareStatement(sql);
            stmt.setInt(1, idProdutoPedido);

            stmt.execute();
            return true;
        } catch (Exception ex) {
            System.out.println("Problemas ao excluir ProdutoPedido ! Erro: " + ex.getMessage());
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
        int idProdutoPedido = numero;
        PreparedStatement stmt = null;
        ResultSet rs = null;
        ProdutoPedido oProdutoPedido = null;
        String sql = "Select pp*. pro*. pe*. from produtoPedido pp "
                + "inner join  produto pro on pp.idProduto = pro.idProduto "
                + "inner join pedido pe on pp.idPedido = pe.idPedido where idProdutoPedido=?;";

        try {
            stmt = conexao.prepareStatement(sql);
            stmt.setInt(1, idProdutoPedido);
            rs = stmt.executeQuery();

            while (rs.next()) {
                oProdutoPedido = new ProdutoPedido();
                oProdutoPedido.setIdProdutoPedido(rs.getInt("idProdutoPedido"));
                oProdutoPedido.setQtdPedido(rs.getInt("qtdPedido"));
                oProdutoPedido.getProduto().setIdProduto(rs.getInt("idProduto"));
                oProdutoPedido.getProduto().setNomeProduto(rs.getString("nomeProduto"));
                oProdutoPedido.getPedido().setIdPedido(rs.getInt("idPedido"));
                oProdutoPedido.getPedido().setTipoPedido(rs.getInt("tipoProduto"));
            }
            return oProdutoPedido;
        } catch (SQLException ex) {
            System.out.println("Problemas ao carregar ProdutoPedido !"
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

        String sql = "Select pp*. pro*. pe*. from produtoPedido pp "
                + "inner join  produto pro on pp.idProduto = pro.idProduto "
                + "inner join pedido pe on pp.idPedido = pe.idPedido";
        try {
            stmt = conexao.prepareStatement(sql);
            rs = stmt.executeQuery();
            while (rs.next()) {
                ProdutoPedido oProdutoPedido = new ProdutoPedido();
                oProdutoPedido.setIdProdutoPedido(rs.getInt("idProdutoPedido"));
                oProdutoPedido.setQtdPedido(rs.getInt("qtdPedido"));             
                oProdutoPedido.getProduto().setIdProduto(rs.getInt("idProduto"));
                oProdutoPedido.getProduto().setNomeProduto(rs.getString("nomeProduto"));
                oProdutoPedido.getPedido().setIdPedido(rs.getInt("idPedido"));
                oProdutoPedido.getPedido().setTipoPedido(rs.getInt("tipoPedido"));
                resultado.add(oProdutoPedido);
            }
        } catch (SQLException ex) {
            System.out.println("Problemas ao listar ProdutoPedido ! Erro:"
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
    
    public List<Object> Listar(Integer idPedido) {
        List<Object> resultado = new ArrayList<>();
        PreparedStatement stmt = null;
        ResultSet rs = null;

        String sql = "Select * from produtoPedido pp "
                + "inner join  produto pro on pp.idProduto = pro.idProduto "
                + "inner join pedido pe on pp.idPedido = pe.idPedido where pe.idPedido = ?";
        try {
            stmt = conexao.prepareStatement(sql);
            stmt.setInt(1, idPedido);
            rs = stmt.executeQuery();
            while (rs.next()) {
                ProdutoPedido oProdutoPedido = new ProdutoPedido();
                oProdutoPedido.setIdProdutoPedido(rs.getInt("idProdutoPedido"));
                oProdutoPedido.setQtdPedido(rs.getInt("qtdPedido"));             
                oProdutoPedido.getProduto().setIdProduto(rs.getInt("idProduto"));
                oProdutoPedido.getProduto().setNomeProduto(rs.getString("nomeProduto"));
                oProdutoPedido.getPedido().setIdPedido(rs.getInt("idPedido"));
                oProdutoPedido.getPedido().setTipoPedido(rs.getInt("tipoPedido"));
                resultado.add(oProdutoPedido);
            }
        } catch (SQLException ex) {
            System.out.println("Problemas ao listar ProdutoPedido ! Erro:"
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
