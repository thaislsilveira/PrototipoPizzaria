<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%-- 
    Document   : local
    Created on : 20/10/2018, 23:56:44
    Author     : Thais Silveira
--%>

<%@page import="br.com.CrudPizzariaPrototipo.model.Cliente"%>
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
        <link href="css/bootstrap.min.css" rel="stylesheet">
        <link href="css/font-awesome.min.css" rel="stylesheet">
        <link href="css/animate.min.css" rel="stylesheet"> 
        <link href="css/prettyPhoto.css" rel="stylesheet">
        <link href="css/styles.css" rel="stylesheet"> 
        <!--[if lt IE 9]>
        <script src="js/html5shiv.js"></script>
        <script src="js/respond.min.js"></script>
        <![endif]-->       
        <link rel="shortcut icon" href="images/ico/favicon.ico"> 
    </head> 

    <body id="home">
        <header id="header">
            <nav id="main-nav" class="navbar navbar-default">
                <div class="container">   
                    <div class="pedido" style="
                         margin-left:  35%;
                         ">                      
                        <ul class="nav navbar-nav">
                            <a class="navbar-brand" style="
                               margin-left:  5px;
                               " href="index.html"><img src="images/logo-Pizza.png" alt="logo"></a>                            
                            <li style="margin-left:  200px;" class="scroll active"><a href="ListarCliente">Seja bem-vindo(a) <%= (request.getSession().getAttribute("cliente") != null) ? ((Cliente) request.getSession().getAttribute("cliente")).getNomeCliente() : "Visitante"%>!</a></li>
                            <li  style="margin-left:  5px;" class="scroll active"><a href="index.jsp">Voltar</a></li>
                            <li class="scroll active float-right" style="margin-left:  5px;">
                                <a class="btn btn-outline-primary nav-link" href="${pageContext.request.contextPath}/sair">Sair</a>
                            </li>
                        </ul> 
                    </div>    
                </div>
                </div><!--/.container-->
            </nav><!--/nav-->
        </header><!--/header-->
        <!--feedback-->
        <section id="services" >
            <div class="container">

                <div class="section-header pedido">
                    <div class="row">
                        <div class="col-md-12 col-sm-6">
                            <h2 class="section-title">LOCAL</h2> 
                        </div>                       
                    </div>
                </div>
                <div class="col-md-6 col-sm-6 wow fadeInUp" data-wow-duration="300ms" data-wow-delay="100ms">
                    <div class="pedido-form" style="height: 360px;">
                        <div class="ftco-animate p-md-5 fadeInUp ftco-animated">
                            <div class="row">
                                <h3> Escolha seu sabor </h3>
                                <div class="col-md-12 nav-link-wrap mb-5">
                                    <div class="nav ftco-animate nav-pills fadeInUp ftco-animated" id="v-pills-tab" role="tablist" aria-orientation="vertical">
                                        <c:forEach var="tipoProduto" items="${tipoprodutos}">
                                            <a class="nav-link" id="v-pills-${fn:replace(tipoProduto.tipoProduto,' ', '')}-tab" data-toggle="pill" href="#v-pills-${fn:replace(tipoProduto.tipoProduto,' ', '')}" role="tab" aria-controls="v-pills-${fn:replace(tipoProduto.tipoProduto,' ', '')}" aria-selected="true">${tipoProduto.tipoProduto}</a> /
                                        </c:forEach>
                                    </div>
                                </div>
                                <div class="d-flex align-items-center">
                                    <div class="tab-content" id="v-pills-tabContent">
                                        <c:forEach var="tipoProduto" items="${tipoprodutos}">
                                            <div class="tab-pane fade" id="v-pills-${fn:replace(tipoProduto.tipoProduto,' ', '')}" role="tabpanel" aria-labelledby="v-pills-${fn:replace(tipoProduto.tipoProduto,' ', '')}-tab">
                                                <div class="row">
                                                    <c:forEach var="produto" items="${produtos}">
                                                        <c:if test="${produto.tipoProduto eq tipoProduto.tipoProduto}">
                                                            <div class="menu-wrap">                                                       
                                                                <div class="text">
                                                                    <input type="checkbox" id="prod-${produto.idProduto}" name="produtos"
                                                                           value="${produto.idProduto}" data-preco="${produto.valorProduto}" />
                                                                    <label for="prod-${produto.idProduto}">${produto.nomeProduto} <span class="number">R$ ${produto.valorProduto}</span></label>
                                                                </div>
                                                            </div>  
                                                        </c:if>
                                                    </c:forEach>
                                                </div>
                                            </div>
                                        </c:forEach>
                                        <br/>
                                        <div class="row"> 
                                            <div class="col-md-6 col-sm-6 form-group">                                            
                                                <input  type="text" style="margin-left: 70px;" class="form-control" name="totalProduto" placeholder="Total">
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>                       
                    </div>                    
                </div>
                <div class="col-md-6 col-sm-6 wow fadeInUp" data-wow-duration="300ms" data-wow-delay="200ms">
                    <div class="pedido-form">                        
                        <div class="row">                                   
                            <div class="col-md-12 col-sm-12 form-group ">                                            
                                <input style="height: 95px;" type="text" class="form-control" name="adicionaisProduto" placeholder="Adicionais">
                            </div>                                    
                        </div>
                        <div class="row">                                   
                            <div class="col-md-6 col-sm-6 form-group ">                                            
                                <input type="text" class="form-control" name="descontoProduto" placeholder="Desconto">
                            </div>
                            <div class="col-md-6 col-sm-6 form-group">                                            
                                <input type="text" class="form-control" name="valorTotalProduto" placeholder="Valor Total">
                            </div>
                        </div>                                                            
                        <div class="row">                                   
                            <div class="col-md-3 col-sm-6 form-group ">                                            
                                <input type="text" class="form-control" name="mesa" placeholder="Mesa">
                            </div>
                            <div class="col-md-3 col-sm-6 form-group">                                            
                                <input type="text" class="form-control" name="qtdCadeiras" placeholder="Quantidade de Cadeiras">
                            </div>
                            <div class="col-md-3 col-sm-6 form-group">                                            
                                <input type="text" class="form-control" name="status" placeholder="Status">
                            </div>
                            <div class="col-md-3 col-sm-6 form-group">                                            
                                <input type="text" class="form-control" name="local" placeholder="Local">
                            </div>
                        </div> 
                        <div class="row">                                   
                            <div class="col-md-6 col-sm-6 form-group ">                                            
                                <input type="text" class="form-control" name="nomFuncionario" placeholder="Funcionário">
                            </div>
                            <div class="col-md-6 col-sm-6 form-group">                                            
                                <input type="text" class="form-control" name="funcao" placeholder="Função">
                            </div>
                        </div>     
                        </form>
                        <progress value="22" max="100"></progress>
                        <div class="row">
                            <div class="col-md-6 col-sm-6" >
                                <button style="margin-left: 60%;" type="submit" class=" botao-pedido">Alterar</button><br /> 
                            </div>
                            <div class="col-md-6 col-sm-6 ">
                                <button style="margin-left: -15%;" type="submit" class=" botao-pedido">Excluir</button><br />     
                            </div>
                        </div>
                    </div>
                </div><!--/.col-md-4-->
            </div>
        </div>
    </div><!--/.row-->    
</div><!--/.container-->
</section><!--/#services-->
<%@ include file="rodape.jsp"%>   
</body>
<script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous"></script>
</html>
