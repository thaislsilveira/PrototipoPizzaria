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
        <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.5.0/css/all.css" integrity="sha384-B4dIYHKNBt8Bc12p+WXckhzcICo0wtJAoU8YZTY5qE0Id1GSseTk6S+L3BlXeVIU" crossorigin="anonymous">
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
        <%@ include file="../cabecalho-cliente.jsp"%> 
        <section id="services" >
            <div class="container">
                <div class="section-header pedido">
                    <div class="row">
                        <div class="col-md-12 col-sm-6">
                            <h2 class="section-title">MEUS PEDIDOS</h2> 
                            <p>Veja seus ultimos pedidos.</p>
                        </div>                       
                    </div>
                </div> 
            </div>                     
            <div class="table-responsive">
                <table class="table table-striped text-center">
                    <thead>
                        <tr>
                            <th class="text-center">Data e Hora</th>  
                            <th class="text-center">Tipo de Pedido</th>    
                            <th class="text-center">Desconto</th>    
                            <th class="text-center">SubTotal</th>    
                            <th class="text-center">Total</th>      
                            <th class="text-center">Editar</th>                                
                        </tr>
                    </thead>
                    <%
                        List<Pedido> pedidos = (List<Pedido>) request.getAttribute("pedidos");
                        for (Pedido pedido : pedidos) {

                    %>
                    <tbody>
                        <tr>
                            <td><fmt:formatDate type="both" value="<%= pedido.getDataHora()%>"/></td>    
                            <td><%=pedido.getTipoPedido()%> </td>  
                            <td><%=pedido.getDesconto()%></td>  
                            <td><%=pedido.getSubTotal()%></td>    
                            <td><%=pedido.getValorTotal()%></td>                             
                            <td><a href="DadosPedido?idPedido=<%=pedido.getIdPedido()%>">Ver</a></td>
                        </tr>
                        <% }%>
                    </tbody>             
                </table>
            </div>
        </section>
<%@ include file="../rodape.jsp" %>
</div>
</div>  
</body>
</html>

