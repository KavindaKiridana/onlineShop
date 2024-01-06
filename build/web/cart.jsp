<%@ page import="java.sql.Connection" %>
<%@ page import="java.sql.DriverManager" %>
<%@ page import="java.sql.PreparedStatement" %>  
<%@ page import="java.sql.ResultSet" %>
<%@ page import="java.util.*" %>
<%
  String errorMessage = null;
  String email = request.getParameter("id");
%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"></script>
    <title>cart</title>
    <link rel="stylesheet" href="style.css">
    <script src="jquery-3.6.2.min.js"></script>
    <script src="main.js"></script>
    <style>
        h4 {
            color: bisque;
        }

        table {
            opacity: 70%;
        }
    </style>
</head>
<body>
    <div class="container01" id="container01">
        <div class="navbar01">
            <img src="images/logo.png" class="logo01">
            <nav id="nav-01">
                <ul>
                    <li><a href="index.jsp?id=<%= email %>">Home</a></li>
                    <li><a href="menu.jsp?id=<%= email %>">Category</a></li>
                    <li><a href="cart.jsp?id=<%= email %>">Cart</a></li>
                    <li><a href="login.jsp?id=<%= email %>&msg=<%= errorMessage %>">Join us</a></li>
                    <li><a href="contactus.jsp?id=<%= email %>">Contact us</a></li>
                </ul>
            </nav>
            <img src="images/menu.png" class="menu-icon" id="menu01" width="20" height="20">
        </div>
    
    <div class="container">
            <h4>&nbsp;<% out.println("<p class='error-message'>" +email+":"+errorMessage+ "</p>"); %> </h4>
            <div class="table">
                <table class="table table-hover table-responsive table-striped">
                    <thead>
                        <tr>
                            <th>#</th>
                            <th>name</th>
                            <th>price</th>
                            <th>description</th>
                            <th>action</th>
                        </tr>
                    </thead>
                    <tbody>
    <%
    try {
      // Connect to database
      Class.forName("com.mysql.cj.jdbc.Driver");
      Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/logindb", "root", "");

      // Prepare SQL query to retrieve cart items for the user
      String sql = "SELECT i.itemid, i.name, i.price, i.description FROM carttable c JOIN itemtable i ON c.itemid = i.itemid WHERE c.name = ?";
      PreparedStatement stmt = con.prepareStatement(sql);  // Fixed missing import
      stmt.setString(1, email);

      // Execute query and retrieve results
      ResultSet result = stmt.executeQuery();

      // Iterate through results and display item data in table
      int count=1;
      while (result.next()) {
        int itemid = result.getInt("itemid");
        String itemName = result.getString("name");
        double price = result.getDouble("price");
        String description = result.getString("description");
        
      %>
      <tr>
        <td><%= count %></td>
        <td><%= itemName %></td>
        <td><%= price %></td>
        <td><%= description %></td>
        <td>
          </td>
      </tr>
      <% count=count+1;
      }
    } catch (Exception e) {
      errorMessage = e.getMessage(); // Removed extra closing parenthesis
      //out.println("Error retrieving cart items: " + e.getMessage());
    } 
    %>
  </tbody>
  </table>
  </div>
  </body>
</html>
