<%-- 
    Document   : listarProduto
    Created on : 28/10/2018, 03:26:36
    Author     : Thais Silveira
--%>

<%@page import="br.com.CrudPizzariaPrototipo.model.Produto"%>
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
                                    <h2  style="margin-left: 200px;" class="section-title">LISTA DE PRODUTOS</h2>                            
                                </div>                       

                            </div>                        
                            <div class="table-responsive">
                                <table class="table table-striped text-center">
                                    <thead>
                                        <tr>
                                            <th class="text-center">ID</th>
                                            <th class="text-center">Categoria</th> 
                                            <th class="text-center">Nome</th> 
                                            <th class="text-center">Valor do Produto</th>
                                            <th class="text-center">Quantidade</th>
                                            <th class="text-center">Editar</th>                                
                                        </tr>
                                    </thead>
                                    <%
                                        List<Produto> produtos = (List<Produto>) request.getAttribute("produtos");
                                        for (Produto produto : produtos) {

                                    %>
                                    <tbody>
                                        <tr>
                                            <td><%=produto.getIdProduto()%></td>
                                            <td><%=produto.getTipoProduto()%></td>
                                            <td><%=produto.getNomeProduto()%></td>  
                                            <td><%=produto.getValorProduto()%></td>
                                            <td><%=produto.getQuantidade()%></td>  
                                            <td><a href="ExcluirProduto?idProduto=<%=produto.getIdProduto()%>">Excluir</a> / <a href="CarregarProduto?idProduto=<%=produto.getIdProduto()%>">Alterar</a></td>
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


