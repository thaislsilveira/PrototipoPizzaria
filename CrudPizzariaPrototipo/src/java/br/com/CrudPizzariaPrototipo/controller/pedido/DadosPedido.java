package br.com.CrudPizzariaPrototipo.controller.pedido;

import br.com.CrudPizzariaPrototipo.dao.ClienteImplDAO;
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
@WebServlet(name = "DadosPedido", urlPatterns = {"/DadosPedido"})
public class DadosPedido extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {

            Integer idPedido = Integer.parseInt(request.getParameter("idPedido"));
            GenericDAO dao = new PedidoImplDAO();
            request.setAttribute("pedido", dao.carregar(idPedido));
            ProdutoImplDAO produtoDAO = new ProdutoImplDAO();
            request.setAttribute("tipoprodutos", produtoDAO.ListarTipoProduto());
            produtoDAO = new ProdutoImplDAO();
            request.setAttribute("produtos", produtoDAO.Listar());
            GenericDAO oClienteDAO = new ClienteImplDAO();
            GenericDAO oMesaDAO = new MesaImplDAO();
            request.setAttribute("clientes", oClienteDAO.Listar());
            request.setAttribute("mesas", oMesaDAO.Listar());
            request.getRequestDispatcher("pedido/dadosPedido.jsp").forward(request, response);

        } catch (Exception e) {
            System.out.println("Problemas no Servlet ao carregar dados pedido! Erro: " + e.getMessage());
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
