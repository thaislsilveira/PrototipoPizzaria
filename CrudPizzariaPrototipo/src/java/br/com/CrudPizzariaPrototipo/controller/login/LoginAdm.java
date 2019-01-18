/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package br.com.CrudPizzariaPrototipo.controller.login;

import br.com.CrudPizzariaPrototipo.dao.FuncionarioImplDAO;
import br.com.CrudPizzariaPrototipo.model.Funcionario;
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
@WebServlet(name = "LoginAdm", urlPatterns = {"/LoginAdm"})
public class LoginAdm extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        request.getRequestDispatcher("administrador.jsp").forward(request, response);
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

        boolean logged = false;
        Funcionario funcionario = new Funcionario();
        funcionario.setEmailFuncionario(request.getParameter("emailFuncionario"));
        funcionario.setSenhaFuncionario(request.getParameter("senhaFuncionario"));
        try {
            FuncionarioImplDAO dao = new FuncionarioImplDAO();
            if (dao.realizarLogin(funcionario)) {
                logged = true;
                dao = new FuncionarioImplDAO();
                funcionario = (Funcionario) dao.carregar(funcionario.getIdFuncionario());
                HttpSession session = request.getSession(true);
                session.setAttribute("funcionario", funcionario);
                response.sendRedirect("paineladm.jsp");
            } else {
                request.setAttribute("mensagem", "Usuário e/ou senha invalido(s).");
            }
        } catch (Exception ex) {
            System.out.println("Erro na controller login Administrador! Erro: " + ex.getMessage());
            request.setAttribute("mensagem", "Erro ao processar solicitação, tente novamente mais tarde.");
        } finally {
            if(!logged){
                request.getRequestDispatcher("administrador.jsp").forward(request, response);
            }
        }
    }

}
