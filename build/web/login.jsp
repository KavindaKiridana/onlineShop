<%@ page import="java.util.*" %>
<%
    String errorMessage = request.getParameter("msg");
    String email=null;
%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>login</title>
    <link rel="stylesheet" href="style.css">
    <style>
        .error-message {
            color:white;
        }
    </style>
</head>
<body>
    <div class="container01" id="container01">
        <div class="navbar01">
            <img src="images/logo.png" class="logo01">
            <nav id="nav-01">
                <ul>
                    <<li><a href="index.jsp?id=<%= email %>">Home</a></li>
                    <li><a href="menu.jsp?id=<%= email %>">Category</a></li>
                    <li><a href="cart.jsp?id=<%= email %>">Cart</a></li>
                    <li><a href="login.jsp?id=<%= email %>&msg=<%= errorMessage %>">Join us</a></li>
                    <li><a href="contactus.jsp?id=<%= email %>">Contact us</a></li>
                </ul>
            </nav>
            <img src="images/menu.png" class="menu-icon" id="menu01" width="20" height="20">
        </div>
        <div class="form-box" id="logbox01">
            <div class="button-box">
                <div id="btn02"></div>
                <button type="button" class="togle-btn" id="toglebtn01" onclick="login()">Log In</button>
                <button type="button" class="togle-btn" id="toglebtn01" onclick="register()">Register</button>
            </div>
            <!-- <div class="social-icons" id="sicons">
                <img src="images/fb.png">
                <img src="images/gl.png">
                <img src="images/tw.png">
            </div> -->
            <form id="login01" class="input-group" action="Login" method="post">
                <input type="text" class="input-field" placeholder="Enter your email" id="textcolor1" name="email" required/>
                <input type="password" class="input-field" placeholder="Enter Password" id="textcolor1"
                    name="pwd" required/>
                <button type="submit" class="submit-btn">Log in</button>
                <%
            if (errorMessage != null) 
            {
                out.println("<p class='error-message'>" + errorMessage + "</p>");
            }
               %>
            </form>
            <form id="register01" class="input-group" action="RegisterS" method="post">
    <input type="email" class="input-field" placeholder="Enter your email" id="textcolor1" name="email" required/>
    <input type="password" class="input-field" placeholder="Enter a password" id="textcolor1" name="pwd" required/>
    <input type="password" class="input-field" placeholder="Re-enter Password" id="textcolor1" name="pwd2" required/>
    <input type="checkbox" class="chech-box"><span id="spn01"> I agree to the terms & conditions</span>
    <button type="submit" class="submit-btn">Register</button>
</form>
        </div>
    </div>
    <script>
        var x = document.getElementById("login01");
        var y = document.getElementById("register01");
        var z = document.getElementById("btn02");
        function register() {
            x.style.left = "-400px";
            y.style.left = "50px";
            z.style.left = "110px";
        }
        function login() {
            x.style.left = "50px";
            y.style.left = "450px";
            z.style.left = "0 ";
        }
    </script>
</body>
</html>