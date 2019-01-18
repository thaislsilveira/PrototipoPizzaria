/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package br.com.CrudPizzariaPrototipo.controller.funcionario;

import br.com.CrudPizzariaPrototipo.dao.FuncionarioImplDAO;
import br.com.CrudPizzariaPrototipo.dao.GenericDAO;
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
@WebServlet(name = "AlterarFuncionaio", urlPatterns = {"/AlterarFuncionario"})
public class AlterarFuncionaio extends HttpServlet {

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
        int idFuncionario = Integer.parseInt(request.getParameter("idFuncionario"));
        String nomeFuncionario = request.getParameter("nomeFuncionario");
        String emailFuncionario = request.getParameter("emailFuncionario");
        String senhaFuncionario = request.getParameter("senhaFuncionario");
        int idFuncao = Integer.parseInt(request.getParameter("idFuncao"));

        String mensagem = null;

        br.com.CrudPizzariaPrototipo.model.Funcionario oFuncionario = new br.com.CrudPizzariaPrototipo.model.Funcionario();
        oFuncionario.setNomeFuncionario(nomeFuncionario);
        oFuncionario.setEmailFuncionario(emailFuncionario);
        oFuncionario.setSenhaFuncionario(senhaFuncionario);
        oFuncionario.getFuncao().setIdFuncao(idFuncao);
        oFuncionario.setIdFuncionario(idFuncionario);

        try {
            GenericDAO dao = new FuncionarioImplDAO();
            if (dao.alterar(oFuncionario)) {
                mensagem = "Funcionário alterado com sucesso!";
            } else {
                mensagem = "Problemas ao alterado Funcionário. Verifique os dados informados e tente"
                        + " novamente! ";
            }
            request.setAttribute("mensagem", mensagem);
            request.getRequestDispatcher("ListarFuncionario").forward(request, response);
        } catch (Exception ex) {
            System.out.println("Problemas no Servlet ao alterado Funcionário! Erro: " + ex.getMessage());
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
