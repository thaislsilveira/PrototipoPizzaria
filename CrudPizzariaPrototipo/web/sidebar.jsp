<%-- 
    Document   : sidebar
    Created on : 23/10/2018, 01:50:02
    Author     : Thais Silveira
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link href="//maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css" rel="stylesheet">
    </head>
    <body>
        <nav class="navbar navbar-expand-lg d-none d-lg-block sidebar col-2">
            <!-- menu -->
            <div class="menu sidebar-sticky">
                <ul class="nav flex-column">
                    <li class="nav-item">  
                        <div class="btn-group">
                            <button href="paineladm.jsp" type="button" class="btn btn-light">
                                <span data-feather="home"></span>
                                Home
                            </button>
                        </div>
                    </li>
                    <li class="nav-item">
                        <div class="btn-group dropright">
                            <button type="button" class="btn btn-light dropdown-toggle" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                                <span data-feather="users"></span>
                                Clientes
                            </button>
                            <div class="dropdown-menu" x-placement="right-start" style="position: absolute; transform: translate3d(154px, 0px, 0px); top: 0px; left: 0px; will-change: transform;">
                                <a class="dropdown-item" href="ListarCliente">Listar</a>                                
                            </div>
                        </div>                      
                    </li>
                    <li class="nav-item">
                        <div class="btn-group dropright">
                            <button type="button" class="btn btn-light dropdown-toggle" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                                <span data-feather="users"></span>
                                Entregadores
                            </button>
                            <div class="dropdown-menu" x-placement="right-start" style="position: absolute; transform: translate3d(154px, 0px, 0px); top: 0px; left: 0px; will-change: transform;">
                                <a class="dropdown-item" href="entregador/cadastrarentregador.jsp">Cadastrar</a>
                                <a class="dropdown-item" href="ListarEntregador">Listar</a>                                
                            </div>
                        </div>                      
                    </li>
                    <li class="nav-item">
                        <div class="btn-group dropright">
                            <button type="button" class="btn btn-light dropdown-toggle" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                                <span data-feather="users"></span>
                                Funções
                            </button>
                            <div class="dropdown-menu" x-placement="right-start" style="position: absolute; transform: translate3d(154px, 0px, 0px); top: 0px; left: 0px; will-change: transform;">
                                <a class="dropdown-item" href="funcao/cadastrarFuncao.jsp">Cadastrar</a>
                                <a class="dropdown-item" href="ListarFuncao">Listar</a>                                
                            </div>
                        </div>                      
                    </li> 
                    <li class="nav-item">
                        <div class="btn-group dropright">
                            <button type="button" class="btn btn-light dropdown-toggle" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                                <span data-feather="users"></span>
                                Funcionários
                            </button>
                            <div class="dropdown-menu" x-placement="right-start" style="position: absolute; transform: translate3d(154px, 0px, 0px); top: 0px; left: 0px; will-change: transform;">
                                <a class="dropdown-item" href="Funcionario">Cadastrar</a>
                                <a class="dropdown-item" href="ListarFuncionario">Listar</a>                                
                            </div>
                        </div>                      
                    </li>  
                    <li class="nav-item">
                        <div class="btn-group dropright">
                            <button type="button" class="btn btn-light dropdown-toggle" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                                <span data-feather="users"></span>
                                Mesa
                            </button>
                            <div class="dropdown-menu" x-placement="right-start" style="position: absolute; transform: translate3d(154px, 0px, 0px); top: 0px; left: 0px; will-change: transform;">
                                <a class="dropdown-item" href="mesa/cadastrarMesa.jsp">Cadastrar</a>
                                <a class="dropdown-item" href="ListarMesa">Listar</a>
                                <a class="dropdown-item" href="mesa/listarReserva.jsp">Reservas</a>
                            </div>
                        </div>                      
                    </li>
                    <li class="nav-item">
                        <div class="btn-group dropright">
                            <button type="button" class="btn btn-light dropdown-toggle" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                                <span data-feather="users"></span>
                                Produto
                            </button>
                            <div class="dropdown-menu" x-placement="right-start" style="position: absolute; transform: translate3d(154px, 0px, 0px); top: 0px; left: 0px; will-change: transform;">
                                <a class="dropdown-item" href="produto/cadastrarProduto.jsp">Cadastrar</a>
                                <a class="dropdown-item" href="ListarProduto">Listar</a>                                
                            </div>
                        </div>                      
                    </li>   
                    <li class="nav-item">
                        <div class="btn-group dropright">
                            <button type="button" class="btn btn-light dropdown-toggle" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                                <span data-feather="users"></span>
                                Pedido
                            </button>
                            <div class="dropdown-menu" x-placement="right-start" style="position: absolute; transform: translate3d(154px, 0px, 0px); top: 0px; left: 0px; will-change: transform;">
                                <a class="dropdown-item" href="Pedido">Cadastrar</a>
                                <a class="dropdown-item" href="ListarPedido">Listar</a>                                
                            </div>
                        </div>                      
                    </li>                   
                </ul>
            </div>
        </nav>
        <!-- Icons -->
        <script src="https://unpkg.com/feather-icons/dist/feather.min.js"></script>
        <script>
            feather.replace()
        </script>
    </body>
</html>