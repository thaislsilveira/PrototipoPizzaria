<%-- 
    Document   : alterarCliente
    Created on : 27/10/2018, 22:04:36
    Author     : Thais Silveira
--%>

<%@page import="br.com.CrudPizzariaPrototipo.model.Estado"%>
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
                                    <h3>Alterar Cliente</h3>
                                </div>
                                <div class="features">
                                    <form name="alterarcliente" action="AlterarCliente" method="POST"> 
                                        <div class="control-group">
                                            <div class="controls">
                                                <label for="idCliente" class="col-sm-1">ID:</label>
                                                <div class="form-group col-sm-11">                                                  
                                                    <input type="text" name="idCliente" class="form-control" value="${cliente.idCliente}" readonly="readonly">
                                                </div>
                                            </div>
                                        </div> 	
                                        <div class="control-group">
                                            <div class="controls">
                                                <label for="emailCliente" class="col-sm-1">Email:</label>
                                                <div class="form-group col-sm-11">                                              
                                                    <input type="text" name="emailCliente" class="form-control" value="${cliente.emailCliente}">
                                                </div>
                                            </div>
                                        </div>
                                        <div class="control-group">
                                            <div class="controls">
                                                <label for="nomeCliente" class="col-sm-1">Nome:</label>
                                                <div class="form-group col-sm-11">    
                                                    <input type="text" class="form-control" name="nomeCliente" placeholder="Nome" value="${cliente.nomeCliente}">
                                                </div>
                                            </div>
                                        </div> 	
                                        <div class="control-group">
                                            <div class="controls">
                                                <div class="form-group">
                                                    <label for="cpfCliente" class="col-sm-1">CPF:</label>
                                                    <div class="form-group col-sm-11">  
                                                        <input type="text" class="form-control" name="cpfCliente" placeholder="CPF" value="${cliente.cpfCliente}">
                                                    </div>
                                                </div>
                                            </div> 
                                        </div>
                                        <div class="control-group">
                                            <div class="controls">
                                                <div class="form-group">
                                                    <label for="telefoneCliente" class="col-sm-1">Telefone:</label>
                                                    <div class="form-group col-sm-11">  
                                                        <input type="text" class="form-control" name="telefoneCliente" placeholder="Telefone" value="${cliente.telefoneCliente}">
                                                    </div>
                                                </div>
                                            </div> 
                                        </div>
                                        <div class="control-group">
                                            <div class="controls">
                                                <select name="idEstado" id="idEstado" class="form-control">
                                                    <%
                                                        List<Estado> estados = (List<Estado>) request.getAttribute("estados");
                                                        for (Estado estado : estados) {
                                                    %>               
                                                    <option value="<%= estado.getIdEstado()%>"<%=(((Cliente) request.getAttribute("cliente")).getCidade().getEstado().getIdEstado()) == estado.getIdEstado() ? "selected" : ""%>><%= estado.getIdEstado()%></option>                    
                                                    <% }%>
                                                </select>                                                                                             
                                            </div>
                                        </div>
                                        <div class="row">                                   
                                            <div class="col-md-6 col-sm-6 form-group ">  
                                                <label for="cepCliente" class="col-sm-1">CEP:</label>
                                                <input type="text" class="form-control" name="cepCliente" placeholder="CEP" value="${cliente.cepCliente}">
                                            </div>
                                            <div class="col-md-6 col-sm-6 form-group">   
                                                <select name="idCidade" id="idCidade" class="form-control">
                                                    <option>Selecione um estado</option>
                                                </select>
                                            </div>
                                        </div>
                                        <div class="controls">
                                            <div class="form-group">
                                                <label for="enderecoCliente" class="col-sm-1">Endereço:</label>
                                                <div class="form-group col-sm-11">  
                                                    <input type="text" class="form-control" name="enderecoCliente" placeholder="Endereço" value="${cliente.enderecoCliente}">
                                                </div>
                                            </div> 
                                            <div class="controls">
                                                <input type="submit" class="botao-pedido-cadastrar" name="alterar" 
                                                       id="cadastrar" value="Cadastrar" />
                                                <input type="reset" class="botao-pedido-limpar" name="limpar" 
                                                       id="limpar" value="Limpar" />     
                                            </div>
                                    </form>
                                </div>
                            </div>
                        </section>
                    </div>
                </main>
                <%@ include file="../rodape.jsp" %>
            </div>
        </div>     
    </body>
    <script src="https://code.jquery.com/jquery-3.3.1.min.js"></script>
    <script>
        $(window).ready(function () {
            $("#tipoPedido").on('change', function () {
                if ($(this).val() == '1') { //interno
                    $("#interno").show();
                    $("#externo").hide();
                } else if ($(this).val() == '2') { //externo
                    $("#interno").hide();
                    $("#externo").show();
                }
            });
            $("#tipoPedido").trigger('change');


            $("input[name=produtos], input[name=descontoProduto]").on('change', function () {
                var total = 0;
                $("input[name=produtos]:checked").each(function () {
                    total += parseFloat($(this).attr('data-preco'));
                });
                $("#subTotal").val(total);
                var desconto = isNaN(parseFloat($("#descontoProduto").val())) ? 0 : parseFloat($("#descontoProduto").val());
                total -= desconto;
                $("#valorTotalProduto").val("R$ " + total);
            });
        });

    </script>
</html>
