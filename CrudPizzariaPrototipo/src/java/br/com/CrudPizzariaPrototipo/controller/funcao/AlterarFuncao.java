/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package br.com.CrudPizzariaPrototipo.controller.funcao;

import br.com.CrudPizzariaPrototipo.dao.FuncaoImplDAO;
import br.com.CrudPizzariaPrototipo.dao.GenericDAO;
import br.com.CrudPizzariaPrototipo.model.Funcao;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author PC 05
 */
@WebServlet(name = "AlterarFuncao", urlPatterns = {"/AlterarFuncao"})
public class AlterarFuncao extends HttpServlet {

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
        Integer idFuncao = Integer.parseInt(request.getParameter("idFuncao"));
        String descricaoFuncao = request.getParameter("descricaoFuncao");
        String mensagem = null;

        Funcao oFuncao = new Funcao();
        oFuncao.setDescricaoFuncao(descricaoFuncao);
        oFuncao.setIdFuncao(idFuncao);

        try {
            GenericDAO dao = new FuncaoImplDAO();
            if (dao.alterar(oFuncao)) {
                mensagem = "Função alterado com sucesso!";
            } else {
                mensagem = "Problemas ao alterar função!";
            }

            request.setAttribute("mensagem", mensagem);
            request.getRequestDispatcher("ListarFuncao").forward(request, response);
        } catch (Exception ex) {
            System.out.println("Problemas no Servlet ao alterar funcao! Erro: " + ex.getMessage());
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
