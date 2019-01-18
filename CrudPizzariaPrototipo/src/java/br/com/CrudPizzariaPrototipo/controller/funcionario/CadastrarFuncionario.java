/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package br.com.CrudPizzariaPrototipo.controller.funcionario;

import br.com.CrudPizzariaPrototipo.dao.FuncionarioImplDAO;
import br.com.CrudPizzariaPrototipo.dao.GenericDAO;
import br.com.CrudPizzariaPrototipo.model.Funcionario;
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
@WebServlet(name = "CadastrarFuncionario", urlPatterns = {"/CadastrarFuncionario"})
public class CadastrarFuncionario extends HttpServlet {

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
        String nomeFuncionario = request.getParameter("nomeFuncionario");
        String emailFuncionario = request.getParameter("emailFuncionario");
        String senhaFuncionario = request.getParameter("senhaFuncionario");
        int idFuncao = Integer.parseInt(request.getParameter("idFuncao"));

        String mensagem = null;

        Funcionario oFuncionario = new Funcionario();
        oFuncionario.setNomeFuncionario(nomeFuncionario);
        oFuncionario.setEmailFuncionario(emailFuncionario);
        oFuncionario.setSenhaFuncionario(senhaFuncionario);
        oFuncionario.getFuncao().setIdFuncao(idFuncao);

        try {
            GenericDAO dao = new FuncionarioImplDAO();
            if (dao.cadastrar(oFuncionario)) {
                mensagem = "Funcionário cadastrado com sucesso!";
            } else {
                mensagem = "Problemas ao cadastrar Funcionário. Verifique os dados informados e tente"
                        + " novamente! ";
            }
            request.setAttribute("mensagem", mensagem);
            request.getRequestDispatcher("ListarFuncionario").forward(request, response);
        } catch (Exception ex) {
            System.out.println("Problemas no Servlet ao cadastrar Funcionário! Erro: " + ex.getMessage());
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
