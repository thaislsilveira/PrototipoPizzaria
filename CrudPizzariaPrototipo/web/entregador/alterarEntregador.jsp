<%-- 
    Document   : alterarEntregador
    Created on : 27/10/2018, 21:18:38
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
                                        <h3>Alterar Cliente</h3>
                                    </div>
                                    <div class="features">
                                        <form name="alterarentregador" action="AlterarEntregador" method="POST" novalidate>
                                            <div class="form-group">
                                                <div class="form-line">
                                                    <input type="text" name="idEntregador" id="idEntregador" class="form-control" value="${entregador.idEntregador}" readonly="readonly"/>
                                                </div>
                                            </div>
                                            <div class="form-group">
                                                <div class="form-line">
                                                    <input type="text" name="nomeEntregador" id="nomeEntregador" class="form-control" value="${entregador.nomeEntregador}" size="50" maxlength="50"/>
                                                </div>
                                            </div>                                       
                                            <div class="form-group">       
                                                <button type="submit" class="btn btn-primary">Alterar</button>
                                                <input type="reset" class="btn btn-secondary" name="limpar" 
                                                       id="limpar" value="Limpar" />                                           
                                            </div>
                                        </form>
                                    </div>
                                </div>
                            </section><!--/#services-->
                        </div>
                    </main>                              
                </div>
            </div>
        </div>
       <%@ include file="../rodape.jsp" %>
</body>
<script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous"></script>
</html>