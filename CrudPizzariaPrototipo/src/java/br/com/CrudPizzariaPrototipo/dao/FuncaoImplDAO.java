/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package br.com.CrudPizzariaPrototipo.dao;

import br.com.CrudPizzariaPrototipo.model.Funcao;
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
public class FuncaoImplDAO  implements GenericDAO{

      private Connection conexao;

    public FuncaoImplDAO() throws Exception {
        try {
            this.conexao = ConnectionFactory.getConnection();
            System.out.println("Conectado com sucesso");
        } catch (Exception ex) {
            throw new Exception("Problemas ao conectar no BD! Erro:" + ex.getMessage());
        }
    }

    @Override
    public Boolean cadastrar(Object objeto) {
        Funcao oFuncao = (Funcao) objeto;
        Boolean retorno = false;

        if (oFuncao.getIdFuncao() == 0) {
            retorno = this.inserir(oFuncao);
        } else {
            retorno = this.alterar(oFuncao);
        }
        return retorno;
    }

    @Override
    public Boolean inserir(Object objeto) {
        Funcao oFuncao = (Funcao) objeto;
        PreparedStatement stmt = null;
        String sql = "Insert into funcao (descricaoFuncao) values (?);";

        try {
            stmt = conexao.prepareStatement(sql);
            stmt.setString(1, oFuncao.getDescricaoFuncao());          
            stmt.execute();
            return true;
        } catch (SQLException ex) {
            System.out.println("Problemas ao cadastrar Função!Erro: " + ex.getMessage());
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
        Funcao oFuncao = (Funcao) objeto;
        PreparedStatement stmt = null;
        String sql = "update funcao set descricaoFuncao=? where idFuncao=?";

        try {
            stmt = conexao.prepareStatement(sql);
            stmt.setString(1, oFuncao.getDescricaoFuncao());
            stmt.setInt(2, oFuncao.getIdFuncao());       

            stmt.execute();
            return true;
        } catch (Exception ex) {
            System.out.println("Problemas ao alterar Função! Erro: " + ex.getMessage());
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
        int idFuncao = numero;
        PreparedStatement stmt = null;
        String sql = "delete from funcao where idFuncao=?;";
        try {
            stmt = conexao.prepareStatement(sql);
            stmt.setInt(1, idFuncao);

            stmt.execute();
            return true;
        } catch (Exception ex) {
            System.out.println("Problemas ao excluir Função! Erro: " + ex.getMessage());
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
        int idFuncao = numero;
        PreparedStatement stmt = null;
        ResultSet rs = null;
        Funcao oFuncao = null;
        String sql = "Select * from funcao where idFuncao=?;";

        try {
            stmt = conexao.prepareStatement(sql);
            stmt.setInt(1, idFuncao);
            rs = stmt.executeQuery();

            while (rs.next()) {
                oFuncao = new Funcao();
                oFuncao.setIdFuncao(rs.getInt("idFuncao"));
                oFuncao.setDescricaoFuncao(rs.getString("descricaoFuncao"));
            } 
            return oFuncao;
        } catch (SQLException ex) {
            System.out.println("Problemas ao carregar Função!"
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

        String sql = "Select * from funcao order by descricaoFuncao";
        try {
            stmt = conexao.prepareStatement(sql);
            rs = stmt.executeQuery();
            while (rs.next()) {
                Funcao oFuncao = new Funcao();
                oFuncao.setIdFuncao(rs.getInt("idFuncao"));
                oFuncao.setDescricaoFuncao(rs.getString("descricaoFuncao"));                
                resultado.add(oFuncao);
            }
        } catch (SQLException ex) {
            System.out.println("Problemas ao listar Função! Erro:"
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
