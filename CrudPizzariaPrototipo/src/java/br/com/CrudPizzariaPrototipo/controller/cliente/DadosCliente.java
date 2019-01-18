/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package br.com.CrudPizzariaPrototipo.controller.cliente;

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
 * @author Thais Silveira
 */
@WebServlet(name = "DadosCliente", urlPatterns = {"/DadosCliente"})
public class DadosCliente extends HttpServlet {

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
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {

            HttpSession session = request.getSession(true);
            Cliente cliente = (Cliente) session.getAttribute("cliente");
            // verificar se está logado ou não
            if(cliente == null){
                response.sendRedirect(request.getContextPath()+"/Clientes");
            }
            // vai ter de fazer esta verificação em toads as paginas que utilizam de sessão.

            GenericDAO dao = new ClienteImplDAO();
            request.setAttribute("cliente", dao.carregar(cliente.getIdCliente()));
           GenericDAO oEstadoDAO = new EstadoImplDAO();
           GenericDAO oCidadeDAO = new CidadeImplDAO();          
           request.setAttribute("cidades", oCidadeDAO.Listar());
           request.setAttribute("estados", oEstadoDAO.Listar());
            request.getRequestDispatcher("cliente/dadosCliente.jsp").forward(request, response);

        } catch (Exception e) {
            System.out.println("Problemas no Servlet ao carregar dados cliente! Erro: " + e.getMessage());
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
