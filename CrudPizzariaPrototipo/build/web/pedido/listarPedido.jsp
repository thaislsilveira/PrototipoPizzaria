<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@page import="br.com.CrudPizzariaPrototipo.model.Pedido"%>
<%@page import="java.util.List"%>
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
        <div class="content-body">
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
                                                <th class="text-center">Data e Hora</th>  
                                                <th class="text-center">Tipo de Pedido</th>    
                                                <th class="text-center">Desconto</th>    
                                                <th class="text-center">SubTotal</th>    
                                                <th class="text-center">valor Total</th>    
                                                <th class="text-center">Nome Entregador</th>    
                                                <th class="text-center">Nome Cliente</th>    
                                                <th class="text-center">ID da Mesa</th>    
                                                <th class="text-center">Editar</th>                                
                                            </tr>
                                        </thead>
                                        <%
                                            List<Pedido> pedidos = (List<Pedido>) request.getAttribute("pedidos");
                                            for (Pedido pedido : pedidos) {

                                        %>
                                        <tbody>
                                            <tr>
                                                <td><%=pedido.getIdPedido()%></td>
                                                <td><fmt:formatDate type="both" value="<%= pedido.getDataHora()%>"/></td>    
                                                <td><%=pedido.getTipoPedido()%> </td>  
                                                <td><%=pedido.getDesconto()%></td>  
                                                <td><%=pedido.getSubTotal()%></td>    
                                                <td><%=pedido.getValorTotal()%></td>                                              
                                                <td><%=pedido.getEntregador().getNomeEntregador()%></td>  
                                                <td><%=pedido.getCliente().getNomeCliente()%></td>  
                                                <td><%=pedido.getMesa().getIdMesa()%></td>  
                                                <td><a href="ExcluirPedido?idPedido=<%=pedido.getIdPedido()%>">Excluir</a> / <a href="CarregarPedido?idPedido=<%=pedido.getIdPedido()%>">Alterar</a></td>
                                            </tr>

                                            <% }%>
                                        </tbody>             
                                    </table>
                                </div>
                            </section>
                        </div>
                    </main>
                </div>
            </div>      
        </div>
        <%@ include file="../rodape.jsp" %>
    </body>
</html>

