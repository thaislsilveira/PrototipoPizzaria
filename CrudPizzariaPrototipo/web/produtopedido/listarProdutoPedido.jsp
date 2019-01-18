<%-- 
    Document   : listarProdutoPedido
    Created on : 25/11/2018, 12:47:35
    Author     : thais.silveira
--%>

<%@page import="java.util.List"%>
<%@page import="br.com.CrudPizzariaPrototipo.model.ProdutoPedido"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="pt-br">
    <head>
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <meta name="description" content="">
        <meta name="author" content="webthemez">
        <title>Projeto Pizzaria</title>
        <!-- core CSS -->
        <base href="${pageContext.request.contextPath}/">
        <link href="css/bootstrap.min.css" rel="stylesheet">
        <link href="css/font-awesome.min.css" rel="stylesheet">
        <link href="css/animate.min.css" rel="stylesheet"> 
        <link href="css/prettyPhoto.css" rel="stylesheet">
        <link href="css/styles.css" rel="stylesheet"> 
        <!--[if lt IE 9]>
        <script src="js/html5shiv.js"></script>
        <script src="js/respond.min.js"></script>
        <![endif]-->       
        <link rel="shortcut icon" href="${pageContext.request.contextPath}/images/ico/favicon.ico"> 
    </head> 
    <body id="home">
        <%@ include file="../cabecalho-adm.jsp"%> 
        <div class="container-fluid">
            <div class="row"> 
                <%@ include file="../sidebar.jsp"%>         
                <main role="main" class="col-md-12 ml-sm-auto col-lg-9 col-xl-10">
                    <div class="d-flex justify-content-between flex-wrap flex-md-nowrap align-items-center pb-2 mb-3">
                        <!-- Conteúdo -->
                        <section id="services" >
                            <div class="container">                   
                                <div class="row mb-3 border-bottom">  
                                    <h2  style="margin-left: 200px;" class="section-title">LISTA DE PEDIDOS</h2>                            
                                </div>   
                            </div>                        
                            <div class="table-responsive">
                                <table class="table table-striped text-center">
                                    <thead>
                                        <tr>
                                            <th class="text-center">ID</th>
                                            <th class="text-center">Quantidade de Pedidos</th>  
                                            <th class="text-center">Nome do Produto</th>    
                                            <th class="text-center">ID do Pedido</th> 
                                            <th class="text-center">Editar</th>                                
                                        </tr>
                                    </thead>
                                    <%
                                        List<ProdutoPedido> produtospedidos = (List<ProdutoPedido>) request.getAttribute("produtospedidos");
                                        for (ProdutoPedido produtopedido : produtospedidos) {

                                    %>
                                    <tbody>
                                        <tr>
                                            <td><%=produtopedido.getIdProdutoPedido()%></td>
                                            <td><%=produtopedido.getQtdPedido()%></td>    
                                            <td><%=produtopedido.getProduto().getNomeProduto()%></td>  
                                            <td><%=produtopedido.getPedido().getIdPedido()%></td>  
                                            <td><a href="ExcluirProdutoPedido?idProdutoPedido=<%=produtopedido.getIdProdutoPedido()%>">Excluir</a> / <a href="CarregarProdutoPedido?idPedido=<%=produtopedido.getIdProdutoPedido()%>">Alterar</a></td>
                                        </tr>

                                        <% }%>
                                    </tbody>             
                                </table>
                            </div>
                        </section>
                    </div>
                </main>
                <%@ include file="../rodape.jsp" %>
            </div>
        </div>  
    </body>
</html>
