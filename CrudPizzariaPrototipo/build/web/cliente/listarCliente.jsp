<%-- 
    Document   : listarCliente
    Created on : 13/10/2018, 16:53:56
    Author     : Thais Silveira
--%>

<%@page import="br.com.CrudPizzariaPrototipo.model.Cliente"%>
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
                                        <h2  style="margin-left: 200px;" class="section-title">LISTA DE CLIENTES</h2>                            
                                    </div>                       
                                </div>
                                <div class="table-responsive">
                                    <table class="table table-striped text-center">
                                        <thead>
                                            <tr>
                                                <th class="text-center">ID</th>
                                                <th class="text-center">Nome</th> 
                                                <th class="text-center">Cpf</th>
                                                <th class="text-center">Telefone</th>  
                                                <th class="text-center">Cep</th>
                                                <th class="text-center">Endereço</th>  
                                                <th class="text-center">Cidade</th>
                                                <th class="text-center">Estado</th>  
                                                <th class="text-center">Email</th>
                                                <th class="text-center">Editar</th>                                
                                            </tr>
                                        </thead>
                                        <%
                                            List<Cliente> clientes = (List<Cliente>) request.getAttribute("clientes");
                                            for (Cliente cliente : clientes) {

                                        %>
                                        <tbody>
                                            <tr>
                                                <td><%=cliente.getIdCliente()%></td>
                                                <td><%=cliente.getNomeCliente()%></td>  
                                                <td><%=cliente.getCpfCliente()%></td>
                                                <td><%=cliente.getTelefoneCliente()%></td>  
                                                <td><%=cliente.getCepCliente()%></td>
                                                <td><%=cliente.getEnderecoCliente()%></td>  
                                                <td><%=cliente.getCidade().getNomeCidade()%></td>
                                                <td><%=cliente.getCidade().getEstado().getNomeEstado()%></td>  
                                                <td><%=cliente.getEmailCliente()%></td>                               
                                                <td><a href="ExcluirCliente?idCliente=<%=cliente.getIdCliente()%>">Excluir</a> / <a href="CarregarCliente?idCliente=<%=cliente.getIdCliente()%>">Alterar</a></td>
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
