/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package br.com.CrudPizzariaPrototipo.controller.produto;

import br.com.CrudPizzariaPrototipo.dao.GenericDAO;
import br.com.CrudPizzariaPrototipo.dao.ProdutoImplDAO;
import br.com.CrudPizzariaPrototipo.model.Produto;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author Thais Silveira
 */
@WebServlet(name = "CadastrarProduto", urlPatterns = {"/CadastrarProduto"})
public class CadastrarProduto extends HttpServlet {

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
        request.setCharacterEncoding("UTF-8");
        String tipoProduto = request.getParameter("tipoProduto");
        String nomeProduto = request.getParameter("nomeProduto");
        Float valorProduto = Float.parseFloat(request.getParameter("valorProduto"));
        String quantidade = request.getParameter("quantidade");

        String mensagem = null;

        Produto oProduto = new Produto();
        oProduto.setTipoProduto(tipoProduto);
        oProduto.setNomeProduto(nomeProduto);
        oProduto.setValorProduto(valorProduto);
        oProduto.setQuantidade(quantidade);

        try {
            GenericDAO dao = new ProdutoImplDAO();
            if (dao.cadastrar(oProduto)) {
                mensagem = "Produto cadastrado com sucesso!";
            } else {
                mensagem = "Problemas ao cadastrar Produto. Verifique os dados informados e tente"
                        + " novamente! ";
            }
            request.setAttribute("mensagem", mensagem);
            request.getRequestDispatcher("ListarProduto").forward(request, response);
        } catch (Exception ex) {
            System.out.println("Problemas no Servlet ao cadastrar Produto! Erro: " + ex.getMessage());
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
