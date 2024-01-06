import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;
import java.security.NoSuchAlgorithmException;
import java.security.spec.InvalidKeySpecException;
import java.math.BigInteger;
import java.net.URLEncoder;
import javax.crypto.SecretKeyFactory;
import javax.crypto.spec.PBEKeySpec;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

@WebServlet(urlPatterns = {"/RegisterS"})
public class Item extends HttpServlet {

    
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String email= request.getParameter("email");
        String itemId = request.getParameter("itemid");
        String errorMessage=null;
        
        
    if (email == null || email.trim().isEmpty()) 
    {
        errorMessage = "Please login before adding to cart";
    } else 
    {
            try
            {
                Class.forName("com.mysql.cj.jdbc.Driver");
                Connection connection = DriverManager.getConnection("jdbc:mysql://localhost:3306/logindb", "root", "");
                String sql = "INSERT INTO carttable (name, itemid) VALUES (?,?)";
                PreparedStatement preparedStatement = connection.prepareStatement(sql);
                preparedStatement.setString(1, email);
                preparedStatement.setString(2, itemId);
                preparedStatement.executeUpdate();
                errorMessage = "Item added to cart";
            }
            catch (ClassNotFoundException | SQLException e) 
            {
            errorMessage = e.getMessage();
            }
    }
        response.sendRedirect("menu.jsp?id=" + URLEncoder.encode(email, "UTF-8") + "&msg=" + URLEncoder.encode(errorMessage, "UTF-8"));
    }  
}