<%-- 
    Document   : index.jsp
    Created on : 08/10/2018, 15:21:35
    Author     : Secretaria-PC-04
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="pt-br">
    <head>
        <meta charset="utf-8">
        <link href="//maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css" rel="stylesheet">
        <title>Sistema de Pizzaria</title>
    </head>
    <body>
        <%@ include file="cabecalho.jsp"%>   

        <section id="hero-banner">
            <div class="banner-inner">
                <div class="container">
                    <div class="row">
                        <div class="col-sm-12">

                            <h2><b>Pizza</b> Crush </h2>
                            <p>O sabor da alegria para todos os dias!</p> 

                        </div>
                    </div>
                </div>
            </div>
        </section><!--/#main-slider--> 

        <section id="services" >
            <div class="container">

                <div class="section-header">
                    <h2 class="section-title wow fadeInDown">Nossos serviços</h2>               
                </div>

                <div class="row">
                    <div class="features">
                        <div class="col-md-4 col-sm-6 wow fadeInUp" data-wow-duration="300ms" data-wow-delay="0ms">
                            <div class="media service-box">
                                <div class="pull-left">
                                    <i class="fa fa-home"></i>
                                </div>
                                <div class="media-body">
                                    <h4 class="media-heading">Na sua casa</h4>
                                    <p>Pizzas entregues com toda a qualidade, no conforto da sua casa, produto embalado e a certeza que seu pedido chegará inteiro. </p>
                                </div>
                                <img class="img-responsive" src="images/portfolio/01.jpg" alt="">
                            </div>
                        </div><!--/.col-md-4-->

                        <div class="col-md-4 col-sm-6 wow fadeInUp" data-wow-duration="300ms" data-wow-delay="100ms">
                            <div class="media service-box">
                                <div class="pull-left">
                                    <i class="fa fa-compass"></i>
                                </div>
                                <div class="media-body">
                                    <h4 class="media-heading">Na nossa mesa</h4>
                                    <p>Ambiente agradável e amplo, pensado especialmente para seus clientes, com músicas no local,na melhor área da cidade.</p>
                                </div>
                                <img class="img-responsive" src="images/portfolio/02.jpg" alt="">
                            </div>
                        </div><!--/.col-md-4-->

                        <div class="col-md-4 col-sm-6 wow fadeInUp" data-wow-duration="300ms" data-wow-delay="200ms">
                            <div class="media service-box">
                                <div class="pull-left">
                                    <i class="fa fa-users"></i>
                                </div>
                                <div class="media-body">
                                    <h4 class="media-heading">Para seu evento</h4>
                                    <p>Servimos em eventos, formaturas, aniversários, confraternizações e muito mais. Pensando nas suas necessidades.</p>
                                </div>
                                <img class="img-responsive" src="images/portfolio/03.jpg" alt="">
                            </div>
                        </div><!--/.col-md-4-->

                    </div>
                </div><!--/.row-->    
            </div><!--/.container-->
        </section><!--/#services-->


        <section id="pricing">
            <div class="container">
                <div class="section-header">
                    <h2 class="section-title wow fadeInDown">Menu</h2>
                </div> 
                <div class="row">
                    <!-- Menu text, Image or Video iframe -->
                    <!-- Menu Card -->
                    <div class="col-sm-3">
                        <h4>Vegetariano</h4>
                        <ul class="menuPrice">
                            <li>
                                <a href="index.html#">Milho e ervilha. <span class="number">R$20</span></a>
                            </li>
                            <li>
                                <a href="index.html#">Milho.<span class="number">R$15</span></a>
                            </li>
                            <li>
                                <a href="index.html#">Ervilha.<span class="number">R$15</span></a>
                            </li>
                            <li>
                                <a href="index.html#">Brócolis com batata frita.<span class="number">R$20</span></a>
                            </li>
                            <li>
                                <a href="index.html#">Beterraba com brócolis.<span class="number">R$22</span></a>
                            </li>
                            <li>
                                <a href="index.html#">Salada de vegetais. <span class="number">R$15</span></a>
                            </li>
                        </ul>
                    </div>
                    <!-- Menu Card -->
                    <div class="col-sm-3">
                        <h4>Moda da Casa</h4>
                        <ul class="menuPrice">
                            <li>
                                <a href="index.html#">Tomate fatiado e orégano.<span class="number">R$25</span></a>
                            </li>
                            <li>
                                <a href="index.html#">Mussarela e presunto.<span class="number">R$21</span></a>
                            </li>
                            <li>
                                <a href="index.html#">Mussarela, calabresa  e azeitona.<span class="number">R$22</span></a>
                            </li>
                            <li>
                                <a href="index.html#">Mussarela, bacon e milho.<span class="number">R$23</span></a>
                            </li>
                            <li>
                                <a href="index.html#">Frango, cheddar e champignon.<span class="number">R$30</span></a>
                            </li> 
                            <li>
                                <a href="index.html#">Mussarela, tomate e azeitona. <span class="number">$12</span></a>
                            </li>
                        </ul>
                    </div>
                    <!-- Menu Card -->
                    <div class="col-sm-3">
                        <h4>Doces</h4>
                        <ul class="menuPrice">
                            <li>
                                <a href="index.html#">Brigadeiro.<span class="number">R$29</span></a>
                            </li>
                            <li>
                                <a href="index.html#">Romeu e julieta.<span class="number">R$29</span></a>
                            </li>
                            <li>
                                <a href="index.html#">Banana com nutella. <span class="number">R$19</span></a>
                            </li>
                            <li>
                                <a href="index.html#">Creme de avelã com frutas.<span class="number">R$16</span></a>
                            </li>
                            <li>
                                <a href="index.html#">Chocolate duplo. <span class="number">R$22</span></a>
                            </li>
                            <li>
                                <a href="index.html#">Leite condensado com morango<span class="number">R$15</span></a>
                            </li>

                        </ul>
                    </div> 
                    <!-- Menu Card -->
                    <div class="col-sm-3">
                        <h4>Especiais</h4>
                        <ul class="menuPrice">
                            <li>
                                <a href="index.html#">A moda do chefe<span class="number">R$40</span></a>
                            </li>
                            <li>
                                <a href="index.html#">Abobrinha <span class="number">R$22</span></a>
                            </li>
                            <li>
                                <a href="index.html#">Alho poró<span class="number">R$35</span></a>
                            </li>  
                            <li>
                                <a href="index.html#">Barbarella <span class="number">R$23</span></a>
                            </li>                                                     
                            <li>
                                <a href="index.html#">Da vinci <span class="number">R$20</span></a>
                            </li>
                            <li>
                                <a href="index.html#">Nordestina<span class="number">R$26</span></a>
                            </li>

                        </ul>
                    </div>
                </div>
            </div>
        </section><!--/#pricing-->

        <section id="portfolio">
            <div class="container">
                <div class="section-header">
                    <h2 class="section-title wow fadeInDown">Galeria</h2>
                </div>

                <div class="text-center">
                    <ul class="portfolio-filter">
                        <li><a class="active" href="index.html#" data-filter="*">Todas</a></li>
                        <li><a href="index.html#" data-filter=".designing">Comida</a></li>
                        <li><a href="index.html#" data-filter=".mobile">Ambiente</a></li>
                        <li><a href="index.html#" data-filter=".development">Festas</a></li>
                    </ul><!--/#portfolio-filter-->
                </div>

                <div class="portfolio-items">
                    <div class="portfolio-item designing">
                        <div class="portfolio-item-inner">
                            <img class="img-responsive" src="images/portfolio/01.jpg" alt="">
                            <div class="portfolio-info">
                                <h3>Entrega de Pizzas</h3>
                                Entregamos a pizza na sua casa
                                <a class="preview" href="images/portfolio/01.jpg" rel="prettyPhoto"><i class="fa fa-eye"></i></a>
                            </div>
                        </div>
                    </div><!--/.portfolio-item-->

                    <div class="portfolio-item mobile development">
                        <div class="portfolio-item-inner">
                            <img class="img-responsive" src="images/portfolio/02.jpg" alt="">
                            <div class="portfolio-info">
                                <h3>Ambientes</h3>
                                Ambiente agradavél para sua família
                                <a class="preview" href="images/portfolio/02.jpg" rel="prettyPhoto"><i class="fa fa-eye"></i></a>
                            </div>
                        </div>
                    </div><!--/.portfolio-item-->

                    <div class="portfolio-item designing">
                        <div class="portfolio-item-inner">
                            <img class="img-responsive" src="images/portfolio/03.jpg" alt="">
                            <div class="portfolio-info">
                                <h3>Pizzas para sua festa</h3>
                                Topamos qualquer negócio.
                                <a class="preview" href="images/portfolio/03.jpg" rel="prettyPhoto"><i class="fa fa-eye"></i></a>
                            </div>
                        </div>
                    </div><!--/.portfolio-item-->

                    <div class="portfolio-item mobile">
                        <div class="portfolio-item-inner">
                            <img class="img-responsive" src="images/portfolio/04.jpg" alt="">
                            <div class="portfolio-info">
                                <h3>Ambientes</h3>
                                Ambiente para vários momentos e datas.
                                <a class="preview" href="images/portfolio/04.jpg" rel="prettyPhoto"><i class="fa fa-eye"></i></a>
                            </div>
                        </div>
                    </div><!--/.portfolio-item-->

                    <div class="portfolio-item designing development">
                        <div class="portfolio-item-inner">
                            <img class="img-responsive" src="images/portfolio/05.jpg" alt="">
                            <div class="portfolio-info">
                                <h3>Pizzas para sua festa</h3>
                                Pizzas com a cara da sua imaginação.
                                <a class="preview" href="images/portfolio/05.jpg" rel="prettyPhoto"><i class="fa fa-eye"></i></a>
                            </div>
                        </div>
                    </div><!--/.portfolio-item-->

                    <div class="portfolio-item mobile">
                        <div class="portfolio-item-inner">
                            <img class="img-responsive" src="images/portfolio/06.jpg" alt="">
                            <div class="portfolio-info">
                                <h3>Pizza</h3>
                                Saborosas!! Apetitosas!!
                                <a class="preview" href="images/portfolio/06.jpg" rel="prettyPhoto"><i class="fa fa-eye"></i></a>
                            </div>
                        </div>
                    </div><!--/.portfolio-item-->

                    <div class="portfolio-item designing development">
                        <div class="portfolio-item-inner">
                            <img class="img-responsive" src="images/portfolio/07.jpg" alt="">
                            <div class="portfolio-info">
                                <h3>Pizza</h3>
                                Para todos os gostos!
                                <a class="preview" href="images/portfolio/07.jpg" rel="prettyPhoto"><i class="fa fa-eye"></i></a>
                            </div>
                        </div>
                    </div><!--/.portfolio-item-->

                    <div class="portfolio-item mobile">
                        <div class="portfolio-item-inner">
                            <img class="img-responsive" src="images/portfolio/08.jpg" alt="">
                            <div class="portfolio-info">
                                <h3>Pizza</h3>
                                Direto para sua mesa.
                                <a class="preview" href="images/portfolio/08.jpg" rel="prettyPhoto"><i class="fa fa-eye"></i></a>
                            </div>
                        </div>
                    </div><!--/.portfolio-item-->
                </div>
            </div><!--/.container-->
        </section><!--/#portfolio-->

        <section id="contact-us">
            <div class="container">
                <div class="section-header">
                    <h2 class="section-title wow fadeInDown">Contato</h2>
                </div>
            </div>
        </section><!--/#contact-us-->


        <section id="contact">

            <div class="container">
                <div class="container contact-info">
                    <div class="row">
                        <div class="col-sm-4 col-md-4">
                            <div class="contact-form">
                                <h3>Informações de Contato</h3>

                                <address>
                                    <strong>Pizza Crush Company.</strong><br>
                                    Jales, Rua Sabiás, 123<br>
                                    Brasil<br>
                                    <abbr title="Phone">Tel:</abbr> (17) 3624-7890
                                </address>
                            </div>
                        </div>
                        <div class="col-sm-8 col-md-8">
                            <div class="contact-form">

                                <!--NOTE: Update your email Id in "contact_me.php" file in order to receive emails from your contact form-->
                                <form name="sentMessage" id="contactForm"  novalidate>
                                    <h3>Formulário</h3>
                                    <div class="control-group">
                                        <div class="controls">
                                            <input type="text" class="form-control" 
                                                   placeholder="Nome Completo" id="name" required
                                                   data-validation-required-message="Por favor entre com seu nome" />
                                            <p class="help-block"></p>
                                        </div>
                                    </div> 	
                                    <div class="control-group">
                                        <div class="controls">
                                            <input type="email" class="form-control" placeholder="Email" 
                                                   id="email" required
                                                   data-validation-required-message="Por favor entre com seu e-mail" />
                                        </div>
                                    </div> 	

                                    <div class="control-group">
                                        <div class="controls">
                                            <textarea rows="10" cols="100" class="form-control" 
                                                      placeholder="Messagem" id="message" required
                                                      data-validation-required-message="Please enter your message" minlength="5" 
                                                      data-validation-minlength-message="Min 5 characters" 
                                                      maxlength="999" style="resize:none"></textarea>
                                        </div>
                                    </div> 		 
                                    <div id="success"> </div> <!-- For success/fail messages -->
                                    <button type="submit" class="btn btn-primary pull-right">Enviar</button><br />
                                </form>
                            </div>
                        </div>
                    </div>
                </div>
            </div>   
        </section><!--/#bottom-->

        <%@ include file="rodape.jsp"%>   
    </body>
</html>
