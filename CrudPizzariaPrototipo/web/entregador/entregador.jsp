<%-- 
    Document   : Fornecedor
    Created on : 27/10/2018, 19:13:57
    Author     : Thais Silveira
--%>
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
                            <li style="margin-left:  250px;" class="scroll active"><a href="index.html#home">Cadastrar</a></li>                            
                        </ul> 
                    </div>    
                </div>
                </div><!--/.container-->
            </nav><!--/nav-->
        </header><!--/header-->
        <!--feedback-->
        <br/>
        <%@ include file="sidebar.jsp"%> 

        <div class="col-md-10">
            <section id="services" >
                <div class="container">                   
                    <div class="row">
                        <div class="col-md-8">
                            <h3 style="margin-left: 200px;">Fornecedores</h3>
                            <br/>
                            <div class="features">
                                <a style="margin-left: 50px;" href="ListarEntregador"> Lista de Entregadores</a>
                                <a  style="margin-left: 200px;" href="cadastrarentregador.jsp"> Cadastro de Entregadores</a>
                            </div>
                        </div>
                    </div><!--/.row-->    
                </div><!--/.container-->
            </section><!--/#services-->
        </div>
        <div class="limpar-caixa"></div>
        <%@ include file="../rodape.jsp"%>   
    </body>
    <script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous"></script>
</html>
