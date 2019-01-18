/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package br.com.CrudPizzariaPrototipo.controller.cliente;

import br.com.CrudPizzariaPrototipo.dao.ClienteImplDAO;
import br.com.CrudPizzariaPrototipo.dao.GenericDAO;
import br.com.CrudPizzariaPrototipo.model.Cliente;
import java.io.IOException;
import java.io.PrintWriter;
import java.text.ParseException;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author Secretaria-PC-04
 */
@WebServlet(name = "CadastrarCliente", urlPatterns = {"/CadastrarCliente"})
public class CadastrarCliente extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        request.setCharacterEncoding("UTF-8");
        String nomeCliente = request.getParameter("nomeCliente");
        String cpfCliente = request.getParameter("cpfCliente");
        String emailCliente = request.getParameter("emailCliente");
        String telefoneCliente = request.getParameter("telefoneCliente");
        String senhaCliente = request.getParameter("senhaCliente");
        String cepCliente = request.getParameter("cepCliente");
        String enderecoCliente = request.getParameter("enderecoCliente");
        int idCidade = Integer.parseInt(request.getParameter("idCidade"));
        // int idEstado = Integer.parseInt(request.getParameter("idEstado"));

        String mensagem = null;

        Cliente oCliente = new Cliente();
        oCliente.setNomeCliente(nomeCliente);
        oCliente.setCpfCliente(cpfCliente);
        oCliente.setEmailCliente(emailCliente);
        oCliente.setTelefoneCliente(telefoneCliente);
        oCliente.setSenhaCliente(senhaCliente);
        oCliente.setCepCliente(cepCliente);
        oCliente.setEnderecoCliente(enderecoCliente);
        oCliente.getCidade().setIdCidade(idCidade);
        //oCliente.getCidade().getEstado().setIdEstado(idEstado);

        try {
            GenericDAO dao = new ClienteImplDAO();
            if (dao.cadastrar(oCliente)) {
                mensagem = "Cliente cadastrado com sucesso!";
                request.setAttribute("mensagem", mensagem);
                response.sendRedirect("TipoController");
            } else {
                mensagem = "Problemas ao cadastrar Cliente. Verifique os dados informados e tente"
                        + " novamente! ";
                request.setAttribute("mensagem", mensagem);
                request.getRequestDispatcher("pedido.jsp").forward(request, response);
            }
        } catch (Exception ex) {
            System.out.println("Problemas no Servlet ao cadastrar Cliente! Erro: " + ex.getMessage());
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
