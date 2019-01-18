<%-- 
    Document   : administrador
    Created on : 23/10/2018, 01:40:00
    Author     : Thais Silveira
--%>

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
                    <div class="pedido" style="">                      
                        <ul class="nav navbar-nav">
                            <a class="navbar-brand" style="" href="index.html"><img src="images/logo-Pizza.png" alt="logo"></a>                            
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
                        <div class="col-md-12 col-sm-12">
                            <h2 class="section-title">Login</h2>  
                        </div>
                    </div>
                </div>
                <div class="row">
                    <div class="col-md-offset-3 col-md-6 col-sm-12 wow fadeInUp" data-wow-duration="300ms" style="" data-wow-delay="200ms">
                        <div class="pedido-form">
                            <form name="sentMessage" id="contactForm" method="post"  novalidate action="LoginAdm">                                              
                                <div class="control-group">
                                    <img class="perfil" src="images/user.png" style="width: 100px;">

                                    <div class="controls">
                                        <div class="form-group left-inner-addon">
                                            <i class="fa fa-user"></i>
                                            <input type="text" name="emailFuncionario" class="form-control" placeholder="E-mail">
                                        </div>
                                    </div>
                                </div> 	
                                <div class="control-group">
                                    <div class="controls">
                                        <div class="form-group left-inner-addon">
                                            <i class="fa fa-key"></i>
                                            <input type="password" style="margin-bottom: 80px;" name="senhaFuncionario" class="form-control" placeholder="Senha">
                                        </div>
                                    </div>
                                </div>
                                <div class="control-group">
                                    <div class="controls">
                                        ${mensagem}
                                    </div>
                                </div>
                                <button type="submit" class=" botao-pedido-login"> Login </button><br />                                               
                            </form>
                        </div>
                    </div>
                </div>

            </div>
        </div><!--/.row-->    
    </div><!--/.container-->
</section><!--/#services-->
<%@ include file="rodape.jsp"%>   
</body>
<script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous"></script>
</html>
