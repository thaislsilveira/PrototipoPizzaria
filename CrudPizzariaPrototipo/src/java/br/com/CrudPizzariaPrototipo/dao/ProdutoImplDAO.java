/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package br.com.CrudPizzariaPrototipo.dao;

import br.com.CrudPizzariaPrototipo.model.Produto;
import br.com.CrudPizzariaPrototipo.utils.ConnectionFactory;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

/**
 *
 * @author Thais Silveira
 */
public class ProdutoImplDAO implements GenericDAO {

    private Connection conexao;

    public ProdutoImplDAO() throws Exception {
        try {
            this.conexao = ConnectionFactory.getConnection();
            System.out.println("Conectado com sucesso");
        } catch (Exception ex) {
            throw new Exception("Problemas ao conectar no BD! Erro:" + ex.getMessage());
        }
    }

    @Override
    public Boolean cadastrar(Object objeto) {
        Produto oProduto = (Produto) objeto;
        Boolean retorno = false;

        if (oProduto.getIdProduto() == 0) {
            retorno = this.inserir(oProduto);
        } else {
            retorno = this.alterar(oProduto);
        }
        return retorno;
    }

    @Override
    public Boolean inserir(Object objeto) {
        Produto oProduto = (Produto) objeto;
        PreparedStatement stmt = null;
        String sql = "Insert into produto (tipoProduto, nomeProduto, valorProduto, quantidade) values (?,?,?,?);";

        try {
            stmt = conexao.prepareStatement(sql);
            stmt.setString(1, oProduto.getTipoProduto());
            stmt.setString(2, oProduto.getNomeProduto());
            stmt.setFloat(3, oProduto.getValorProduto());
            stmt.setString(4, oProduto.getQuantidade());
            stmt.execute();
            return true;
        } catch (SQLException ex) {
            System.out.println("Problemas ao cadastrar Produto! Erro: " + ex.getMessage());
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
        Produto oProduto = (Produto) objeto;
        PreparedStatement stmt = null;
        String sql = "update produto set tipoProduto=?, nomeProduto=?, valorProduto=?, quantidade=? where idProduto=?";

        try {
            stmt = conexao.prepareStatement(sql);
            stmt.setString(1, oProduto.getTipoProduto());
            stmt.setString(2, oProduto.getNomeProduto());
            stmt.setFloat(3, oProduto.getValorProduto());
            stmt.setString(4, oProduto.getQuantidade());
            stmt.setInt(5, oProduto.getIdProduto());

            stmt.execute();
            return true;
        } catch (Exception ex) {
            System.out.println("Problemas ao alterar produto! Erro: " + ex.getMessage());
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
        int idProduto = numero;
        PreparedStatement stmt = null;
        String sql = "delete from produto where idProduto=?;";
        try {
            stmt = conexao.prepareStatement(sql);
            stmt.setInt(1, idProduto);

            stmt.execute();
            return true;
        } catch (Exception ex) {
            System.out.println("Problemas ao excluir produto! Erro: " + ex.getMessage());
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
        int idProduto = numero;
        PreparedStatement stmt = null;
        ResultSet rs = null;
        Produto oProduto = null;
        String sql = "Select * from produto where idProduto=?;";

        try {
            stmt = conexao.prepareStatement(sql);
            stmt.setInt(1, idProduto);
            rs = stmt.executeQuery();

            while (rs.next()) {
                oProduto = new Produto();
                oProduto.setIdProduto(rs.getInt("idProduto"));
                oProduto.setTipoProduto(rs.getString("tipoProduto"));
                oProduto.setNomeProduto(rs.getString("nomeProduto"));
                oProduto.setValorProduto(rs.getFloat("valorProduto"));
                oProduto.setQuantidade(rs.getString("quantidade"));
            }
            return oProduto;
        } catch (SQLException ex) {
            System.out.println("Problemas ao carregar Produto!"
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

        String sql = "Select * from produto order by nomeProduto";
        try {
            stmt = conexao.prepareStatement(sql);
            rs = stmt.executeQuery();
            while (rs.next()) {
                Produto oProduto = new Produto();
                oProduto.setIdProduto(rs.getInt("idProduto"));
                oProduto.setTipoProduto(rs.getString("tipoProduto"));
                oProduto.setNomeProduto(rs.getString("nomeProduto"));
                oProduto.setValorProduto(rs.getFloat("valorProduto"));
                oProduto.setQuantidade(rs.getString("quantidade"));
                resultado.add(oProduto);
            }
        } catch (SQLException ex) {
            System.out.println("Problemas ao listar produto! Erro:"
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

    public List<Object> ListarTipoProduto() {
        List<Object> resultado = new ArrayList<>();
        PreparedStatement stmt = null;
        ResultSet rs = null;

        String sql = "select tipoproduto from produto group by tipoproduto order by tipoproduto";
        try {
            stmt = conexao.prepareStatement(sql);
            rs = stmt.executeQuery();
            while (rs.next()) {
                Produto oProduto = new Produto();
                oProduto.setTipoProduto(rs.getString("tipoproduto"));
                resultado.add(oProduto);
            }
        } catch (SQLException ex) {
            System.out.println("Problemas ao listar produto! Erro:"
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

    public List<Object> Listar(String tipoProduto) {
        List<Object> resultado = new ArrayList<>();
        PreparedStatement stmt = null;
        ResultSet rs = null;
        String sql = "select * from produto where tipoProduto=?;";

        try {
            stmt = conexao.prepareStatement(sql);
            stmt.setString(1, tipoProduto);
            rs = stmt.executeQuery();

            while (rs.next()) {
                Produto oProduto = new Produto();
                oProduto.setIdProduto(rs.getInt("idProduto"));
                oProduto.setNomeProduto(rs.getString("nomeProduto"));
                oProduto.setValorProduto(rs.getFloat("valorProduto"));
                oProduto.setQuantidade(rs.getString("quantidade"));
                oProduto.setTipoProduto(rs.getString("tipoproduto"));
            }
        } catch (SQLException ex) {
            System.out.println("Problemas ao carregar Produto!"
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
        return resultado;
    }
}
