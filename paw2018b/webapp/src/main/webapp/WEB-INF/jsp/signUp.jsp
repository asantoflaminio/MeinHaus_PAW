<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core_rt"%>
<!DOCTYPE html>
<html lang="en">

    <head>
        <meta charset="UTF-8">
        <title>Registration</title>
        <link rel="stylesheet" type="text/css" href="<c:url value="/resources/css/signUp.css" />">
        <script src="js/jquery-3.3.1.js"></script>  
        <script src="https://code.jquery.com/jquery-1.12.4.js"></script>
        <script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
        <link href="https://fonts.googleapis.com/css?family=Rubik" rel="stylesheet">
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">

        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">

    </head>

    <body background="<c:url value="/resources/pics/background2.jpg" />">
        <nav>
          <img src="<c:url value="/resources/pics/Logo4.png" />" alt="Home" id="logo">
                <div class="dropdown" >
                  <img src="<c:url value="/resources/pics/Settings.png" />" alt="Settings" id="settings" class="navbar_item">
                  <div id="myDropdown" class="dropdown-content" > 
                    <a href="./help.html">Log In</a>
                    <a href="./help.html">Register</a>
                    <a href="./help.html">Publish</a>
                  </div>
                </div>
        </nav>

        <div class="mainRegistration">
        	<div class="registration">
        		<div class="title">
        			<h1 class="titleText">Registration</h1>
        			<hr class="titleLine">
        		</div>
                <div class="content">
                    <div class="leftContent">
                        <h1 class="titleInfo">Obligatory</h1>
                        <label>First Name</label>
                        <input type="text" placeholder="First name...">
                        <label>Last name</label>
                        <input type="text" placeholder="Last name...">
                        <label>E-mail account</label>
                        <input type="text" placeholder="example@eg.com">
                        <label>Cellphone</label>
                        <input type="text" placeholder="(XXX)XXX-XXXX">
                        <div class="userOption">
                            <h1>Account type:</h1>
                                <div class="options">
                                    <label class="container">
                                      <input type="checkbox">
                                      <span class="checkmark"></span>
                                    </label>

                                    <label class="container">
                                      <input type="checkbox">
                                      <span class="checkmark"></span>
                                    </label>
                                </div>
                        </div>
                    </div>
                    <div class="rightContent">
                        <h1 class="titleInfo">Optional</h1>
                    </div>
                </div>
        	</div>
        </div>
    </body>