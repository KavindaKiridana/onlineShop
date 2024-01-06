
<%String email=null;
String errorMessage=null; %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>home page</title>
    <link rel="stylesheet" href="style.css">
</head>
<body>
    <div class="container01" id="container01">
        <div class="navbar01">
            <img src="images/logo.png" class="logo01" >
            <nav id="nav-01">
                <ul>
                    <li><a href="index.jsp?id=<%= email %>">Home</a></li>
                    <li><a href="login.jsp?id=<%= email %>&msg=<%= errorMessage %>">Join us</a></li>
                    <li><a href="contactus.jsp?id=<%= email %>">Contact us</a></li>
                </ul>
            </nav>
            <img src="images/menu.png" class="menu-icon" id="menu01" width="20" height="20">
        </div>
        <div class="row" id="row01">
            <div class="col" id="col01">
                <h1 id="n101">GREEN Supermarket</h1>
                <p id="n012">
                </p>
               <!-- <a href="menu.jsp"><button type="button" id="btn01"> Category </button></a> -->
            </div>
            <div class="col" id="col01">
                <a href="menu.jsp">
                    <div class="card card1" id="cardhome">
                        <h5>Fruits</h5>
                        <p>*</p>
                    </div>
                </a>
                <a href="menu.jsp">
                    <div class="card card2" id="cardhome">
                        <h5>Vegetables</h5>
                        <p>*</p>
                    </div>
                </a>
                <a href="menu.jsp">
                    <div class="card card3" id="cardhome">
                        <h5>Fresh Meats</h5>
                        <p>*</p>
                    </div>
                </a>
                <a href="menu.jsp">
                    <div class="card card4" id="cardhome">
                        <h5>Beverages</h5>
                        <p>*</p>
                </a>
            </div>
        </div>
    </div>






</body>

</html>