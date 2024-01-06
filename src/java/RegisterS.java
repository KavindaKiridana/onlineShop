import com.mysql.cj.xdevapi.Statement;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;
import java.math.BigInteger;
import java.net.URLEncoder;
import java.security.NoSuchAlgorithmException;
import java.security.SecureRandom;
import java.security.spec.InvalidKeySpecException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.crypto.SecretKeyFactory;
import javax.crypto.spec.PBEKeySpec;

@WebServlet(urlPatterns = {"/RegisterS"})
public class RegisterS extends HttpServlet {

    
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String email = request.getParameter("email");
        String password = request.getParameter("pwd");
        String password2 = request.getParameter("pwd2");
        String errorMessage=null;

        //finding two passwords are same or not
        if(password.equals(password2))
        {
            //two passwords are same 
            try 
            {
             Class.forName("com.mysql.cj.jdbc.Driver");
                Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/logindb","root" , "");
                java.sql.Statement stmt = con.createStatement();
              //password encription part
              byte[] salt = generateSalt();
              String encryptedPassword = hashPassword(password, salt);
              stmt.executeUpdate("INSERT INTO login (name, password, salt) VALUES ('" + email + "', '" + encryptedPassword + "', '" + bytesToHex(salt) + "')");
              response.sendRedirect("menu.jsp?id="+URLEncoder.encode(email,"UTF-8" )) ;
            } 
            catch (ClassNotFoundException | SQLException e) 
            {
                errorMessage=e.getMessage();
                response.sendRedirect("login.jsp?id=" + URLEncoder.encode(email, "UTF-8") + "&msg=" + URLEncoder.encode(errorMessage, "UTF-8"));
            } catch (InvalidKeySpecException ex) {
                Logger.getLogger(RegisterS.class.getName()).log(Level.SEVERE, null, ex);
            }
        }
        else
        {
            errorMessage="Two passwords must be same";
            response.sendRedirect("login.jsp?id=" + URLEncoder.encode(email, "UTF-8") + "&msg=" + URLEncoder.encode(errorMessage, "UTF-8"));
        }
    }
    
    private String hashPassword(String password, byte[] salt) throws InvalidKeySpecException {
        try {
            PBEKeySpec spec = new PBEKeySpec(password.toCharArray(), salt, 65536, 128);
            SecretKeyFactory factory = SecretKeyFactory.getInstance("PBKDF2WithHmacSHA1");
            byte[] hash = factory.generateSecret(spec).getEncoded();
            return String.format("%x", new BigInteger(1, hash));
        } catch (NoSuchAlgorithmException | InvalidKeySpecException e) {
            throw new RuntimeException("Error hashing password", e);
        }
    }

    private String bytesToHex(byte[] bytes) {
        StringBuilder hexString = new StringBuilder();
        for (byte b : bytes) {
            String hex = Integer.toHexString(0xff & b);
            if (hex.length() == 1) {
                hexString.append('0');
            }
            hexString.append(hex);
        }
        return hexString.toString();
    }
    
    private byte[] generateSalt() {
        SecureRandom random = new SecureRandom();
        byte[] salt = new byte[16]; 
        random.nextBytes(salt);
        return salt;
    }
}
