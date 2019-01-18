<%-- 
    Document   : cadastrarFuncao
    Created on : 08/11/2018, 08:18:57
    Author     : PC 05
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
                                        <h3>Cadastro de Função</h3>
                                    </div>
                                    <div class="features">
                                        <form name="cadastrarfuncao" action="CadastrarFuncao" method="POST">                                              
                                            <div class="control-group">
                                                <div class="controls">
                                                    <div class="form-group left-inner-addon">                                                   
                                                        <input type="text" name="descricaoFuncao" class="form-control" placeholder="Descrição da Função">
                                                    </div>
                                                </div>
                                            </div> 
                                            <div class="controls">
                                                <input type="submit" class="btn btn-primary" name="cadastrar" 
                                                       id="cadastrar" value="Cadastrar" />
                                                <input type="reset" class="btn btn-secondary" name="limpar" 
                                                       id="limpar" value="Limpar" />     
                                            </div>
                                        </form>
                                    </div>
                                </div><!--/.row-->    
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

