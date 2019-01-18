/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package br.com.CrudPizzariaPrototipo.controller.funcionario;

import br.com.CrudPizzariaPrototipo.dao.FuncaoImplDAO;
import br.com.CrudPizzariaPrototipo.dao.FuncionarioImplDAO;
import br.com.CrudPizzariaPrototipo.dao.GenericDAO;
import br.com.CrudPizzariaPrototipo.dao.PedidoImplDAO;
import br.com.CrudPizzariaPrototipo.utils.Conversoes;
import java.io.IOException;
import java.io.PrintWriter;
import java.text.ParseException;
import java.util.Date;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author Thais Silveira
 */
@WebServlet(name = "CarregarFuncionario", urlPatterns = {"/CarregarFuncionario"})
public class CarregarFuncionario extends HttpServlet {

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
            throws ServletException, IOException{
        response.setContentType("text/html;charset=UTF-8");

        int idFuncionario = Integer.parseInt(request.getParameter("idFuncionario"));
        try {
      
            GenericDAO dao = new FuncionarioImplDAO();
            FuncaoImplDAO funcaoDAO = new FuncaoImplDAO();
            request.setAttribute("funcionario", dao.carregar(idFuncionario));
            request.setAttribute("funcoes", funcaoDAO.Listar());
            request.getRequestDispatcher("funcionario/alterarFuncionario.jsp").forward(request, response);
        } catch (Exception ex) {
            System.out.println("Erro na controller CarregarFuncionario: " + ex.getMessage());
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
