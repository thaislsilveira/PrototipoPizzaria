/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package br.com.CrudPizzariaPrototipo.dao;

import br.com.CrudPizzariaPrototipo.model.Cliente;
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
public class ClienteImplDAO implements GenericDAO {

    private Connection conexao;

    public ClienteImplDAO() throws Exception {
        try {
            this.conexao = ConnectionFactory.getConnection();
            System.out.println("Conectado com sucesso");
        } catch (Exception ex) {
            throw new Exception("Problemas ao conectar no BD! Erro:" + ex.getMessage());
        }
    }

    @Override
    public Boolean cadastrar(Object objeto) {
        Cliente produto = (Cliente) objeto;
        Boolean retorno = false;

        if (produto.getIdCliente() == 0) {
            retorno = this.inserir(produto);
        } else {
            retorno = this.alterar(produto);
        }
        return retorno;
    }

    @Override
    public Boolean inserir(Object objeto) {
        Cliente oCliente = (Cliente) objeto;
        PreparedStatement stmt = null;
        String sql = "INSERT INTO cliente (nomecliente,cpfcliente,emailcliente,telefonecliente,senhacliente,cepcliente,enderecocliente, idcidade) VALUES (?,?,?,?,?,?,?,?);";

        try {
            stmt = conexao.prepareStatement(sql);
            stmt.setString(1, oCliente.getNomeCliente());
            stmt.setString(2, oCliente.getCpfCliente());
            stmt.setString(3, oCliente.getEmailCliente());
            stmt.setString(4, oCliente.getTelefoneCliente());
            stmt.setString(5, oCliente.getSenhaCliente());
            stmt.setString(6, oCliente.getCepCliente());
            stmt.setString(7, oCliente.getEnderecoCliente());
            stmt.setInt(8, oCliente.getCidade().getIdCidade());

            stmt.execute();
            return true;
        } catch (SQLException ex) {
            System.out.println("Problemas ao cadastrar cliente!Erro: " + ex.getMessage());
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
    public Boolean alterar(Object objeto) {
        Cliente oCliente = (Cliente) objeto;
        PreparedStatement stmt = null;
        String sql = "update cliente set nomecliente=?,cpfcliente=?,emailcliente=?,telefonecliente=?,senhacliente=?,cepcliente=?,enderecocliente=?, idcidade=? where idcliente=?;";

        try {
            stmt = conexao.prepareStatement(sql);
            stmt.setString(1, oCliente.getNomeCliente());
            stmt.setString(2, oCliente.getCpfCliente());
            stmt.setString(3, oCliente.getEmailCliente());
            stmt.setString(4, oCliente.getTelefoneCliente());
            stmt.setString(5, oCliente.getSenhaCliente());
            stmt.setString(6, oCliente.getCepCliente());
            stmt.setString(7, oCliente.getEnderecoCliente());
            stmt.setInt(8, oCliente.getCidade().getIdCidade());
            stmt.setInt(9, oCliente.getIdCliente());

            stmt.execute();
            return true;
        } catch (Exception ex) {
            System.out.println("Problemas ao alterar Cliente! Erro: " + ex.getMessage());
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
        int idCliente = numero;
        PreparedStatement stmt = null;
        String sql = "delete from cliente where idcliente=?;";
        try {
            stmt = conexao.prepareStatement(sql);
            stmt.setInt(1, idCliente);

            stmt.execute();
            return true;
        } catch (Exception ex) {
            System.out.println("Problemas ao excluir cliente! Erro: " + ex.getMessage());
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
        int idCliente = numero;
        PreparedStatement stmt = null;
        ResultSet rs = null;
        Cliente oCliente = null;
        String sql = "select cli.*, ci.*, e.* from cliente cli inner join cidade ci on cli.idcidade = ci.idcidade "
                + " inner join estado e on ci.idestado = e.idestado where cli.idCliente = ?";

        try {
            stmt = conexao.prepareStatement(sql);
            stmt.setInt(1, idCliente);
            rs = stmt.executeQuery();

            while (rs.next()) {
                oCliente = new Cliente();
                oCliente.setIdCliente(rs.getInt("idCliente"));
                oCliente.setNomeCliente(rs.getString("nomeCliente"));
                oCliente.setCpfCliente(rs.getString("cpfCliente"));
                oCliente.setEmailCliente(rs.getString("emailCliente"));
                oCliente.setTelefoneCliente(rs.getString("telefoneCliente"));
                oCliente.setSenhaCliente(rs.getString("senhaCliente"));
                oCliente.setCepCliente(rs.getString("cepCliente"));
                oCliente.setEnderecoCliente(rs.getString("enderecoCliente"));
                oCliente.getCidade().setIdCidade(rs.getInt("idCidade"));
                oCliente.getCidade().setNomeCidade(rs.getString("nomeCidade"));
                oCliente.getCidade().getEstado().setIdEstado(rs.getInt("idEstado"));
                oCliente.getCidade().getEstado().setNomeEstado(rs.getString("nomeEstado"));
            }
            return oCliente;
        } catch (SQLException ex) {
            System.out.println("Problemas ao carregar cliente!"
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

        String sql = "select cli.*, ci.*, e.* from cliente cli inner join cidade ci on cli.idcidade = ci.idcidade"
                + " inner join estado e on ci.idestado = e.idestado;";
        try {
            stmt = conexao.prepareStatement(sql);
            rs = stmt.executeQuery();
            while (rs.next()) {
                Cliente oCliente = new Cliente();
                oCliente.setIdCliente(rs.getInt("idCliente"));
                oCliente.setNomeCliente(rs.getString("nomeCliente"));
                oCliente.setCpfCliente(rs.getString("cpfCliente"));
                oCliente.setEmailCliente(rs.getString("emailCliente"));
                oCliente.setTelefoneCliente(rs.getString("telefoneCliente"));
                oCliente.setSenhaCliente(rs.getString("senhaCliente"));
                oCliente.setCepCliente(rs.getString("cepCliente"));
                oCliente.setEnderecoCliente(rs.getString("enderecoCliente"));
                oCliente.getCidade().setIdCidade(rs.getInt("idCidade"));
                oCliente.getCidade().setNomeCidade(rs.getString("nomeCidade"));
                oCliente.getCidade().getEstado().setIdEstado(rs.getInt("idEstado"));
                oCliente.getCidade().getEstado().setNomeEstado(rs.getString("nomeEstado"));
                resultado.add(oCliente);
            }
        } catch (SQLException ex) {
            System.out.println("Problemas ao listar Cliente! Erro:"
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
    
    public Boolean realizarLogin(Cliente cliente) {
        PreparedStatement stmt = null;
        ResultSet rs = null;
        String sql = "select idCliente from Cliente where emailCliente = ? and senhaCliente = ?;";
        try {
            stmt = conexao.prepareStatement(sql);
            stmt.setString(1, cliente.getEmailCliente());
            stmt.setString(2, cliente.getSenhaCliente());
            rs = stmt.executeQuery();
            if (rs.next()) {
                cliente.setIdCliente(rs.getInt("idCliente"));
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
