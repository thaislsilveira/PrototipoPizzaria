<%@page import="br.com.CrudPizzariaPrototipo.model.Cidade"%>
<%@page import="java.util.List"%>
<%@page import="br.com.CrudPizzariaPrototipo.model.Estado"%>
<%
    if (request.getSession().getAttribute("cliente") != null) {
        request.getRequestDispatcher("/index.jsp").forward(request, response);
    }
%>
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
                    <div class="pedido" style="margin-left:  35%;">                      
                        <ul class="nav navbar-nav">                           
                            <a class="navbar-brand" style="margin-left:  5px;" href="index.sjp"><img src="images/logo-Pizza.png" alt="logo"></a>                          
                        </ul> 
                    </div>    
                </div>
                </div><!--/.container-->
            </nav><!--/nav-->
        </header><!--/header-->
        <!--feedback-->
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
        <section id="services" >
            <div class="container">

                <div class="section-header pedido">
                    <div class="row">
                        <div class="col-md-6 col-sm-6">
                            <h2 class="section-title">Cadastro</h2> 
                        </div>
                        <div class="col-md-6 col-sm-6">
                            <h2 class="section-title">Login</h2>  
                        </div>
                    </div>
                </div>

                <div class="row">
                    <div class="features">
                        ${mensagem}
                        <div class="col-md-6 col-sm-6 wow fadeInUp" data-wow-duration="300ms" data-wow-delay="200ms">
                            <div class="pedido-form">
                                <form name="cadastrarcliente" action="CadastrarCliente" method="POST">                                              
                                    <div class="control-group">
                                        <img class="perfil" src="images/user.png" style="width: 100px;">

                                        <div class="controls">
                                            <div class="form-group left-inner-addon">
                                                <i class="fa fa-user"></i>
                                                <input type="text" name="emailCliente" class="form-control" placeholder="Email">
                                            </div>
                                        </div>
                                    </div> 	
                                    <div class="control-group">
                                        <div class="controls">
                                            <div class="form-group left-inner-addon">
                                                <i class="fa fa-key"></i>
                                                <input type="text" name="senhaCliente" class="form-control" placeholder="Senha">
                                            </div>
                                        </div>
                                    </div> 
                                    <div class="control-group">
                                        <div class="controls">
                                            <div class="form-group">
                                                <input type="text" class="form-control" name="nomeCliente" placeholder="Nome">
                                            </div>
                                        </div>
                                    </div> 	
                                    <div class="control-group">
                                        <div class="controls">
                                            <div class="form-group">
                                                <input type="text" class="form-control" name="cpfCliente" placeholder="CPF">
                                            </div>
                                        </div>
                                    </div> 
                                    <div class="row">                                   
                                        <div class="col-md-6 col-sm-6 form-group ">                                            
                                            <input type="text" class="form-control" name="telefoneCliente" placeholder="Telefone">
                                        </div>
                                        <div class="col-md-6 col-sm-6 form-group">  
                                            <select name="idEstado" id="idEstado" class="form-control">
                                                <%
                                                    List<Estado> estados = (List<Estado>) request.getAttribute("estados");
                                                    for (Estado estado : estados) {
                                                %>               
                                                <option value="<%= estado.getIdEstado()%>"><%= estado.getNomeEstado()%></option>                    
                                                <% }%>
                                            </select>                                                                                             
                                        </div>
                                    </div>
                                    <div class="row">                                   
                                        <div class="col-md-6 col-sm-6 form-group ">                                            
                                            <input type="text" class="form-control" name="cepCliente" placeholder="CEP">
                                        </div>
                                        <div class="col-md-6 col-sm-6 form-group">   
                                            <select name="idCidade" id="idCidade" class="form-control">
                                                <option>Selecione um estado</option>
                                            </select>
                                        </div>
                                    </div>
                                    <div class="controls">
                                        <div class="form-group">
                                            <input type="text" class="form-control" name="enderecoCliente" placeholder="Endereço">
                                        </div>
                                    </div> 
                                    <div class="controls">
                                        <input type="submit" class="botao-pedido-cadastrar" name="cadastrar" 
                                               id="cadastrar" value="Cadastrar" />
                                        <input type="reset" class="botao-pedido-limpar" name="limpar" 
                                               id="limpar" value="Limpar" />     
                                    </div>
                                </form>
                            </div>
                        </div><!--/.col-md-4-->


                        <div class="col-md-6 col-sm-6 wow fadeInUp" data-wow-duration="300ms" data-wow-delay="200ms">
                            <div class="pedido-form">

                                <form xid="contactForm" novalidate action="Login" method="POST">
                                    <div class="control-group">
                                        <img class="perfil" src="images/user.png" style="width: 100px;">

                                        <div class="controls">
                                            <div class="form-group left-inner-addon">
                                                <i class="fa fa-user"></i>
                                                <input type="text" name="emailCliente" class="form-control" placeholder="E-mail">
                                            </div>
                                        </div>
                                    </div> 	
                                    <div class="control-group">
                                        <div class="controls">
                                            <div class="form-group left-inner-addon">
                                                <i class="fa fa-key"></i>
                                                <input type="password" style="margin-bottom: 260px;" name="senhaCliente" class="form-control" placeholder="Senha">
                                            </div>
                                        </div>
                                    </div>                            
                                    <div id="success"> </div> <!-- For success/fail messages -->                                               
                                    <button type="submit" class="botao-pedido-login"> Login </button>
                                    <input type="reset" class="botao-pedido-limpar" name="limpar" 
                                           id="limpar" value="Limpar" />   
                                </form>
                            </div>
                        </div><!--/.col-md-4-->

                    </div>
                </div><!--/.row-->    
            </div><!--/.container-->
        </section><!--/#services-->
        <%@ include file="../rodape.jsp"%>   
    </body>
    <script src="https://code.jquery.com/jquery-3.3.1.min.js" ></script>    
    <script>
        $(window).ready(function () {
            $("#idEstado").on('change', function () {
                $.ajax({
                    type: 'POST',
                    url: 'CidadeController',
                    data: {'idEstado': $(this).val()},
                    beforeSend: function () {
                        $("#idCidade").empty();
                    },
                    success: function (data) {
                        if (!($.isEmptyObject(JSON.parse(data)))) {
                            $.each(JSON.parse(data), function (key, value) {
                                $("#idCidade").append($("<option>").val(value.idCidade).text(value.nomeCidade));
                            });
                            $("#idCidade").change();
                        }
                    }
                });
            });
            $("#idEstado").trigger('change');
        });
    </script>
</html>