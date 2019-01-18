<%-- 
    Document   : residencial
    Created on : 20/10/2018, 23:56:54
    Author     : Thais Silveira
--%>

<%@page import="br.com.CrudPizzariaPrototipo.model.Cliente"%>
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
                          <li style="margin-left:  200px;" class="scroll active"><a href="ListarCliente">Seja bem-vindo(a) <%= (request.getSession().getAttribute("cliente") != null) ? ((Cliente) request.getSession().getAttribute("cliente")).getNomeCliente() : "Visitante" %>!</a></li>
                            <li  style="margin-left:  5px;" class="scroll active"><a href="index.jsp">Voltar</a></li>
                            <li class="scroll active float-right" style="margin-left:  5px;">
                                <a class="btn btn-outline-primary nav-link" href="${pageContext.request.contextPath}/sair">Sair</a>
                            </li>
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
                        <div class="col-md-12 col-sm-6">
                            <h2 class="section-title">RESIDENCIAL</h2> 
                        </div>                       
                    </div>
                </div>
                <div class="col-md-6 col-sm-6 wow fadeInUp" data-wow-duration="300ms" data-wow-delay="100ms">
                    <div class="pedido-form" style="height: 360px;">
                        <div class="ftco-animate p-md-5 fadeInUp ftco-animated">
                            <div class="row">
                                <h3> Escolha seu sabor </h3>
                                <div class="col-md-12 nav-link-wrap mb-5">
                                    <div class="nav ftco-animate nav-pills fadeInUp ftco-animated" id="v-pills-tab" role="tablist" aria-orientation="vertical">
                                        <a class="nav-link" id="v-pills-1-tab" data-toggle="pill" href="#v-pills-1" role="tab" aria-controls="v-pills-1" aria-selected="true">Vegetariano</a> /

                                        <a class="nav-link" id="v-pills-2-tab" data-toggle="pill" href="#v-pills-2" role="tab" aria-controls="v-pills-2" aria-selected="false">Moda da Casa</a> /

                                        <a class="nav-link" id="v-pills-3-tab" data-toggle="pill" href="#v-pills-3" role="tab" aria-controls="v-pills-3" aria-selected="false">Doces</a> /

                                        <a class="nav-link" id="v-pills-4-tab" data-toggle="pill" href="#v-pills-4" role="tab" aria-controls="v-pills-4" aria-selected="false">Especiais</a>
                                    </div>
                                </div>
                                <div class="d-flex align-items-center">
                                    <div class="tab-content" id="v-pills-tabContent">
                                        <div class="tab-pane fade" id="v-pills-1" role="tabpanel" aria-labelledby="v-pills-1-tab">
                                            <div class="row">
                                                <form name="sentMessage" id="contactForm"  novalidate actiion="CadastrarPedido">                                                 
                                                    <div class="menu-wrap">                                                       
                                                        <div class="text">
                                                            <input type="checkbox" id="scales" name="feature"
                                                                   value="sabor01"  />
                                                            <label for="sabor01">Milho e ervilha. <span class="number">R$20</span></label>
                                                        </div>
                                                    </div>  
                                                    <div class="menu-wrap">                                                       
                                                        <div class="text">
                                                            <input type="checkbox" id="scales" name="feature"
                                                                   value="sabor02"  />
                                                            <label for="sabor02">Milho.<span class="number">R$15</span></label>
                                                        </div>
                                                    </div>
                                                    <div class="menu-wrap">                                                       
                                                        <div class="text">
                                                            <input type="checkbox" id="scales" name="feature"
                                                                   value="sabor03"  />
                                                            <label for="sabor03">Ervilha.<span class="number">R$15</span></label>
                                                        </div>
                                                    </div>
                                                    <div class="menu-wrap">                                                       
                                                        <div class="text">
                                                            <input type="checkbox" id="scales" name="feature"
                                                                   value="sabor04"  />
                                                            <label for="sabor04">Brócolis com batata frita.<span class="number">R$20</span></label>
                                                        </div>
                                                    </div>  
                                                    <div class="menu-wrap">                                                       
                                                        <div class="text">
                                                            <input type="checkbox" id="scales" name="feature"
                                                                   value="sabor05"  />
                                                            <label for="sabor05">Batata frita com brócolis.<span class="number">R$22</span></label>
                                                        </div>
                                                    </div>
                                                    <div class="menu-wrap">                                                       
                                                        <div class="text">
                                                            <input type="checkbox" id="scales" name="feature"
                                                                   value="sabor06"  />
                                                            <label for="sabor06">Salada de vegetais.<span class="number">R$15</span></label>
                                                        </div>
                                                    </div>    
                                            </div>
                                        </div>
                                        <div class="tab-pane fade" id="v-pills-2" role="tabpanel" aria-labelledby="v-pills-2-tab">
                                            <div class="row">
                                                <div class="menu-wrap">                                                       
                                                    <div class="text">
                                                        <input type="checkbox" id="scales" name="feature"
                                                               value="sabor07"  />
                                                        <label for="sabor07">Tomate fatiado e orégano.<span class="number">R$25</span></label>
                                                    </div>
                                                </div>  
                                                <div class="menu-wrap">                                                       
                                                    <div class="text">
                                                        <input type="checkbox" id="scales" name="feature"
                                                               value="sabor08"  />
                                                        <label for="sabor08">Mussarela e presunto.<span class="number">R$21</span></label>
                                                    </div>
                                                </div>  
                                                <div class="menu-wrap">                                                       
                                                    <div class="text">
                                                        <input type="checkbox" id="scales" name="feature"
                                                               value="sabor09"  />
                                                        <label for="sabor09">Mussarela, calabresa  e azeitona.<span class="number">R$22</span></label>
                                                    </div>
                                                </div> 
                                                <div class="menu-wrap">                                                       
                                                    <div class="text">
                                                        <input type="checkbox" id="scales" name="feature"
                                                               value="sabor10"  />
                                                        <label for="sabor10">Mussarela, bacon e milho.<span class="number">R$23</span></label>
                                                    </div>
                                                </div>
                                                <div class="menu-wrap">                                                       
                                                    <div class="text">
                                                        <input type="checkbox" id="scales" name="feature"
                                                               value="sabor11"  />
                                                        <label for="sabor11">Frango, cheddar e champignon.<span class="number">R$30</span></label>
                                                    </div>
                                                </div>
                                                <div class="menu-wrap">                                                       
                                                    <div class="text">
                                                        <input type="checkbox" id="scales" name="feature"
                                                               value="sabor12"  />
                                                        <label for="sabor12">Mussarela, tomate e azeitona. <span class="number">$12</span></label>
                                                    </div>
                                                </div>  
                                            </div>
                                        </div>

                                        <div class="tab-pane fade" id="v-pills-3" role="tabpanel" aria-labelledby="v-pills-3-tab">
                                            <div class="row">
                                                <div class="menu-wrap">                                                       
                                                    <div class="text">
                                                        <input type="checkbox" id="scales" name="feature"
                                                               value="sabor13"  />
                                                        <label for="sabor13">Brigadeiro.<span class="number">R$29</span></label>
                                                    </div>
                                                </div>  
                                                <div class="menu-wrap">                                                       
                                                    <div class="text">
                                                        <input type="checkbox" id="scales" name="feature"
                                                               value="sabor14"  />
                                                        <label for="sabor14">Romeu e julieta.<span class="number">R$29</span></label>
                                                    </div>
                                                </div>  
                                                <div class="menu-wrap">                                                       
                                                    <div class="text">
                                                        <input type="checkbox" id="scales" name="feature"
                                                               value="sabor15"  />
                                                        <label for="sabor15">Banana com nutella. <span class="number">R$19</span></label>
                                                    </div>
                                                </div> 
                                                <div class="menu-wrap">                                                       
                                                    <div class="text">
                                                        <input type="checkbox" id="scales" name="feature"
                                                               value="sabor16"  />
                                                        <label for="sabor16">Creme de avelã com frutas.<span class="number">R$16</span></label>
                                                    </div>
                                                </div>
                                                <div class="menu-wrap">                                                       
                                                    <div class="text">
                                                        <input type="checkbox" id="scales" name="feature"
                                                               value="sabor17"  />
                                                        <label for="sabor17">Chocolate duplo. <span class="number">R$22</span></label>
                                                    </div>
                                                </div>
                                                <div class="menu-wrap">                                                       
                                                    <div class="text">
                                                        <input type="checkbox" id="scales" name="feature"
                                                               value="sabor18"  />
                                                        <label for="sabor18">Leite condensado com morango<span class="number">R$15</span></label>
                                                    </div>
                                                </div>  
                                            </div>
                                        </div>

                                        <div class="tab-pane fade" id="v-pills-4" role="tabpanel" aria-labelledby="v-pills-4-tab">
                                            <div class="row">
                                                <div class="menu-wrap">                                                       
                                                    <div class="text">
                                                        <input type="checkbox" id="scales" name="feature"
                                                               value="sabor19"  />
                                                        <label for="sabor19">A moda do chefe<span class="number">R$40</span></label>
                                                    </div>
                                                </div>  
                                                <div class="menu-wrap">                                                       
                                                    <div class="text">
                                                        <input type="checkbox" id="scales" name="feature"
                                                               value="sabor20"  />
                                                        <label for="sabor20">Abobrinha <span class="number">R$22</span></label>
                                                    </div>
                                                </div>  
                                                <div class="menu-wrap">                                                       
                                                    <div class="text">
                                                        <input type="checkbox" id="scales" name="feature"
                                                               value="sabor21"  />
                                                        <label for="sabor21">Alho poró<span class="number">R$35</span></label>
                                                    </div>
                                                </div> 
                                                <div class="menu-wrap">                                                       
                                                    <div class="text">
                                                        <input type="checkbox" id="scales" name="feature"
                                                               value="sabor22"  />
                                                        <label for="sabor22">Barbarella <span class="number">R$23</span></label>
                                                    </div>
                                                </div>
                                                <div class="menu-wrap">                                                       
                                                    <div class="text">
                                                        <input type="checkbox" id="scales" name="feature"
                                                               value="sabor23"  />
                                                        <label for="sabor23">Da vinci <span class="number">R$20</span></label>
                                                    </div>
                                                </div>
                                                <div class="menu-wrap">                                                       
                                                    <div class="text">
                                                        <input type="checkbox" id="scales" name="feature"
                                                               value="sabor24"  />
                                                        <label for="sabor24">Nordestina<span class="number">R$26</span></label>
                                                    </div>
                                                </div>  
                                            </div>
                                        </div>
                                        <br/>
                                        <div class="row"> 
                                            <div class="col-md-6 col-sm-6 form-group">                                            
                                                <input  type="text" style="margin-left: 70px;" class="form-control" name="totalProduto" placeholder="Total">
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>                       
                    </div>                    
                </div>
                <div class="col-md-6 col-sm-6 wow fadeInUp" data-wow-duration="300ms" data-wow-delay="200ms">
                    <div class="pedido-form">                        
                        <div class="row">                                   
                            <div class="col-md-12 col-sm-12 form-group ">                                            
                                <input style="height: 95px;" type="text" class="form-control" name="adicionaisProduto" placeholder="Adicionais">
                            </div>                                    
                        </div>
                        <div class="row">                                   
                            <div class="col-md-6 col-sm-6 form-group ">                                            
                                <input type="text" class="form-control" name="descontoProduto" placeholder="Desconto">
                            </div>
                            <div class="col-md-6 col-sm-6 form-group">                                            
                                <input type="text" class="form-control" name="valorTotalProduto" placeholder="Valor Total">
                            </div>
                        </div>                                                            
                        <div class="control-group">
                            <div class="controls">
                                <div class="form-group">
                                    <input type="text" class="form-control" placeholder="Entregador">
                                </div>
                            </div>
                        </div> 	
                        <div class="control-group">
                            <div class="controls">
                                <div class="form-group">
                                    <input type="text" class="form-control" placeholder="Nome Funcionário">
                                </div>
                            </div>
                        </div> 
                        <div class="control-group">
                            <div class="controls">
                                <div class="form-group">
                                    <input type="text" class="form-control" placeholder="Função:">
                                </div>
                            </div>
                        </div>   
                        </form>
                        <progress value="22" max="100"></progress>
                        <div class="row">
                            <div class="col-md-6 col-sm-6" >
                                <button style="margin-left: 60%;" type="submit" class=" botao-pedido">Alterar</button><br /> 
                            </div>
                            <div class="col-md-6 col-sm-6 ">
                                <button style="margin-left: -15%;" type="submit" class=" botao-pedido">Excluir</button><br />     
                            </div>
                        </div>
                    </div>
                </div><!--/.col-md-4-->
            </div>
        </div>
    </div><!--/.row-->    
</div><!--/.container-->
</section><!--/#services-->
<%@ include file="rodape.jsp"%>   
</body>
<script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous"></script>
</html>
