/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package br.com.CrudPizzariaPrototipo.dao;

import br.com.CrudPizzariaPrototipo.model.Mesa;
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
public class MesaImplDAO implements GenericDAO {

     private Connection conexao;

    public MesaImplDAO() throws Exception {
        try {
            this.conexao = ConnectionFactory.getConnection();
            System.out.println("Conectado com sucesso");
        } catch (Exception ex) {
            throw new Exception("Problemas ao conectar no BD! Erro:" + ex.getMessage());
        }
    }

    @Override
    public Boolean cadastrar(Object objeto) {
        Mesa oMesa = (Mesa) objeto;
        Boolean retorno = false;

        if (oMesa.getIdMesa() == 0) {
            retorno = this.inserir(oMesa);
        } else {
            retorno = this.alterar(oMesa);
        }
        return retorno;
    }

    @Override
    public Boolean inserir(Object objeto) {
        Mesa oMesa = (Mesa) objeto;
        PreparedStatement stmt = null;
        String sql = "Insert into mesa (qtdCadeiras, statusMesa, localMesa) values (?,?,?);";

        try {
            stmt = conexao.prepareStatement(sql);
            stmt.setInt(1, oMesa.getQtdCadeiras());
            stmt.setInt(2, oMesa.getStatusMesa());
            stmt.setInt(3, oMesa.getLocalMesa());
            stmt.execute();
            return true;
        } catch (SQLException ex) {
            System.out.println("Problemas ao cadastrar Mesa!Erro: " + ex.getMessage());
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
        Mesa oMesa = (Mesa) objeto;
        PreparedStatement stmt = null;
        String sql = "update mesa set qtdCadeiras=?, statusMesa=?, localMesa=? where idMesa=?";

        try {
            stmt = conexao.prepareStatement(sql);
            stmt.setInt(1, oMesa.getQtdCadeiras());
            stmt.setInt(2, oMesa.getStatusMesa());
            stmt.setInt(3, oMesa.getLocalMesa());
            stmt.setInt(4, oMesa.getIdMesa());

            stmt.execute();
            return true;
        } catch (Exception ex) {
            System.out.println("Problemas ao alterar mesa! Erro: " + ex.getMessage());
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
        int idMesa = numero;
        PreparedStatement stmt = null;
        String sql = "delete from mesa where idMesa=?;";
        try {
            stmt = conexao.prepareStatement(sql);
            stmt.setInt(1, idMesa);

            stmt.execute();
            return true;
        } catch (Exception ex) {
            System.out.println("Problemas ao excluir mesa! Erro: " + ex.getMessage());
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
        int idMesa = numero;
        PreparedStatement stmt = null;
        ResultSet rs = null;
        Mesa oMesa = null;
        String sql = "Select * from mesa where idMesa=?;";

        try {
            stmt = conexao.prepareStatement(sql);
            stmt.setInt(1, idMesa);
            rs = stmt.executeQuery();

            while (rs.next()) {
                oMesa = new Mesa();
                oMesa.setIdMesa(rs.getInt("idMesa"));
                oMesa.setQtdCadeiras(rs.getInt("qtdCadeiras"));
                oMesa.setStatusMesa(rs.getInt("statusMesa"));
                oMesa.setLocalMesa(rs.getInt("localMesa"));
            }
            return oMesa;
        } catch (SQLException ex) {
            System.out.println("Problemas ao carregar Mesa!"
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

        String sql = "Select * from mesa order by qtdCadeiras";
        try {
            stmt = conexao.prepareStatement(sql);
            rs = stmt.executeQuery();
            while (rs.next()) {
                Mesa oMesa = new Mesa();
                oMesa.setIdMesa(rs.getInt("idMesa"));
                oMesa.setQtdCadeiras(rs.getInt("qtdCadeiras"));
                 oMesa.setStatusMesa(rs.getInt("statusMesa"));
                oMesa.setLocalMesa(rs.getInt("localMesa"));
                resultado.add(oMesa);
            }
        } catch (SQLException ex) {
            System.out.println("Problemas ao listar mesa! Erro:"
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
