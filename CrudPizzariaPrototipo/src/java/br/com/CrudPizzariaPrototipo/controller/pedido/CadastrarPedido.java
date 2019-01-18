/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package br.com.CrudPizzariaPrototipo.controller.pedido;

import br.com.CrudPizzariaPrototipo.dao.GenericDAO;
import br.com.CrudPizzariaPrototipo.dao.PedidoImplDAO;
import br.com.CrudPizzariaPrototipo.model.Pedido;
import br.com.CrudPizzariaPrototipo.model.Produto;
import br.com.CrudPizzariaPrototipo.model.ProdutoPedido;
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
 * @author PC 05
 */
@WebServlet(name = "CadastrarPedido", urlPatterns = {"/CadastrarPedido"})
public class CadastrarPedido extends HttpServlet {

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
            throws ServletException, IOException, ParseException {
        response.setContentType("text/html;charset=UTF-8");
        request.setCharacterEncoding("UTF-8");
        Date dataHora = Conversoes.converterData(request.getParameter("dataHora"));
        String statusPedido = request.getParameter("statusPedido");
        int tipoPedido = Integer.parseInt(request.getParameter("tipoPedido"));
        float descontoProduto = Float.parseFloat(request.getParameter("descontoProduto"));
        float subTotal = Float.parseFloat(request.getParameter("subTotal"));
        float valorTotal = Float.parseFloat(request.getParameter("valorTotalProduto").replaceAll("[^\\d.]", ""));
        int idCliente = Integer.parseInt(request.getParameter("idCliente"));
        int idEntregador = Integer.parseInt(request.getParameter("idEntregador"));
        int idFuncionario = Integer.parseInt(request.getParameter("idFuncionario"));
        int idMesa = Integer.parseInt(request.getParameter("idMesa"));

        String mensagem = null;

        Pedido oPedido = new Pedido();
        oPedido.setDataHora(dataHora);
        oPedido.setStatusPedido(statusPedido);
        oPedido.setTipoPedido(tipoPedido);
        oPedido.setDesconto(descontoProduto);
        oPedido.setSubTotal(subTotal);
        oPedido.setValorTotal(valorTotal);
        oPedido.getCliente().setIdCliente(idCliente);
        oPedido.getEntregador().setIdEntregador(idEntregador);
        oPedido.getFuncionario().setIdFuncionario(idFuncionario);
        oPedido.getMesa().setIdMesa(idMesa);

        String[] checkedIds = request.getParameterValues("produtos");

        for (String checkedId : checkedIds) {
            ProdutoPedido prod = new ProdutoPedido();
            prod.setQtdPedido(1);
            Produto produto = new Produto();
            produto.setIdProduto(Integer.parseInt(checkedId));
            prod.setProduto(produto);
            oPedido.getProdutoPedidoList().add(prod);
        }

        try {
            GenericDAO dao = new PedidoImplDAO();
            if (dao.cadastrar(oPedido)) {
                mensagem = "Pedido cadastrado com sucesso!";
            } else {
                mensagem = "Problemas ao cadastrar Pedido. Verifique os dados informados e tente"
                        + " novamente! ";
            }
            request.setAttribute("mensagem", mensagem);
            request.getRequestDispatcher("ListarPedido").forward(request, response);
        } catch (Exception ex) {
            System.out.println("Problemas no Servlet ao cadastrar Pedido! Erro: " + ex.getMessage());
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
        try {
            processRequest(request, response);
        } catch (ParseException ex) {
            Logger.getLogger(CadastrarPedido.class.getName()).log(Level.SEVERE, null, ex);
        }
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
        try {
            processRequest(request, response);
        } catch (ParseException ex) {
            Logger.getLogger(CadastrarPedido.class.getName()).log(Level.SEVERE, null, ex);
        }
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
