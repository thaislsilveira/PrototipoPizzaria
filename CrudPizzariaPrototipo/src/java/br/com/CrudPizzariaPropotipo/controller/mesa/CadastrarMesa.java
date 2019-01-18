/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package br.com.CrudPizzariaPropotipo.controller.mesa;

import br.com.CrudPizzariaPrototipo.dao.GenericDAO;
import br.com.CrudPizzariaPrototipo.dao.MesaImplDAO;
import br.com.CrudPizzariaPrototipo.model.Mesa;
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
@WebServlet(name = "CadastrarMesa", urlPatterns = {"/CadastrarMesa"})
public class CadastrarMesa extends HttpServlet {

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

        int qtdCadeiras = Integer.parseInt(request.getParameter("qtdCadeiras"));
        int localMesa = Integer.parseInt(request.getParameter("localMesa"));

        String mensagem = null;

        Mesa oMesa = new Mesa();
        oMesa.setQtdCadeiras(qtdCadeiras);
        oMesa.setLocalMesa(localMesa);
       

        try {
            GenericDAO dao = new MesaImplDAO();
            if (dao.cadastrar(oMesa)) {
                mensagem = "Mesa cadastrado com sucesso!";
                request.setAttribute("mensagem", mensagem);
               request.getRequestDispatcher("ListarMesa").forward(request, response);
            } else {
                mensagem = "Problemas ao cadastrar Mesa. Verifique os dados informados e tente"
                        + " novamente! ";
                request.setAttribute("mensagem", mensagem);
                request.getRequestDispatcher("mesa/cadastrarMesa.jsp").forward(request, response);
            }
        } catch (Exception ex) {
            System.out.println("Problemas no Servlet ao cadastrar Mesa! Erro: " + ex.getMessage());
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
