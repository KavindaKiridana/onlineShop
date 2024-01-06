<%@ page import="java.util.*" %>
<%@ page import="java.io.PrintWriter" %>
<%@ page import="jakarta.servlet.http.HttpServletResponse" %>
<%
    String email = request.getParameter("id");
    String errorMessage = request.getParameter("msg");
%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>menu</title>
    <link rel="stylesheet" href="style.css">
    <script src="jquery-3.6.2.min.js"></script>
    <script src="main.js"></script>
<%--i added the bootstrap links here for buttons--%>
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
  <style>
        .error-message {
            color: white;
            text-align: center;
        }
        h4 {
            color: bisque;
        }
    </style>
</head>
<body>
    <div class="container01" id="container01">
        <div class="navbar01">
            <img src="images/logo.png" class="logo01" >
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
    <!--full nav bar ends at here--> 
    <!--error message--> 
    <h4>   <% out.println("<p class='error-message'>" +email+":"+errorMessage+ "</p>"); %></h4>
    <br><p style="text-align: center;"></p>
    <!--cards container start at here-->
    <div class="container"><br>
        <div class="row">
            <div class="col-sm-4">
                <div class="card" style="width:300px">
                    <img class="card-img-top img-rounded" src="images/x2.jpg" alt="Card image" style="width:100%">
                    <div class="card-body">
                        <h4 class="card-title" style="color: white;">Chicken</h4>
                        <form action="Item" method="post">
                            <label style="color: white;">Choose a payment method:</label>
                            <select name="itemid" id="cars">
                                <option value="1">cash on delivery</option>
                            </select>
                            <label style="color: white;">User:</label>
                            <select name="email" id="cars">
                                <option value="<%= email %>">email</option>
                            </select>
                            <br><br>
                            <input type="submit" value="Add to cart" class="btn btn-primary">
                        </form>
                    </div>
                </div>
            </div>
            <div class="col-sm-4">
                <div class="card" style="width:300px">
                    <img class="card-img-top img-rounded" src="images/x1.jpg" alt="Card image" style="width:100%">
                    <div class="card-body">
                        <h4 class="card-title" style="color: white;">King Coconut</h4>
                        <form action="Item" method="post">
                            <label style="color: white;">Choose a payment method:</label>
                            <select name="itemid" id="cars">
                                <option value="2">cash on delivery</option>
                            </select>
                            <label style="color: white;">User:</label>
                            <select name="email" id="cars">
                                <option value="<%= email %>">email</option>
                            </select>
                            <br><br>
                            <input type="submit" value="Add to cart" class="btn btn-primary">
                        </form>
                    </div>
                </div>
            </div>
            <div class="col-sm-4">
                <div class="card" style="width:300px">
                    <img class="card-img-top img-rounded" src="images/x3.jpg" alt="Card image" style="width:100%">
                    <div class="card-body">
                        <h4 class="card-title" style="color: white;">Faluda</h4>
                        <form action="Item" method="post">
                            <label style="color: white;">Choose a payment method:</label>
                            <select name="itemid" id="cars">
                                <option value="3">cash on delivery</option>
                            </select>
                            <label style="color: white;">User:</label>
                            <select name="email" id="cars">
                                <option value="<%= email %>">email</option>
                            </select>
                            <br><br>
                            <input type="submit" value="Add to cart" class="btn btn-primary">
                        </form>
                    </div>
                </div>
            </div>
        </div><!--########--><br>
        <div class="row">
            <div class="col-sm-4">
                <div class="card" style="width:300px">
                    <img class="card-img-top img-rounded" src="images/x4.jpg" alt="Card image" style="width:100%">
                    <div class="card-body">
                        <h4 class="card-title" style="color: white;">Red Rice</h4>
                        <form action="Item" method="post">
                            <label style="color: white;">Choose a payment method:</label>
                            <select name="itemid" id="cars">
                                <option value="4">cash on delivery</option>
                            </select>
                            <label style="color: white;">User:</label>
                            <select name="email" id="cars">
                                <option value="<%= email %>">email</option>
                            </select>
                            <br><br>
                            <input type="submit" value="Add to cart" class="btn btn-primary">
                        </form>
                    </div>
                </div>
            </div>
            <div class="col-sm-4">
                <div class="card" style="width:300px">
                    <img class="card-img-top img-rounded" src="images/gotukola.jpg" alt="Card image" style="width:100%">
                    <div class="card-body">
                        <h4 class="card-title" style="color: white;">Gotukola</h4>
                        <form action="Item" method="post">
                            <label style="color: white;">Choose a payment method:</label>
                            <select name="itemid" id="cars">
                                <option value="5">cash on delivery</option>
                            </select>
                            <label style="color: white;">User:</label>
                            <select name="email" id="cars">
                                <option value="<%= email %>">email</option>
                            </select>
                            <br><br>
                            <input type="submit" value="Add to cart" class="btn btn-primary">
                        </form>
                    </div>
                </div>
            </div>
            <div class="col-sm-4">
                <div class="card" style="width:300px">
                    <img class="card-img-top img-rounded" src="images/x5.jpg" alt="Card image" style="width:100%">
                    <div class="card-body">
                        <h4 class="card-title" style="color: white;">Dhal</h4>
                        <form action="Item" method="post">
                            <label style="color: white;">Choose a payment method:</label>
                            <select name="itemid" id="cars">
                                <option value="6">cash on delivery</option>
                            </select>
                            <label style="color: white;">User:</label>
                            <select name="email" id="cars">
                                <option value="<%= email %>">email</option>
                            </select>
                            <br><br>
                            <input type="submit" value="Add to cart" class="btn btn-primary">
                        </form>
                    </div>
                </div>
            </div>
        </div><!--########-->
    </div>
    </div>
</body>
</html>