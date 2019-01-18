<%-- 
    Document   : paineladm
    Created on : 23/10/2018, 01:47:55
    Author     : Thais Silveira
--%>

<%@page import="br.com.CrudPizzariaPrototipo.model.Cliente"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="pt-br">
    <head>
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">       
        <link href="//maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css" rel="stylesheet">
        <title>Sistema de Padaria</title>
        <base href="${pageContext.request.contextPath}/">

        <!-- Bootstrap core CSS -->
        <link href="css/bootstrap.min.css" rel="stylesheet">
        <link href="css/font-awesome.min.css" rel="stylesheet">
        <link href="css/animate.min.css" rel="stylesheet">
        <link href="css/prettyPhoto.css" rel="stylesheet">
        <link href="css/styles.css" rel="stylesheet">
        <link href="css/painel-admin.css" rel="stylesheet">
    </head>

    <body>

        <%@ include file="cabecalho-adm.jsp"%>   
        <div class="container-fluid">
            <div class="row">           
                <%@ include file="sidebar.jsp"%>             
                <main role="main" class="col-md-12 ml-sm-auto col-lg-9 col-xl-10">
                    <div class="d-flex justify-content-between flex-wrap flex-md-nowrap align-items-center pb-2 mb-3 border-bottom">
                        <!-- Conteúdo -->
                        <section class="feedback page-section" id="feedback">
                            <div class="container">
                                <div class="heading">
                                    <h2>O que nossos Clientes estão comentando</h2>
                                </div>

                                <div class='row'>
                                    <div class='col-md-12'>
                                        <div class="carousel slide" data-ride="carousel" id="quote-carousel">
                                            <!-- Bottom Carousel Indicators -->
                                            <ol class="carousel-indicators">
                                                <li data-target="#quote-carousel" data-slide-to="0" class="active"></li>
                                                <li data-target="#quote-carousel" data-slide-to="1"></li>
                                                <li data-target="#quote-carousel" data-slide-to="2"></li>
                                            </ol>

                                            <!-- Carousel Slides / Quotes -->
                                            <div class="carousel-inner">
                                                <!-- Quote 1 -->
                                                <div class="item active">
                                                    <blockquote>
                                                        <div class="row">
                                                            <div class="col-sm-3 text-center">
                                                                <img class="img-circle" src="images/perfil1.jpg" style="width: 100px;height:100px;">
                                                            </div>
                                                            <div class="col-sm-9">
                                                                <p>As pizzas são bem leves e saborosas!</p>
                                                                <small>Joana</small>
                                                            </div>
                                                        </div>
                                                    </blockquote>
                                                </div>
                                                <!-- Quote 2 -->
                                                <div class="item">
                                                    <blockquote>
                                                        <div class="row">
                                                            <div class="col-sm-3 text-center">
                                                                <img class="img-circle" src="images/perfil2.jpg" style="width: 100px;height:100px;">
                                                            </div>
                                                            <div class="col-sm-9">
                                                                <p>O aplicativo é muito bom, pois agiliza os pedidos. Recomendo!</p>
                                                                <small>Carlos</small>
                                                            </div>
                                                        </div>
                                                    </blockquote>
                                                </div>
                                                <!-- Quote 3 -->
                                                <div class="item">
                                                    <blockquote>
                                                        <div class="row">
                                                            <div class="col-sm-3 text-center">
                                                                <img class="img-circle" src="images/perfil3.jpg" style="width: 100px;height:100px;">
                                                            </div>
                                                            <div class="col-sm-9">
                                                                <p>Tudo o que comprei chegou certinho, não tenho reclamações.</p>
                                                                <small>Simone</small>
                                                            </div>
                                                        </div>
                                                    </blockquote>
                                                </div>
                                            </div>
                                        </div>                          
                                    </div>
                                </div>-
                            </div>
                        </section>   
                    </div>                   
                    <div class="row mb-3">

                </main>
                <%@ include file="rodape.jsp" %>
            </div>
        </div>
    </div>

</body>
</html>
