<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core_rt"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<!DOCTYPE html>
<html lang="en">
    
    <head>
        <meta charset="UTF-8">
        <title>MeinHaus</title>
        
        <link rel="stylesheet" type="text/css" href="
        <c:url value="/resources/css/home.css" />
        ">
        <link rel="stylesheet" type="text/css" href="
        <c:url value="/resources/css/navbar.css" />
        ">
        <link rel="stylesheet" type="text/css" href="
        <c:url value="/resources/css/footer.css" />
        ">
        <link rel="shortcut icon" href="<c:url value="/resources/pics/favicon.ico" />">
        <link href="https://fonts.googleapis.com/css?family=Rubik" rel="stylesheet">
        <script src="https://code.jquery.com/jquery-1.12.4.js"></script>
        <script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
        <script src="<c:url value="/resources/js/home.js" />"></script>
        <script src="<c:url value="/resources/js/navbar.js" />"></script>
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    </head>
    
    <body>
        <nav>
        	<a href="./home">
           		<img src="<c:url value="/resources/pics/Logo4.png" />" alt="Home" id="logo">
            </a>
            <div class="dropdown">
	                <img src="
	                <c:url value="/resources/pics/user.png" />
	                " alt="user" id="user_icon" class="navbar_item">
                <div id="myDropdown" class="dropdown-content"> 
                    <a href="./help.html"><spring:message code="nav.profile"/></a>
                    <a href="./help.html"><spring:message code="nav.logOut"/></a>
                </div>
            </div>
            <div class="dropdown" id="sign_in">
                <a class="navbar_item" href="#"><spring:message code="nav.signIn"/></a>
                <div class="dropdown-content">
                    <form class="form_login">
                        <div class="email">
                        	<spring:message code="nav.placeholderEmail" var="navEmail"/>
                            <input oninvalid="this.setCustomValidity('Please, enter a valid email address')" class="form-control form-control-lg form-control-borderless" type="email" placeholder="${navEmail}" required>
                        </div>
                        <div class="password">
                        	<spring:message code="nav.placeholderPassword" var="navPassword"/>
                            <input oninvalid="this.setCustomValidity('Please, complete this input')" class="form-control form-control-lg form-control-borderless" type="password" placeholder="${navPassword}" required>
                        </div>
                        <div class="msg_error">
                        	<label></label>
                        </div>
                        <div class="check_box">
                            <label><input type="checkbox"/><spring:message code="nav.rememberMe"/></label>
                        </div>
                        <div class="sign_b">
                            <button class="btn" onclick="check_input();"><spring:message code="nav.buttonSignIn"/></button>
                        </div>
                        <div class="line_separator"></div>
                        <div class="password_label">
                            <label><spring:message code="nav.forgotPassword"/></label>
                        </div>
                    </form>
                </div>
            </div>
            <div>
                <a class="navbar_item" id="sign_up" href="./signUp"><spring:message code="nav.signUp"/></a>
            </div>
        </nav>
        
        <header>
            <div class="header" style="background-image:url(<c:url value='/resources/pics/background5.png'/>)">
                <div class="title">
                    <h1><spring:message code="home.title"/></h1>
                </div>
                <div class="search_list">
                    <ul class="rounded" id="myul">
					  <li onclick="operation_sel('FOR SALE');" class="first_item" id="buy"><a href="#"><spring:message code="home.buy"/></a></li>
					  <li onclick="operation_sel('FOR RENT');" id="rent"><a href="#"><spring:message code="home.rent"/></a></li>
					</ul>
                </div>
                <div id="icons">
                    <div class="container">
                        <div class="row justify-content-center">
                            <div class="col-12 col-md-10 col-lg-8">
                                <form id="card" class="card card-sm">
                                    <div class="card-body row no-gutters align-items-center">
                                        <div class="col-auto">
                                            <i class="fas fa-search h4 text-body"></i>
                                        </div>
                                        <!--end of col-->
                                        <div class="col">
                                        	<spring:message code="home.placeholderSearch" var="search"/>
	                                    	<input class="form-control form-control-lg" type="search" id="input_search" placeholder="${search}">
	                                   	</div>
                                        <!--end of col-->
                                        <div class="col-auto">
                                            <button id="searchbutton" class="btn btn-lg btn-success rounded" type="submit" onclick="search();"><a id="link"><spring:message code="home.search"/></a></button>
                                        </div>
                                        <!--end of col-->
                                    	<div id="msg_error_search">
                                        	<label></label>
                                        </div>
                                    </div>
                                </form>
                            </div>
                            <!--end of col-->
                        </div>
                    </div>
                </div>
            </div>
        </header>
        
        <section class="newest_homes">
            <div>
                <h3><spring:message code="home.newestTitle"/></h3>
            </div>
            <div>
                <ul>
                    <li class="polaroid">
                        <a href="./details">
	                        <img src="
	                        <c:url value="/resources/pics/casa1.jpg" />
	                        "/>
                        </a> 
                        <div class="line_separator"></div>
                        <div class="description_box">
                        	<label class="price">USD 190.000</label>
					  		<label  class="expenses">$ 7.900 Expensas</label>
					  		<label>O'Higgins 2852</label>
					  		<label>Belgrano, Capital Federal</label>
                        </div>
                    </li>
                    <li class="polaroid">
                        <a href="./details">
	                        <img src="
	                        <c:url value="/resources/pics/casa2.jpg" />
	                        ">	</img> 
	                    </a>
                        <div class="line_separator"></div>
                        <div class="description_box">
                        	<label class="price">USD 150.000</label>
					  		<label  class="expenses">$ 7.900 Expensas</label>
					  		<label>O'Higgins 2852</label>
					  		<label>Belgrano, Capital Federal</label>
                        </div>
                    </li>
                    <li class="polaroid">
                    	<a href="./details">
	                        <img src="
	                        <c:url value="/resources/pics/casa3.jpg" />
	                        ">	</img>
	                    </a> 
                        <div class="line_separator"></div>
                        <div class="description_box">
                        	<label class="price">USD 150.000</label>
					  		<label  class="expenses">$ 7.900 Expensas</label>
					  		<label>O'Higgins 2852</label>
					  		<label>Belgrano, Capital Federal</label>
                        </div>
                    </li>
                    <li class="polaroid">
                    	<a href="./details">
	                        <img src="
	                        <c:url value="/resources/pics/casa4.jpg" />
	                        ">	</img>
	                    </a> 
                        <div class="line_separator"></div>
                        <div class="description_box">
                        	<label class="price">USD 150.000</label>
					  		<label  class="expenses">$ 7.900 Expensas</label>
					  		<label>O'Higgins 2852</label>
					  		<label>Belgrano, Capital Federal</label>
                        </div>
                    </li>
                    <li class="polaroid">
	                    <a href="./details">
	                        <img src="
	                        <c:url value="/resources/pics/casa2.jpg" />
	                        ">	</img> 
                        </a>
                        <div class="line_separator"></div>
                       	<div class="description_box">
                        	<label class="price">USD 150.000</label>
					  		<label  class="expenses">$ 7.900 Expensas</label>
					  		<label>O'Higgins 2852</label>
					  		<label>Belgrano, Capital Federal</label>
                        </div>
                    </li>
                    <li class="polaroid">
	                    <a href="./details">
	                        <img src="
	                        <c:url value="/resources/pics/casa1.jpg" />
	                        ">	</img> 
                        </a>
                        <div class="line_separator"></div>
                        <div class="description_box">
                        	<label class="price">USD 150.000</label>
					  		<label  class="expenses">$ 7.900 Expensas</label>
					  		<label>O'Higgins 2852</label>
					  		<label>Belgrano, Capital Federal</label>
                        </div>
                    </li>
                </ul>
            </div>
        </section>
        
        <section class="contact-info">
        	<div class="contact-info-column">
        		<h4><spring:message code="home.popular"/></h4>
        		<ul>
        			<li>Belgrano</li>
        			<li>Palermo</li>
        			<li>Recoleta</li>
        			<li>Caballito</li>
        		</ul>
        	</div>
        	<div class="contact-info-column">
        	    <h4><spring:message code="home.searchBy"/></h4>
        	    <ul>
        			<li><spring:message code="home.neighborhood"/></li>
        			<li><spring:message code="home.price"/></li>
        			<li><spring:message code="home.numberOfRooms"/></li>
        			<li><spring:message code="home.pets"/></li>
        		</ul>
        	</div>
        	<div class="contact-info-column">
          		<h4><spring:message code="home.contactUs"/></h4>
        		<ul>
        			<li><spring:message code="home.help"/></li>
        			<li><spring:message code="home.FAQs"/></li>
        			<li><spring:message code="home.contact"/></li>
        			<li><spring:message code="home.support"/></li>
        		</ul>
           	</div>
        </section>
        
        
        <footer>
          <div id="footer">
              <p>Copyright &copy; 2018, MeinHaus. All rights reserved.</p>
          </div>
        </footer>
        
    </body>
</html>