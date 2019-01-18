/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package br.com.CrudPizzariaPrototipo.controller.login;

import br.com.CrudPizzariaPrototipo.dao.CidadeImplDAO;
import br.com.CrudPizzariaPrototipo.dao.ClienteImplDAO;
import br.com.CrudPizzariaPrototipo.dao.EstadoImplDAO;
import br.com.CrudPizzariaPrototipo.dao.GenericDAO;
import br.com.CrudPizzariaPrototipo.model.Cliente;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 *
 * @author thais.silveira
 */
@WebServlet(name = "Login", urlPatterns = {"/Login"})
public class Login extends HttpServlet {
 @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        try{
           GenericDAO oEstadoDAO = new EstadoImplDAO();
           GenericDAO oCidadeDAO = new CidadeImplDAO();          
           request.setAttribute("cidades", oCidadeDAO.Listar());
           request.setAttribute("estados", oEstadoDAO.Listar());
        }catch(Exception ex){
            System.out.println("Erro ao listar estado e cidade na login");
        }
        request.getRequestDispatcher("pedido/pedido.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        try{
           GenericDAO oEstadoDAO = new EstadoImplDAO();
           GenericDAO oCidadeDAO = new CidadeImplDAO();          
           request.setAttribute("cidades", oCidadeDAO.Listar());
           request.setAttribute("estados", oEstadoDAO.Listar());
        }catch(Exception ex){
            System.out.println("Deu pau listando estado e cidade na login");
        }
        boolean logged = false;
        Cliente cliente = new Cliente();
        cliente.setEmailCliente(request.getParameter("emailCliente"));
        cliente.setSenhaCliente(request.getParameter("senhaCliente"));
        try {
            ClienteImplDAO dao = new ClienteImplDAO();
            if (dao.realizarLogin(cliente)) {
                logged = true;
                dao = new ClienteImplDAO();
                cliente = (Cliente) dao.carregar(cliente.getIdCliente());
                HttpSession session = request.getSession(true);
                session.setAttribute("cliente", cliente);
                response.sendRedirect("TipoController");
            } else {
                request.setAttribute("mensagem", "Usuário e/ou senha invalido(s).");
            }
        } catch (Exception ex) {
            System.out.println("Erro na controller login! Erro: " + ex.getMessage());
            request.setAttribute("mensagem", "Erro ao processar solicitação, tente novamente mais tarde.");
        } finally {
            if(!logged){
                request.getRequestDispatcher("pedido/pedido.jsp").forward(request, response);
            }
        }
    }

}
