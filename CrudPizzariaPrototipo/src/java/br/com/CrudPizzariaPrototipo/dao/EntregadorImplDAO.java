/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package br.com.CrudPizzariaPrototipo.dao;

import br.com.CrudPizzariaPrototipo.model.Entregador;
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
public class EntregadorImplDAO implements GenericDAO {

    private Connection conexao;

    public EntregadorImplDAO() throws Exception {
        try {
            this.conexao = ConnectionFactory.getConnection();
            System.out.println("Conectado com sucesso");
        } catch (Exception ex) {
            throw new Exception("Problemas ao conectar no BD! Erro:" + ex.getMessage());
        }
    }

    @Override
    public Boolean cadastrar(Object objeto) {
        Entregador oEntregador = (Entregador) objeto;
        Boolean retorno = false;

        if (oEntregador.getIdEntregador() == 0) {
            retorno = this.inserir(oEntregador);
        } else {
            retorno = this.alterar(oEntregador);
        }
        return retorno;
    }

    @Override
    public Boolean inserir(Object objeto) {
        Entregador oEntregador = (Entregador) objeto;
        PreparedStatement stmt = null;
        String sql = "Insert into entregador (nomeentregador) values (?);";

        try {
            stmt = conexao.prepareStatement(sql);
            stmt.setString(1, oEntregador.getNomeEntregador());
            stmt.execute();
            return true;
        } catch (SQLException ex) {
            System.out.println("Problemas ao cadastrar Entregador!Erro: " + ex.getMessage());
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
        Entregador oEntregador = (Entregador) objeto;
        PreparedStatement stmt = null;
        String sql = "update entregador set nomeentregador=? where identregador=?";

        try {
            stmt = conexao.prepareStatement(sql);
            stmt.setString(1, oEntregador.getNomeEntregador());
            stmt.setInt(2, oEntregador.getIdEntregador());

            stmt.execute();
            return true;
        } catch (Exception ex) {
            System.out.println("Problemas ao alterar entregador! Erro: " + ex.getMessage());
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
        int idEntregador = numero;
        PreparedStatement stmt = null;
        String sql = "delete from entregador where identregador=?;";
        try {
            stmt = conexao.prepareStatement(sql);
            stmt.setInt(1, idEntregador);

            stmt.execute();
            return true;
        } catch (Exception ex) {
            System.out.println("Problemas ao excluir entregador! Erro: " + ex.getMessage());
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
        int idEntregador = numero;
        PreparedStatement stmt = null;
        ResultSet rs = null;
        Entregador oEntregador = null;
        String sql = "Select * from entregador where identregador=?;";

        try {
            stmt = conexao.prepareStatement(sql);
            stmt.setInt(1, idEntregador);
            rs = stmt.executeQuery();

            while (rs.next()) {
                oEntregador = new Entregador();
                oEntregador.setIdEntregador(rs.getInt("identregador"));
                oEntregador.setNomeEntregador(rs.getString("nomeentregador"));
            }
            return oEntregador;
        } catch (SQLException ex) {
            System.out.println("Problemas ao carregar entregador!"
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

        String sql = "Select * from entregador order by nomeentregador";
        try {
            stmt = conexao.prepareStatement(sql);
            rs = stmt.executeQuery();
            while (rs.next()) {
                Entregador oEntregador = new Entregador();
                oEntregador.setIdEntregador(rs.getInt("identregador"));
                oEntregador.setNomeEntregador(rs.getString("nomeentregador"));
                resultado.add(oEntregador);
            }
        } catch (SQLException ex) {
            System.out.println("Problemas ao listar entregador! Erro:"
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
