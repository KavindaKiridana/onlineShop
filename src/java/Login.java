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
public class Login extends HttpServlet {

    
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String email= request.getParameter("email");
        String password = request.getParameter("pwd");
        String errorMessage=null;

        try {
            // Load the database driver
            Class.forName("com.mysql.cj.jdbc.Driver");

            // Connect to the database
            Connection connection = DriverManager.getConnection("jdbc:mysql://localhost:3306/logindb", "root", "");

            // Prepare the SQL query with placeholders
            PreparedStatement preparedStatement = connection.prepareStatement("SELECT salt, password FROM login WHERE name = ?");
            preparedStatement.setString(1, email);

            // Execute the query
            ResultSet results = preparedStatement.executeQuery();

            // Check if a matching user was found
            if (results.next()) {
                // Retrieve salt and hashed password from database
                byte[] storedSalt = hexStringToByteArray(results.getString("salt"));
                String storedPassword = results.getString("password");

                // Hash the entered password with the retrieved salt
                String hashedPassword = hashPassword(password, storedSalt);

                // Compare the hashed passwords
                if (hashedPassword.equals(storedPassword)) {
                    // Login successful
                    response.sendRedirect("menu.jsp?id=" + URLEncoder.encode(email, "UTF-8"));
                } else {
                    // Invalid password
                    errorMessage="Invalid password";
                    response.sendRedirect("login.jsp?id=" + URLEncoder.encode(email, "UTF-8") + "&msg=" + URLEncoder.encode(errorMessage, "UTF-8"));
                }
            } else {
                errorMessage="User not found";
                response.sendRedirect("login.jsp?id=" + URLEncoder.encode(email, "UTF-8") + "&msg=" + URLEncoder.encode(errorMessage, "UTF-8"));
            }

        } catch (ClassNotFoundException | SQLException | InvalidKeySpecException | NoSuchAlgorithmException e) {
            
            errorMessage=e.getMessage();
            response.sendRedirect("login.jsp?id=" + URLEncoder.encode(email, "UTF-8") + "&msg=" + URLEncoder.encode(errorMessage, "UTF-8"));
        }
    }

    // Helper methods for password hashing

    private byte[] hexStringToByteArray(String s) {
        int len = s.length();
        byte[] data = new byte[len / 2];
        for (int i = 0; i < len; i += 2) {
            data[i / 2] = (byte) ((Character.digit(s.charAt(i), 16) << 4)
                                 + Character.digit(s.charAt(i+1), 16));
        }
        return data;
    }

    private String hashPassword(String password, byte[] salt) throws NoSuchAlgorithmException, InvalidKeySpecException {
        PBEKeySpec spec = new PBEKeySpec(password.toCharArray(), salt, 65536, 128);
        SecretKeyFactory factory = SecretKeyFactory.getInstance("PBKDF2WithHmacSHA1");
        byte[] hash = factory.generateSecret(spec).getEncoded();
        return String.format("%x", new BigInteger(1, hash));
    }
    
  
//i added an encripted user validation method in java and simple javasript alert code to display an alert box
    
}