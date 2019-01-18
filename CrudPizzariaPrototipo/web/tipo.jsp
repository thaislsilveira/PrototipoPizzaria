<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@page import="br.com.CrudPizzariaPrototipo.model.Funcao"%>
<%@page import="br.com.CrudPizzariaPrototipo.model.Entregador"%>
<%@page import="br.com.CrudPizzariaPrototipo.model.Funcionario"%>
<%@page import="br.com.CrudPizzariaPrototipo.model.Mesa"%>
<%@page import="br.com.CrudPizzariaPrototipo.model.Cliente"%>
<%@page import="java.util.List"%>
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
        
        <!--[if lt IE 9]>
        <script src="js/html5shiv.js"></script>
        <script src="js/respond.min.js"></script>
        <![endif]-->
        <link rel="shortcut icon" href="${pageContext.request.contextPath}/images/ico/favicon.ico">
        <style lang="css">
            label.mesas {
                font-weight: 100;
                margin-right: 20px;
                display: inline-block;
                font-size: 20px;
                padding: 20px;
                font-weight: 400;
                text-align: center;
                color: #222;
                border: 1px solid #999;
                background: #FFF;
                box-shadow: 0 0 0 45px #FFF inset;
                transition: 200ms all;
                cursor: pointer;
                border-radius: 4px;
                position: relative;
            }

            input.mesas {
                display: none;
            }

            input.mesas:checked + label.mesas {
                box-shadow: 0 0 0 -1px #FFF inset;
                color: #FFF;
                background: #7EB634;
                border-color: #7EB634;
            }

            input.mesas:disabled + label.mesas {
                background: #f7f7f7;
                box-shadow: 0 0 0 45px #edcccc inset;
                cursor: default;
            }

            input.mesas:disabled + label.mesas:after {
                content: 'Indisponível';
                display: block;
                position: absolute;
                font-size: 13px;
                font-weight: 500;
                bottom: 4px;
                color: #ce3e3e;
                left: 0;
                right: 0;
            }
        </style>
    </head>

    <body id="home">       
        <%@ include file="cabecalho-cliente.jsp"%>         
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
                            <h2 class="section-title">PEDIDO</h2> 
                            <div class="features">
                                <section id="services" >
                                    <div class="container">    
                                        <div class="features">
                                            <div class="col-md-12 col-sm-6 wow fadeInUp"  data-wow-duration="300ms" data-wow-delay="200ms">
                                                <div class="pedido-form">
                                                    <div class="row">
                                                        <div class="col-md-10 d-block mx-auto">
                                                            <form method="POST" id="reserva-mesa">
                                                                <div class="row"> 
                                                                    <div class="col-md-12">
                                                                        <h3 class="mb-3">ESCOLHA O SABOR </h3> 
                                                                    </div>  
                                                                </div> 
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
                                                                                                        <label class=""><input type="checkbox" class=""  name="produtos" value="${produto.nomeProduto}" data-preco="${produto.valorProduto}" >
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
                                                                    <div class="form-group row">
                                                                        <label class="col-sm-2 col-form-label">Desconto: </label>
                                                                        <div class="col-sm-10">
                                                                            <input type="text" class="form-control-plaintext" name="descontoProduto" id="descontoProduto" placeholder="Desconto" >
                                                                        </div>
                                                                    </div>
                                                                    <div class="form-group row">
                                                                        <label class="col-sm-2 col-form-label">Total: </label>
                                                                        <div class="col-sm-10">
                                                                            <input type="text" readonly class="form-control-plaintext" name="valorTotalProduto" id="valorTotalProduto" placeholder="Valor Total" >
                                                                        </div>
                                                                    </div>
                                                                </div>
                                                                <div class="row">
                                                                    <h1> Reserva de Mesa </h1>     
                                                                    <div class="col-md-12">
                                                                        <div class="form-group"> 
                                                                            <label for="tipoPedido">Selecione uma Mesa: </label>
                                                                            <div>
                                                                                <%
                                                                                    List<Mesa> mesas = (List<Mesa>) request.getAttribute("mesas");
                                                                                    for (Mesa mesa : mesas) {
                                                                                %>
                                                                                <input class="mesas" type="radio" name="mesa" value="<%= mesa.getIdMesa()%>" id="<%= mesa.getIdMesa()%>" required/><label class="mesas" for="<%= mesa.getIdMesa()%>">Mesa <%= mesa.getIdMesa()%></label>

                                                                                <% }%>
                                                                            </div>
                                                                        </div>
                                                                    </div>
                                                                </div>
                                                                <div class="row">
                                                                    <div class="col-md-12 text-center">
                                                                        <div class="progress" style="height: 30px;margin-top: 30px;">
                                                                            <div class="progress-bar progress-bar-striped progress-bar-animated bg-info" role="progressbar" style="width: 25%;" aria-valuenow="25" aria-valuemin="0" aria-valuemax="100">Aguardando Pedido</div>
                                                                        </div>
                                                                    </div>
                                                                </div>
                                                                <div class="row">
                                                                    <div class="col-md-12 d-block mx-auto text-center">
                                                                        <button type="submit" class="btn btn-danger mx-auto">Pedir</button>                                                                     
                                                                    </div>
                                                                </div>
                                                            </form>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </section>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</section><!--/#services-->
<%@ include file="rodape.jsp"%>
</body>
<script src="https://code.jquery.com/jquery-3.3.1.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/lodash@4.17.11/lodash.min.js"></script>
<script>
    $(document).ready(function () {
        $("input[name=produtos], input[name=descontoProduto]").on('change', function () {
            var total = 0;
            $("input[name=produtos]:checked").each(function () {
                total += parseFloat($(this).attr('data-preco'));
            });
            var desconto = isNaN(parseFloat($("#descontoProduto").val())) ? 0 : parseFloat($("#descontoProduto").val());
            total -= desconto;
            $("#valorTotalProduto").val("R$ " + total);
        });
        function validarReservas() {
            var getReservas = JSON.parse(localStorage.getItem('reservas'));
            if (getReservas) {
                for (var reservasItem of getReservas) {
                    // console.log('item');
                    // console.log(reservasItem);
                    // Encontra o número das mesas já reservadas
                    var numeroMesa = reservasItem[_.findKey(reservasItem, ['name', 'mesa'])].value;
                    $('input.mesas[value="'+numeroMesa+'"]').prop('disabled', true);
                }
            }
        }
        validarReservas();
        $("#reserva-mesa").submit(function(e) {
            e.preventDefault();
            var reservasExistentes = JSON.parse(localStorage.getItem('reservas'));
            var reservas = [$(this).serializeArray()];
            // Validar se a mesa já não foi reservada
            if (reservasExistentes) {
                var reservasNovas = _.concat(reservasExistentes, reservas);
                console.log(reservasNovas);
                localStorage.setItem('reservas', JSON.stringify(reservasNovas));
            } else {
                localStorage.setItem('reservas', JSON.stringify(reservas));
            }
            $(this).trigger("reset");
            validarReservas();
            alert("Pedido realizado com sucesso");
            $('.progress-bar').html('Pedido em Produção');
            $('.progress-bar').removeClass('bg-info');
            $('.progress-bar').addClass('bg-success');
            $('.progress-bar').css('width', '75%');
            return false;
        });
    });

</script>

</html>