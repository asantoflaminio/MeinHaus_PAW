<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core_rt"%>
<!DOCTYPE html>
<html lang="en">
    
    <head>
        <meta charset="UTF-8">
        <title>MeinHaus</title>
        <link rel="shortcut icon" href="
        <c:url value="/resources/pics/favicon.ico" />
        ">
        <link rel="stylesheet" type="text/css" href="
        <c:url value="/resources/css/home.css" />
        ">
        
        <script src="https://code.jquery.com/jquery-1.12.4.js"></script>
        <script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    </head>
    
    <body>
        
        <nav>
            <img src="
            <c:url value="/resources/pics/Logo4.png" />
            " alt="Home" id="logo">
            <div class="dropdown">
                <img src="
                <c:url value="/resources/pics/Settings.png" />
                " alt="Settings" id="settings" class="navbar_item">
                <div id="myDropdown" class="dropdown-content"> 
                    <a href="./help.html">Profile</a>
                    <a href="./help.html">Log Out</a>
                </div>
            </div>
            <div class="dropdown">
                <a class="navbar_item" href="#">Sign in</a>
                <div class="dropdown-content">
                    <form class="form_login">
                        <div class="email">
                            <input class="form-control form-control-lg form-control-borderless" type="email" placeholder="Email" required>
                        </div>
                        <div class="password">
                            <input class="form-control form-control-lg form-control-borderless" type="password" placeholder="Password" required>
                        </div>
                        <div class="check_box">
                            <label><input type="checkbox" />Remember me</label>
                        </div>
                        <div class="sign_b">
                            <button class="btn" type="submit">Sign in</button>
                        </div>
                        <div class="line_separator"></div>
                        <div class="password_label">
                            <label> Forgot password? Click Here!</label>
                        </div>
                    </form>
                </div>
            </div>
            <div>
                <a class="navbar_item" href="./signUp">Sign up</a>
            </div>
        </nav>
        
        <header>
            <div class="header" style="background-image:url(<c:url value='/resources/pics/background.jpg'/>)">
                <div class="title">
                    <h1>Discover your next home</h1>
                </div>
                <div class="styled-select black rounded">
                    <select>
                        <option value="Buy">Buy</option>
                        <option value="Rent">Rent</option>
                        <option value="Rent">Sell</option>
                    </select>
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
                                            <input class="form-control form-control-lg form-control-borderless" type="search" placeholder="Neighbourhood">
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
            </div>
        </header>
        
        <section class="newest_homes">
            <div>
                <h3>Newest Homes</h3>
            </div>
            <div>
                <ul>
                    <li>
                        <img src="
                        <c:url value="/resources/pics/casa1.jpg" />
                        ">	</img> 
                        <div class="line_separator"></div>
                        <div class="description_box"><label>description</label></div>
                    </li>
                    <li>
                        <img src="
                        <c:url value="/resources/pics/casa1.jpg" />
                        ">	</img> 
                        <div class="line_separator"></div>
                        <div class="description_box"><label>description</label></div>
                    </li>
                    <li>
                        <img src="
                        <c:url value="/resources/pics/casa1.jpg" />
                        ">	</img> 
                        <div class="line_separator"></div>
                        <div class="description_box"><label>description</label></div>
                    </li>
                    <li>
                        <img src="
                        <c:url value="/resources/pics/casa1.jpg" />
                        ">	</img> 
                        <div class="line_separator"></div>
                        <div class="description_box"><label>description</label></div>
                    </li>
                    <li>
                        <img src="
                        <c:url value="/resources/pics/casa1.jpg" />
                        ">	</img> 
                        <div class="line_separator"></div>
                        <div class="description_box"><label>description</label></div>
                    </li>
                    <li>
                        <img src="
                        <c:url value="/resources/pics/casa1.jpg" />
                        ">	</img> 
                        <div class="line_separator"></div>
                        <div class="description_box"><label>description</label></div>
                    </li>
                </ul>
            </div>
        </section>
        
        <section>
            <div class="section_info">
                <h1>SECTION 2</h1>
            </div>
        </section>
        
        <section>
            <div class="section_info">
                <h1>SECTION 3</h1>
            </div>
        </section>
        
        <section>
            <div class="fotter">
                <h1>FOTTER</h1>
            </div>
        </section>
        
    </body>
</html>