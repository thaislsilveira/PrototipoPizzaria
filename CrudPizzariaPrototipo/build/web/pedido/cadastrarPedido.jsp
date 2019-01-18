<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<%@page import="java.util.List"%>
<%@page import="br.com.CrudPizzariaPrototipo.model.Mesa"%>
<%@page import="br.com.CrudPizzariaPrototipo.model.ProdutoPedido"%>
<%@page import="br.com.CrudPizzariaPrototipo.model.Funcionario"%>
<%@page import="br.com.CrudPizzariaPrototipo.model.Entregador"%>
<%@page import="br.com.CrudPizzariaPrototipo.model.Cliente"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
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
                                    <h3>Cadastro de Pedido</h3>
                                </div>
                                <div class="features">
                                    <div class="col-md-12 col-sm-6 wow fadeInUp"  data-wow-duration="300ms" data-wow-delay="200ms">
                                        <div class="pedido-form">
                                            <div class="row">
                                                <div class="col-md-10 d-block mx-auto">
                                                    <form method="POST" action="CadastrarPedido">
                                                        <div class="row"> 
                                                            <div class="col-md-12">
                                                                <h3 class="mb-3">ESCOLHA O SABOR </h3> 
                                                            </div>  
                                                        </div> 
                                                        <div class="ftco-animate p-md-5 fadeInUp ftco-animated">                                                          
                                                            <div class="row">
                                                                <div class="col-md-12">
                                                                    <div class="nav nav-tabs fadeInUp ftco-animated" id="v-pills-tab" role="tablist" aria-orientation="vertical">
                                                                        <c:forEach var="tipoProduto" items="${tipoprodutos}" varStatus = "status">
                                                                            <a class="nav-link ${status.first ? 'active' : ''}" id="v-pills-${fn:replace(tipoProduto.tipoProduto,' ', '')}-tab" data-toggle="pill" href="#v-pills-${fn:replace(tipoProduto.tipoProduto,' ', '')}" role="tab" aria-controls="v-pills-${fn:replace(tipoProduto.tipoProduto,' ', '')}" aria-selected="true">${tipoProduto.tipoProduto}</a>
                                                                        </c:forEach>
                                                                    </div>
                                                                    <div class="tab-content" id="v-pills-tabContent">
                                                                        <c:forEach var="tipoProduto" items="${tipoprodutos}" varStatus="status">
                                                                            <div class="tab-pane fade ${status.first ? 'show active' : ''}" id="v-pills-${fn:replace(tipoProduto.tipoProduto,' ', '')}" role="tabpanel" aria-labelledby="v-pills-${fn:replace(tipoProduto.tipoProduto,' ', '')}-tab">
                                                                                <c:forEach var="produto" items="${produtos}">
                                                                                    <c:if test="${produto.tipoProduto eq tipoProduto.tipoProduto}">
                                                                                        <div class="row">
                                                                                            <div class="form-check form-check-inline">
                                                                                                <label class=""><input type="checkbox" class=""  name="produtos" value="${produto.idProduto}" data-preco="${produto.valorProduto}" >
                                                                                                    ${produto.nomeProduto} R$ ${produto.valorProduto}</label>
                                                                                            </div>
                                                                                        </div>
                                                                                    </c:if>
                                                                                </c:forEach>
                                                                            </div>
                                                                        </c:forEach>
                                                                    </div>
                                                                </div>
                                                            </div>
                                                            <input type="hidden" name="subTotal" id="subTotal">
                                                            <div class="form-group row">
                                                                <label class="col-sm-2 col-form-label">Desconto: </label>
                                                                <div class="col-sm-10">
                                                                    <input type="text" class="form-control-plaintext" name="descontoProduto" id="descontoProduto" placeholder="Desconto" >
                                                                </div>
                                                            </div>
                                                            <div class="form-group row">
                                                                <label class="col-sm-2 col-form-label">Total: </label>
                                                                <div class="col-sm-10">
                                                                    <input type="text" readonly class="form-control-plaintext" name="valorTotalProduto" id="valorTotalProduto" placeholder="Valor Total" >
                                                                </div>
                                                            </div>
                                                        </div>
                                                        <div class="row">
                                                            <div class="col-md-12 form-group ">  
                                                                <label  for="idCliente">Cliente: </label>
                                                                <select class="form-control" name="idCliente" id="idCliente" style=" height: 40px;">
                                                                    <c:forEach var="cliente" items="${clientes}">
                                                                        <option value="${cliente.idCliente}">${cliente.nomeCliente}</option>
                                                                    </c:forEach>
                                                                </select>
                                                            </div>
                                                        </div>
                                                        <div class="row">    
                                                            <div class="col-md-6">
                                                                <div class="form-group">
                                                                    <label  for="tipoPedido">Tipo do Pedido: </label>
                                                                    <select class="form-control" name="tipoPedido" id="tipoPedido" style=" height: 40px;">
                                                                        <option value="1">Interno</option>
                                                                        <option value="2">Externo</option>
                                                                    </select>
                                                                </div>
                                                            </div>
                                                            <div class="col-md-6">

                                                                <div id="interno">                                                            
                                                                    <div class="row">                                   
                                                                        <div class="col-md-12">
                                                                            <div class="form-group"> 
                                                                                <label  for="tipoPedido">Mesa: </label>
                                                                                <select class="form-control" name="idMesa" id="idMesa" style=" height: 40px;">
                                                                                    <%
                                                                                        List<Mesa> mesas = (List<Mesa>) request.getAttribute("mesas");
                                                                                        for (Mesa mesa : mesas) {
                                                                                    %>               
                                                                                    <option value="<%= mesa.getIdMesa()%>"><%= mesa.getIdMesa()%></option>                    
                                                                                    <% }%>
                                                                                </select>
                                                                            </div>
                                                                        </div>
                                                                    </div>
                                                                    <div class="row"> 
                                                                        <div class="col-md-12">   
                                                                            <div class="form-group">
                                                                                <label  for="tipoPedido">Status do Pedido: </label>
                                                                                <select class="form-control" name="status" id="status" style=" height: 40px;">
                                                                                    <option value="1">Preparo</option>
                                                                                    <option value="2">Finalizado</option>
                                                                                </select>
                                                                            </div>
                                                                        </div>                                                         
                                                                    </div> 
                                                                    <div class="row">                                   
                                                                        <div class="col-md-12 form-group ">  
                                                                            <label  for="tipoPedido">Nome do Funcionário: </label>
                                                                            <select class="form-control" name="idFuncionario" id="idFuncionario" style=" height: 40px;">
                                                                                <c:forEach var="funcionario" items="${funcionarios}">
                                                                                    <option value="${funcionario.idFuncionario}">${funcionario.nomeFuncionario}</option>
                                                                                </c:forEach>
                                                                            </select>
                                                                        </div>
                                                                    </div>  
                                                                </div>   
                                                                <div id="externo">    


                                                                    <div class="row">                                   
                                                                        <div class="col-md-12 form-group ">  
                                                                            <label  for="idEntregador">Entregador: </label>
                                                                            <select class="form-control" name="idEntregador" id="idEntregador" style=" height: 40px;">
                                                                                <c:forEach var="entregador" items="${entregadores}">
                                                                                    <option value="${entregador.idEntregador}">${entregador.nomeEntregador}</option>
                                                                                </c:forEach>
                                                                            </select>
                                                                        </div>
                                                                    </div>  
                                                                </div>
                                                            </div>
                                                        </div>
                                                        <div class="row">
                                                            <div class="col-md-12 text-center">
                                                                <div class="progress" style="height: 20px;">
                                                                    <div class="progress-bar progress-bar-animated" role="progressbar" style="width: 25%;" aria-valuenow="25" aria-valuemin="0" aria-valuemax="100">EM PRODUÇÃO</div>
                                                                </div>
                                                            </div>
                                                        </div>
                                                        <div class="row">
                                                            <div class="col-md-12 d-block mx-auto text-center">
                                                                <button type="submit" class="btn btn-danger mx-auto">Cadastrar</button>
                                                                <button type="submit" class="btn btn-danger mx-auto">Excluir</button>  
                                                            </div>  
                                                        </div>
                                                    </form>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
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
