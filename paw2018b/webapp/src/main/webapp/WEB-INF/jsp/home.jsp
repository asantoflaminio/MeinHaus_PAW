<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core_rt"%>
<!DOCTYPE html>
<html lang="en">
    
    <head>
        <meta charset="UTF-8">
        <title>MeinHaus</title>
        <link rel="stylesheet" type="text/css" href="<c:url value="/resources/css/home.css" />">
        <script src="js/jquery-3.3.1.js"></script>
        <script src="https://code.jquery.com/jquery-1.12.4.js"></script>
        <script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
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
        
           <div class="styled-select black rounded">
              <select>
                <option value="Buy">Buy</option>
                  <option value="Rent">Rent</option>
              </select>
            </div>
           
            
            <div id="icons">
          <div class="container">
            <br/>
            <div class="row justify-content-center">
                                <div class="col-12 col-md-10 col-lg-8">
                                    <form id="card" class="card card-sm">
                                        <div class="card-body row no-gutters align-items-center">
                                            <div class="col-auto">
                                                <i class="fas fa-search h4 text-body"></i>
                                            </div>
                                            <!--end of col-->
                                            <div class="col">
                                                <input class="form-control form-control-lg form-control-borderless" type="search" placeholder="Search neighbourhood">
                                            </div>
                                            <!--end of col-->
                                            <div  class="col-auto">
                                                <button id="searchbutton" class="btn btn-lg btn-success" type="submit">Search</button>
                                            </div>
                                            <!--end of col-->
                                        </div>
                                    </form>
                                </div>
                                <!--end of col-->
                            </div>
        </div>
            </div>
        </section>

        <footer>
          <div id="footer">
              <p>Copyright &copy; 2018, MeinHaus. All rights reserved.</p>
          </div>
        </footer>
    </body>
</html>
