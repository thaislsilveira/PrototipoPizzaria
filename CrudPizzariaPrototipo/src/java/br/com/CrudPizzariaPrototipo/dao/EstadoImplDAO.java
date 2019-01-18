/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package br.com.CrudPizzariaPrototipo.dao;

import br.com.CrudPizzariaPrototipo.model.Estado;
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
public class EstadoImplDAO implements GenericDAO {

   private Connection conexao;

     public EstadoImplDAO() throws Exception
    {
        try{
            this.conexao = ConnectionFactory.getConnection();
            System.out.println("Conectado com sucesso");
        }catch(Exception ex)
        {
            throw new Exception("Problemas ao conectar no BD! Erro:" + ex.getMessage());
        }
    }
   @Override
    public Boolean cadastrar(Object objeto) {
        Estado oEstado = (Estado) objeto;
       Boolean retorno = false;
       
       if(oEstado.getIdEstado()==0)
       {
           retorno = this.inserir(oEstado);
       }
       else
       {
           retorno = this.alterar(oEstado);
       }
       return retorno;
    }    
    
    
       @Override
    public Boolean inserir(Object objeto) {
        Estado oEstado = (Estado) objeto;
        PreparedStatement stmt = null;
        String sql = "Insert into estado (nomeestado) values (?);";
        
        try{
            stmt = conexao.prepareStatement(sql);
            stmt.setString(1, oEstado.getNomeEstado());
            stmt.execute();
            return true;
        }
        catch(SQLException ex)
        {
            System.out.println("Problemas ao cadastrar Estado!Erro: "+ex.getMessage());
            return false;
        }
        finally
        {
            try
            {
                ConnectionFactory.closeConnection(conexao, stmt);
            }catch(Exception ex){
                System.out.println("Problemas ao fechar os parametros de conexao! Erro: " + ex.getMessage());
            }
        }
    }
   @Override
    public Boolean alterar(Object objeto) {
        Estado oEstado = (Estado) objeto;
       PreparedStatement stmt = null;
       String sql = "update estado set nomeestado=? where idestado=?";
       
       
       try{
           stmt = conexao.prepareStatement(sql);
           stmt.setString(1, oEstado.getNomeEstado());         
           stmt.setInt(5, oEstado.getIdEstado());
          
           stmt.execute();
           return true;
       }
       catch(Exception ex){
           System.out.println("Problemas ao alterar estado! Erro: " +ex.getMessage());
           return false;
       }
       finally
       {
           try{
               ConnectionFactory.closeConnection(conexao, stmt);               
           }catch (Exception ex){
               System.out.println("Problemas ao fechar os parametros de conexão! Erro" + ex.getMessage());
           }
       }
    }

    @Override
    public Boolean excluir(int numero) {
           int idEstado = numero;
            PreparedStatement stmt = null;
            String sql = "delete from estado where idestado=?;";
            try{
                stmt = conexao.prepareStatement(sql);
                stmt.setInt(1, idEstado);
                
                stmt.execute();
                return true;
            }
            catch(Exception ex){
                System.out.println("Problemas ao excluir estado! Erro: " +ex.getMessage());
                return false;
            }
            finally{
                try {
                    ConnectionFactory.closeConnection(conexao, stmt);
                } catch (Exception ex){
                    System.out.println("Problemas ao fechar os parametros de conexao! Erro: " + ex.getMessage());
                }
            }
    }

    @Override
    public Object carregar(int numero) {
        int idEstado = numero;
        PreparedStatement stmt = null;
        ResultSet rs = null;
        Estado oEstado = null;
        String sql = "Select * from estado where idestado=?;";

        try{
            stmt=conexao.prepareStatement(sql);
            stmt.setInt(1, idEstado);
            rs=stmt.executeQuery();

            while (rs.next()){
                oEstado = new Estado();
                oEstado.setIdEstado(rs.getInt("idEstado"));
                oEstado.setNomeEstado(rs.getString("nomeEstado"));           
            }
            return oEstado;
        }
        catch (SQLException ex){
            System.out.println("Problemas ao carregar estado!"
               + "Erro: " +ex.getMessage());
            return null;         
        }finally{
            try{
                ConnectionFactory.closeConnection(conexao, stmt, rs);
            }
            catch(Exception ex){
                System.out.println("Problemas ao fechar os parâmetros de conexão! Erro: "
                   +ex.getMessage());
            }
        }
    }

    @Override
    public List<Object> Listar() {
      List <Object> resultado = new ArrayList<>();
       PreparedStatement stmt = null;
       ResultSet rs = null;
       
       String sql = "Select * from estado order by nomeestado";
       try{
           stmt = conexao.prepareStatement(sql);
           rs = stmt.executeQuery();
           while (rs.next()){
               Estado oEstado = new Estado();
               oEstado.setIdEstado(rs.getInt("idestado"));
               oEstado.setNomeEstado(rs.getString("nomeestado"));                
               resultado.add(oEstado);               
           }
       }catch(SQLException ex){
           System.out.println("Problemas ao listar Estado! Erro:"
                        + ex.getMessage());
       }finally{
           try{
               ConnectionFactory.closeConnection(conexao, stmt,rs);
           }catch (Exception ex){
               System.out.println("Problemas ao fechar os "
                + "parametros de conexão! Erro: "
                +ex.getMessage());
           }
       }
       return resultado;
       
    }
}
