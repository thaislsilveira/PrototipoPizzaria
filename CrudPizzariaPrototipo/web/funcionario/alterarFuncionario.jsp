<%-- 
    Document   : alterarFuncionario
    Created on : 28/10/2018, 02:01:37
    Author     : Thais Silveira
--%>
<%@page import="br.com.CrudPizzariaPrototipo.model.Funcionario"%>
<%@page import="br.com.CrudPizzariaPrototipo.model.Funcao"%>
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
        <!--[if lt IE 9]>
        <script src="js/html5shiv.js"></script>
        <script src="js/respond.min.js"></script>
        <![endif]-->       
        <link rel="shortcut icon" href="images/ico/favicon.ico"> 
    </head> 

    <body id="home">
        <div class="content-body">
            <%@ include file="../cabecalho-adm.jsp"%> 
            <link href="css/bootstrap.min.css" rel="stylesheet">
            <link href="css/font-awesome.min.css" rel="stylesheet">
            <link href="css/animate.min.css" rel="stylesheet"> 
            <link href="css/prettyPhoto.css" rel="stylesheet">
            <link href="css/styles.css" rel="stylesheet">         
            <div class="container-fluid">
                <div class="row"> 
                    <%@ include file="../sidebar.jsp"%> 
                    <main role="main" class="col-md-12 ml-sm-auto col-lg-9 col-xl-10">
                        <div class="d-flex justify-content-between flex-wrap flex-md-nowrap align-items-center pb-2 mb-3">
                            <!-- Conteúdo -->
                            <section id="services" >
                                <div class="container">    
                                    <div class="row mb-3 border-bottom">
                                        <h3>Alterar Funcionario</h3>
                                    </div>
                                    <div class="features">
                                        <form  name="alterarfuncionario" action="AlterarFuncionario" 
                                               method="POST">
                                            <div class="form-group">
                                                <div class="form-line">
                                                    <input type="text" name="idFuncionario" id="idFuncionario" class="form-control" value="${funcionario.idFuncionario}" readonly="readonly"/>
                                                </div>
                                            </div>
                                            <div class="form-group">
                                                <div class="form-line">
                                                    <input type="text" name="nomeFuncionario" id="nomeFuncionario" class="form-control" value="${funcionario.nomeFuncionario}" size="50" maxlength="50"/>
                                                </div>
                                            </div> 
                                            <div class="form-group">
                                                <div class="form-line">
                                                    <input type="text" name="emailFuncionario" id="emailFuncionario" class="form-control" value="${funcionario.emailFuncionario}" size="50" maxlength="50"/>
                                                </div>
                                            </div> 
                                            <div class="form-group">
                                                <div class="form-line">
                                                    <input type="password" name="senhaFuncionario" id="senhaFuncionario" class="form-control" value="${funcionario.senhaFuncionario}" size="50" maxlength="50"/>
                                                </div>
                                            </div> 
                                            <div class="control-group"> 
                                                <div class="controls">
                                                    <select name="idFuncao" id="idFuncao" class="form-control" style=" height: 40px;">
                                                        <%
                                                            List<Funcao> funcoes = (List<Funcao>) request.getAttribute("funcoes");
                                                            for (Funcao funcao : funcoes) {
                                                        %> 
                                                        <option value="<%= funcao.getIdFuncao()%>"<%=(((Funcionario) request.getAttribute("funcionario")).getFuncao().getIdFuncao()) == funcao.getIdFuncao() ? "selected" : ""%>><%= funcao.getDescricaoFuncao()%></option>                    
                                                        <% }%>
                                                    </select> 
                                                </div>
                                            </div>
                                            <div class="form-group">                                          
                                                <input type="submit" class="btn btn-primary"
                                                       name="Alterar" id="alterar" value="Alterar" />
                                                <input type="reset" class="btn btn-secondary" name="limpar" 
                                                       id="limpar" value="Limpar" />                                           
                                            </div>
                                        </form>
                                    </div>
                                </div>
                            </section>
                        </div>
                    </main>
                </div>
            </div>
        </div>
        <%@ include file="../rodape.jsp" %>
    </body>
    <script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous"></script>
</html>
