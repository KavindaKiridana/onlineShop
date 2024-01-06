<%String email=null;
String errorMessage=null; %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="java.util.List" %>
<%@ page import="java.util.ArrayList" %>
<%
    // Initialize comments list if not already
    List<String[]> comments = (List<String[]>) application.getAttribute("comments");

    if (comments == null) {
        comments = new ArrayList<>();
        application.setAttribute("comments", comments);
    }

    // Process and store new comment
    String userName = request.getParameter("userName");
    String commentText = request.getParameter("comment");

    if (userName != null && commentText != null && !userName.isEmpty() && !commentText.isEmpty()) {
        String[] newComment = {userName, commentText};
        comments.add(newComment);
    }

    // Process and remove comment
    String deleteIndex = request.getParameter("deleteIndex");
    if (deleteIndex != null && !deleteIndex.isEmpty()) {
        int indexToDelete = Integer.parseInt(deleteIndex);
        if (indexToDelete >= 0 && indexToDelete < comments.size()) {
            comments.remove(indexToDelete);
        }
    }
%>

<html>
<head>
    <title>Comment Box</title>
    <!--bootstrap links-->
    <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">
  <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"></script>
    <style>
        body {
            background-color: #121212;
            color: #ffffff;
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
        }

        h2, h3 {
            color: #ff007f;
        }

        form {
            max-width: 600px;
            margin: 20px auto;
            padding: 20px;
            background-color: #1e1e1e;
            border-radius: 10px;
        }

        label {
            color: #ffffff;
            display: block;
            margin: 10px 0;
        }

        input[type="text"],
        textarea {
            width: 100%;
            padding: 10px;
            margin: 5px 0 20px 0;
            display: inline-block;
            border: 1px solid #ccc;
            box-sizing: border-box;
            border-radius: 5px;
            background-color: #333;
            color: #ffffff;
        }

        input[type="submit"] {
            background-color: #ff007f;
            color: #ffffff;
            padding: 10px 15px;
            border: none;
            border-radius: 5px;
            cursor: pointer;
        }

        input[type="submit"]:hover {
            background-color: #ff0055;
        }

        .delete-button {
            background-color: #ff0000;
            color: #ffffff;
            padding: 5px 10px;
            border: none;
            border-radius: 5px;
            cursor: pointer;
        }

        .delete-button:hover {
            background-color: #ff3333;
        }

        hr {
            border: 1px solid #ff007f;
            margin: 40px 0;
        }

        p {
            background-color: #1e1e1e;
            padding: 15px;
            border-radius: 10px;
            margin: 10px 0;
        }
    </style>
</head>
<body>

    <nav class="navbar navbar-expand-sm bg-dark navbar-dark">
  <div class="container-fluid">
    <ul class="navbar-nav">
      <li class="nav-item">
        <a class="nav-link" href="index.jsp?id=<%= email %>">Home</a>
      </li>
      <li class="nav-item">
        <a class="nav-link" href="login.jsp?id=<%= email %>&msg=<%= errorMessage %>">Join us</a>
      </li>
      <li class="nav-item">
        <a class="nav-link" href="contactus.jsp?id=<%= email %>">Contact us</a>
      </li>
    </ul>
  </div>
</nav>
    
    <h2>Comment Box</h2>
    <!-- Comment Box Form -->
    <form action="index.jsp" method="post">
        <label for="userName">Your Name:</label>
        <input type="text" id="userName" name="userName" required><br>

        <label for="comment">Your Comment:</label>
        <textarea id="comment" name="comment" rows="4" cols="50" required></textarea><br>

        <input type="submit" value="Submit Comment">
    </form>

    <hr>

    <!-- Display Comments -->
    <h3>Comments:</h3>
    <% for (int i = 0; i < comments.size(); i++) { %>
        <p>
            <strong><%= comments.get(i)[0] %>:</strong> <%= comments.get(i)[1] %>
            <form action="index.jsp" method="post" style="display:inline;">
                <input type="hidden" name="deleteIndex" value="<%= i %>">
                <input type="submit" value="Delete" class="delete-button">
            </form>
    <% } %>

</body>
</html>