<%@page import="br.com.CrudPizzariaPrototipo.model.Mesa"%>
<%@page import="java.util.List"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@page import="br.com.CrudPizzariaPrototipo.model.Pedido"%>
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
        <section id="services" >
            <div class="container">
                <div class="section-header pedido">
                    <div class="row">
                        <div class="col-md-12 col-sm-6">
                            <h2 class="section-title">DADOS DO PEDIDO</h2> 
                            <p>Aqui você tem a liberdade de modificar seus pedido.</p>
                        </div>                       
                    </div>
                </div> 
            </div>                
            <%
                Pedido pedido = (Pedido) request.getAttribute("pedido");
            %>
            <div class="row" style="margin-left: 150px;">
                <div class="col-md-10 col-sm-10">
                    <form name="listarpedido" action="AlterarPedido" method="POST">           
                        <input type="hidden" name="idPedido" value="<%=pedido.getIdPedido()%>">
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
                                                                <label class=""><input type="checkbox" class=""  name="produtos" value="${produto.idProduto}" data-preco="${produto.valorProduto}"<c:forEach var="produtoPedido" items="${pedido.produtoPedidoList}">
                                                                                           ${produtoPedido.produto.idProduto == produto.idProduto ? ' checked' : ''}
                                                                                       </c:forEach>>
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
                                    <input type="text" class="form-control-plaintext" name="descontoProduto" id="descontoProduto" value="${pedido.desconto}" >
                                </div>
                            </div>
                            <div class="form-group row">
                                <label class="col-sm-2 col-form-label">Total: </label>
                                <div class="col-sm-10">
                                    <input type="text" readonly class="form-control-plaintext" name="valorTotalProduto" id="valorTotalProduto" value="${pedido.valorTotal}" >
                                </div>
                            </div>
                        </div>
                        <div class="row">    
                            <div class="col-md-6">
                                <div class="form-group">
                                    <label  for="tipoPedido">Tipo do Pedido: ${pedido.tipoPedido eq 1 ? 'Interno' : 'Externo'}</label>
                                </div>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-md-12 text-center">
                                <div class="progress" style="height: 20px;">
                                    <c:choose>
                                        <c:when test="${pedido.statusPedido eq '1'}">
                                            <div class="progress-bar progress-bar-striped progress-bar-animated" role="progressbar" style="width: 50%;" aria-valuenow="50" aria-valuemin="0" aria-valuemax="100">EM PRODUÇÃO</div>
                                        </c:when>
                                        <c:otherwise>
                                            <div class="progress-bar progress-bar-success progress-bar-animated" role="progressbar" style="width: 100%;" aria-valuenow="100" aria-valuemin="0" aria-valuemax="100">FINALIZADO</div>
                                        </c:otherwise>
                                    </c:choose>
                                </div>
                            </div>
                        </div>
                </div>
                </form>   
            </div>
        </div>
    </section><!--/#services-->
    <%@ include file="../rodape.jsp"%> 
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
</body>
</html>