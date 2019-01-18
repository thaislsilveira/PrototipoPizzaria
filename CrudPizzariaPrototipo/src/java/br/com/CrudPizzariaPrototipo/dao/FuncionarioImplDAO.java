/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package br.com.CrudPizzariaPrototipo.dao;

import br.com.CrudPizzariaPrototipo.model.Funcionario;
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
public class FuncionarioImplDAO implements GenericDAO {

    private Connection conexao;

    public FuncionarioImplDAO() throws Exception {
        try {
            this.conexao = ConnectionFactory.getConnection();
            System.out.println("Conectado com sucesso");
        } catch (Exception ex) {
            throw new Exception("Problemas ao conectar no BD! Erro:" + ex.getMessage());
        }
    }

    @Override
    public Boolean cadastrar(Object objeto) {
        Funcionario oFuncionario = (Funcionario) objeto;
        Boolean retorno = false;

        if (oFuncionario.getIdFuncionario() == 0) {
            retorno = this.inserir(oFuncionario);
        } else {
            retorno = this.alterar(oFuncionario);
        }
        return retorno;
    }

    @Override
    public Boolean inserir(Object objeto) {
        Funcionario oFuncionario = (Funcionario) objeto;
        PreparedStatement stmt = null;
        String sql = "Insert into funcionario (nomeFuncionario, emailFuncionario, senhaFuncionario, idFuncao) values (?,?,?,?);";

        try {
            stmt = conexao.prepareStatement(sql);
            stmt.setString(1, oFuncionario.getNomeFuncionario());
            stmt.setString(2, oFuncionario.getEmailFuncionario());
            stmt.setString(3, oFuncionario.getSenhaFuncionario());
            stmt.setInt(4, oFuncionario.getFuncao().getIdFuncao());
            stmt.execute();
            return true;
        } catch (SQLException ex) {
            System.out.println("Problemas ao cadastrar Funcionario!Erro: " + ex.getMessage());
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
        Funcionario oFuncionario = (Funcionario) objeto;
        PreparedStatement stmt = null;
        String sql = "update funcionario set nomeFuncionario=?, emailFuncionario=?, senhaFuncionario=?, idFuncao=? where idfuncionario=?";

        try {
            stmt = conexao.prepareStatement(sql);
            stmt.setString(1, oFuncionario.getNomeFuncionario());
            stmt.setString(2, oFuncionario.getEmailFuncionario());
            stmt.setString(3, oFuncionario.getSenhaFuncionario());
            stmt.setInt(4, oFuncionario.getFuncao().getIdFuncao());
            stmt.setInt(5, oFuncionario.getIdFuncionario());

            stmt.execute();
            return true;
        } catch (Exception ex) {
            System.out.println("Problemas ao alterar funcionario! Erro: " + ex.getMessage());
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
        int idFuncionario = numero;
        PreparedStatement stmt = null;
        String sql = "delete from funcionario where idfuncionario=?;";
        try {
            stmt = conexao.prepareStatement(sql);
            stmt.setInt(1, idFuncionario);

            stmt.execute();
            return true;
        } catch (Exception ex) {
            System.out.println("Problemas ao excluir funcionario! Erro: " + ex.getMessage());
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
        int idFuncionario = numero;
        PreparedStatement stmt = null;
        ResultSet rs = null;
        Funcionario oFuncionario = null;
        String sql = "Select f.*, fun.*  from funcionario f inner join  funcao fun on f.idFuncao = fun.idFuncao where idFuncionario=?;";

        try {
            stmt = conexao.prepareStatement(sql);
            stmt.setInt(1, idFuncionario);
            rs = stmt.executeQuery();

            while (rs.next()) {
                oFuncionario = new Funcionario();
                oFuncionario.setIdFuncionario(rs.getInt("idFuncionario"));
                oFuncionario.setNomeFuncionario(rs.getString("nomeFuncionario"));
                oFuncionario.setEmailFuncionario(rs.getString("emailFuncionario"));
                oFuncionario.setSenhaFuncionario(rs.getString("senhaFuncionario"));
                oFuncionario.getFuncao().setIdFuncao(rs.getInt("idFuncao"));
                oFuncionario.getFuncao().setDescricaoFuncao(rs.getString("descricaoFuncao"));
            }
            return oFuncionario;
        } catch (SQLException ex) {
            System.out.println("Problemas ao carregar funcionario!"
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

        String sql = "Select f.*, fun.* from funcionario f"
                + " inner join funcao fun on f.idFuncao = fun.idFuncao;";
        try {
            stmt = conexao.prepareStatement(sql);
            rs = stmt.executeQuery();
            while (rs.next()) {
                Funcionario oFuncionario = new Funcionario();
                oFuncionario.setIdFuncionario(rs.getInt("idFuncionario"));
                oFuncionario.setNomeFuncionario(rs.getString("nomeFuncionario"));
                oFuncionario.setEmailFuncionario(rs.getString("emailFuncionario"));
                oFuncionario.setSenhaFuncionario(rs.getString("senhaFuncionario"));
                oFuncionario.getFuncao().setIdFuncao(rs.getInt("idFuncao"));
                oFuncionario.getFuncao().setDescricaoFuncao(rs.getString("descricaoFuncao"));
                resultado.add(oFuncionario);
            }
        } catch (SQLException ex) {
            System.out.println("Problemas ao listar funcionario! Erro:"
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
    
     public Boolean realizarLogin(Funcionario funcionario) {
        PreparedStatement stmt = null;
        ResultSet rs = null;
        String sql = "select idFuncionario from funcionario where emailFuncionario = ? and senhaFuncionario = ?;";
        try {
            stmt = conexao.prepareStatement(sql);
            stmt.setString(1, funcionario.getEmailFuncionario());
            stmt.setString(2, funcionario.getSenhaFuncionario());
            rs = stmt.executeQuery();
            if (rs.next()) {
                funcionario.setIdFuncionario(rs.getInt("idFuncionario"));
                return true;
            } else {
                return false;
            }
        } catch (SQLException ex) {
            System.out.println("Problemas ao efetuar login do usuário! Erro: " + ex.getMessage());
            return false;
        } finally {
            try {
                ConnectionFactory.closeConnection(conexao, stmt, rs);
            } catch (Exception ex) {
                System.out.println("Problemas ao fechar os parametros de conexão! Erro: " + ex.getMessage());
            }
        }
    }
}
