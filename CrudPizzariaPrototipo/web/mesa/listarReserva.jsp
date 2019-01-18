<%-- 
    Document   : listarReserva
    Created on : 22/11/2018, 09:00:23
    Author     : thais.silveira
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
                                        <h2  style="width: 100%; text-align: center;" class="section-title">LISTA DE RESERVAS</h2>
                                    </div>
                                </div>
                                <div class="table-responsive">
                                    <table class="table table-striped text-center">
                                        <thead>
                                            <tr>
                                                <th class="text-center">ID</th>
                                                <th class="text-center">Sabores</th>
                                                <th class="text-center">Desconto</th>
                                                <th class="text-center">Valor Total</th>
                                                <th class="text-center">Nº da Mesa Reservada</th>
                                            </tr>
                                        </thead>
                                        <tbody class="reservas-tbody">
                                            <tr class="carregando">
                                                <td colspan="5">Carregando...</td>
                                            </tr>
                                            <tr class="sem-reserva" style="display: none;">
                                                <td colspan="5">Nenhuma reserva cadastrada.</td>
                                            </tr>
                                        </tbody>
                                    </table>
                                </div>
                            </section>
                        </div>
                    </main>
                </div>
            </div>
        </div>
        <%@ include file="../rodape.jsp" %>
        <script src="https://code.jquery.com/jquery-3.3.1.min.js"></script>
        <script src="https://cdn.jsdelivr.net/npm/lodash@4.17.11/lodash.min.js"></script>
        <script>
        $(document).ready(function () {
            var getReservas = JSON.parse(localStorage.getItem('reservas'));
            if (getReservas) {
                var id = 0;
                for (var reservasItem of getReservas) {
                    id++;
                    var products = "";
                    var descontProducts = "";
                    var totalValueProducts = "";
                    var table = "";
                    console.log('item');
                    for (var item of reservasItem) {
                        if (item.name === "produtos") {
                            products = products + "<div>• " + item.value + "</div>";
                        }
                        if (item.name === "descontoProduto") {
                            descontProducts = "R$ " + (item.value ? item.value : 0) + "";
                        }
                        if (item.name === "valorTotalProduto") {
                            totalValueProducts = item.value;
                        }
                        if (item.name === "mesa") {
                            table = item.value;
                        }
                    }

                    var tr = "<tr>" +
                        "<td>" + id + "</td>" +
                        "<td>" + products + "</td>" +
                        "<td>" + descontProducts + "</td>" +
                        "<td>" + totalValueProducts + "</td>" +
                        "<td>" + table + "</td>" +
                        "</tr>";
                    $('.reservas-tbody').append(tr);
                }
                $('.carregando').hide();
            } else {
                $('.carregando').hide();
                $('.sem-reserva').show();
            }
        });
        </script>
    </body>
</html>
