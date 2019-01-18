
<%@page import="br.com.CrudPizzariaPrototipo.model.Cidade"%>
<%@page import="br.com.CrudPizzariaPrototipo.model.Estado"%>
<%@page import="br.com.CrudPizzariaPrototipo.model.Cliente"%>
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
        <%@ include file="../cabecalho-cliente.jsp"%> 
        <link href="css/bootstrap.min.css" rel="stylesheet">
        <link href="css/font-awesome.min.css" rel="stylesheet">
        <link href="css/animate.min.css" rel="stylesheet"> 
        <link href="css/prettyPhoto.css" rel="stylesheet">
        <link href="css/styles.css" rel="stylesheet"> 
        <style>
            select.form-control{
                height: 34px !important;
            }
        </style>
        <section id="services" >
            <div class="container">
                <div class="section-header pedido">
                    <div class="row">
                        <div class="col-md-12 col-sm-6">
                            <h2 class="section-title">DADOS DO CLIENTE</h2> 
                            <p>Aqui você tem a liberdade de modificar seus dados.</p>
                        </div>                       
                    </div>
                </div> 
            </div>                
            <%
                Cliente cliente = (Cliente) request.getAttribute("cliente");
            %>
            <div class="row" style="margin-left: 150px;">
                <div class="col-md-10 col-sm-10">
                    ${mensagem}
                    <form name="listarcliente" action="AlterarCliente" method="POST">        
                        <input type="hidden" name="idCliente" value="<%=cliente.getIdCliente()%>">
                        <div class="control-group"> 
                            <div class="controls">
                                <div class="form-group left-inner-addon">                         
                                    <input type="text" name="emailCliente" class="form-control campo-listar" value="<%=cliente.getEmailCliente()%>">
                                </div>
                            </div>
                        </div> 	
                        <div class="control-group">
                            <div class="controls">
                                <div class="form-group left-inner-addon">                          
                                    <input type="password" name="senhaCliente" class="form-control campo-listar" value="<%=cliente.getSenhaCliente()%>">
                                </div>
                            </div>
                        </div> 
                        <div class="control-group">
                            <div class="controls">
                                <div class="form-group">
                                    <input type="text" class="form-control campo-listar" name="nomeCliente" value="<%=cliente.getNomeCliente()%>">
                                </div>
                            </div>
                        </div> 	
                        <div class="control-group">
                            <div class="controls">
                                <div class="form-group">
                                    <input type="text" class="form-control campo-listar" name="cpfCliente" value="<%=cliente.getCpfCliente()%>">
                                </div>
                            </div>
                        </div> 
                        <div class="row">                                   
                            <div class="col-md-4 form-group ">                                            
                                <input type="text" class="form-control campo-listar" name="telefoneCliente" value="<%=cliente.getTelefoneCliente()%>">
                            </div>  
                            <div class="col-md-4 form-group">  
                                <select name="idEstado" id="idEstado" class="form-control campo-listar">
                                    <%
                                        List<Estado> estados = (List<Estado>) request.getAttribute("estados");
                                        for (Estado estado : estados) {
                                    %>               
                                    <option value="<%= estado.getIdEstado()%>" <%= estado.getIdEstado() == cliente.getCidade().getEstado().getIdEstado() ? " selected" : ""%>><%= estado.getNomeEstado()%></option>                    
                                    <% }%>
                                </select>                         
                            </div>
                            <div class="col-md-4 form-group">   
                                <select name="idCidade" id="idCidade" class="form-control campo-listar">
                                    <%
                                        List<Cidade> cidades = (List<Cidade>) request.getAttribute("cidades");
                                        for (Cidade cidade : cidades) {
                                    %>               
                                    <option value="<%= cidade.getIdCidade()%>"<%= cidade.getIdCidade() == cliente.getCidade().getIdCidade() ? " selected" : ""%>><%= cidade.getNomeCidade()%></option>                    
                                    <% }%>
                                </select>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-md-6 col-sm-6 form-group ">                                            
                                <input type="text" class="form-control campo-listar" name="cepCliente" value="<%=cliente.getCepCliente()%>">
                            </div>                        
                            <div class="col-md-6 col-sm-6 form-group ">
                                <input type="text" class="form-control campo-listar" name="enderecoCliente" value="<%=cliente.getEnderecoCliente()%>">
                            </div>
                        </div>        
                        <div class="col-lg-12" style="text-align: center;">                       
                            <button type="submit" class="enviar">Alterar</button>
                        </div>         
                    </form>   
                </div>
            </div>
        </section><!--/#services-->
        <%@ include file="../rodape.jsp"%>   
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
            });
        </script>
    </body>
</html>