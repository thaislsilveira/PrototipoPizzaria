/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package br.com.CrudPizzariaPrototipo.controller.cliente;

import br.com.CrudPizzariaPrototipo.dao.ClienteImplDAO;
import br.com.CrudPizzariaPrototipo.dao.GenericDAO;
import br.com.CrudPizzariaPrototipo.model.Cidade;
import br.com.CrudPizzariaPrototipo.model.Cliente;
import br.com.CrudPizzariaPrototipo.model.Estado;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author thais.silveira
 */
@WebServlet(name = "AlterarCliente", urlPatterns = {"/AlterarCliente"})
public class AlterarCliente extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try {

            String mensagem = "";

            Cliente cliente = new Cliente();
            cliente.setIdCliente(Integer.parseInt(request.getParameter("idCliente")));
            cliente.setNomeCliente(request.getParameter("nomeCliente"));
            cliente.setEmailCliente(request.getParameter("emailCliente"));
            cliente.setSenhaCliente(request.getParameter("senhaCliente"));
            cliente.setCpfCliente(request.getParameter("cpfCliente"));
            cliente.setTelefoneCliente(request.getParameter("telefoneCliente"));
            Cidade cidade = new Cidade();
            Estado estado = new Estado();
            estado.setIdEstado(Integer.parseInt(request.getParameter("idEstado")));
            cidade.setIdCidade(Integer.parseInt(request.getParameter("idCidade")));
            cidade.setEstado(estado);
            cliente.setCidade(cidade);
            cliente.setCepCliente(request.getParameter("cepCliente"));
            cliente.setEnderecoCliente(request.getParameter("enderecoCliente"));

            GenericDAO dao = new ClienteImplDAO();
            if (dao.alterar(cliente)) {
                mensagem = "Seus dados foram alterados com sucesso!";
            } else {
                mensagem = "Problemas ao alterar seus dados!";
            }

            request.setAttribute("mensagem", mensagem);
            request.getRequestDispatcher("DadosCliente").forward(request, response);
        } catch (Exception ex) {
            System.out.println("Erro na AlteraCliente: " + ex.getMessage());
        }
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
