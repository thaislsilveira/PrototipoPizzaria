/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package br.com.CrudPizzariaPrototipo.controller.pedido;

import br.com.CrudPizzariaPrototipo.dao.ClienteImplDAO;
import br.com.CrudPizzariaPrototipo.dao.EntregadorImplDAO;
import br.com.CrudPizzariaPrototipo.dao.FuncionarioImplDAO;
import br.com.CrudPizzariaPrototipo.dao.GenericDAO;
import br.com.CrudPizzariaPrototipo.dao.MesaImplDAO;
import br.com.CrudPizzariaPrototipo.dao.PedidoImplDAO;
import br.com.CrudPizzariaPrototipo.dao.ProdutoImplDAO;
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
@WebServlet(name = "CarregarPedido", urlPatterns = {"/CarregarPedido"})
public class CarregarPedido extends HttpServlet {

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

        int idPedido = Integer.parseInt(request.getParameter("idPedido"));
       
        try {

            GenericDAO dao = new PedidoImplDAO();
            request.setAttribute("pedido", dao.carregar(idPedido));
            
            GenericDAO oClienteDAO = new ClienteImplDAO();
            GenericDAO oEntregadorDAO = new EntregadorImplDAO();
            GenericDAO oFuncionarioDAO = new FuncionarioImplDAO();
            GenericDAO oMesaDAO = new MesaImplDAO();

            request.setAttribute("entregadores", oEntregadorDAO.Listar());
            request.setAttribute("clientes", oClienteDAO.Listar());
            request.setAttribute("funcionarios", oFuncionarioDAO.Listar());
            request.setAttribute("mesas", oMesaDAO.Listar());
            ProdutoImplDAO produtoDAO = new ProdutoImplDAO();
            request.setAttribute("tipoprodutos", produtoDAO.ListarTipoProduto());
            produtoDAO = new ProdutoImplDAO();
            request.setAttribute("produtos", produtoDAO.Listar());
            
            request.getRequestDispatcher("pedido/alterarPedido.jsp").forward(request, response);
        } catch (Exception ex) {
            System.out.println("Erro na controller CarregarPedido: " + ex.getMessage());
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
