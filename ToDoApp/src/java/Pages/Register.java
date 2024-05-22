/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package Pages;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletContext;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.MultipartConfig;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import jakarta.servlet.http.Part;
import java.io.FileOutputStream;
import java.io.InputStream;
import java.sql.*;

/**
 *
 * @author muham
 */

@MultipartConfig
@WebServlet("/Register")
public class Register extends HttpServlet {
    
    @Override
    protected void service(HttpServletRequest req, HttpServletResponse resp)
            throws ServletException, IOException {
        PrintWriter pw = resp.getWriter();
        ServletContext context = getServletContext();
        String webAppPath = context.getRealPath("/");
        
        String name = req.getParameter("name");
        String username = req.getParameter("username");
        String email = req.getParameter("email");
        String password = req.getParameter("password");
        
        Part file = req.getPart("profilePic");
        
        String imageFileName = file.getSubmittedFileName();
        
        String uploadPath = webAppPath + "img/profile/" + imageFileName;
        String dbImgPath = "img/profile/" + imageFileName;
        
        try {
            FileOutputStream fos = new FileOutputStream(uploadPath);
            InputStream is = file.getInputStream();
            
            byte[] data  = new byte[is.available()];
            is.read(data);
            fos.write(data);
            fos.close();
        } catch (Exception e) {
            pw.println("Error: " + e);
        }
        
        try {
            Class.forName("com.mysql.jdbc.Driver");
            String dbUrl = "jdbc:mysql://localhost:3306/todoapp";
            String dbUser = "root";
            String dbPass = "";
            
            Connection con = DriverManager.getConnection(dbUrl, dbUser, dbPass);
            String qry = "INSERT INTO users (name, username, email, password, profile_pic) VALUES (?, ?, ?, ?, ?)";
            PreparedStatement ps = con.prepareStatement(qry);
            ps.setString(1, name);
            ps.setString(2, username);
            ps.setString(3, email);
            ps.setString(4, password);
            ps.setString(5, dbImgPath);
            
            int res = ps.executeUpdate();
            if (res > 0) {
                resp.setContentType("text/html");
                pw.println("<script type=\"text/javascript\">"); 
                pw.println("alert('User Registered Successfully');"); 
                pw.println("</script>"); 
                RequestDispatcher rd = req.getRequestDispatcher("login.jsp");
                rd.include(req, resp);
            } 
        } catch (SQLException ex) {
            pw.println("Error in SQL" + ex);
        } catch (ClassNotFoundException ex) {
            pw.println("Error: Class Not Found" + ex);
        }
    }
}