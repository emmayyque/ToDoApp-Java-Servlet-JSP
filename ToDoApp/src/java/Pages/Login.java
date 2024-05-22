/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package Pages;

import jakarta.servlet.RequestDispatcher;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.sql.*;

/**
 *
 * @author muham
 */
@WebServlet("/Login")
public class Login extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp)
            throws ServletException, IOException {
        PrintWriter pw = resp.getWriter();
        String username = req.getParameter("username");
        String password = req.getParameter("password");
        
        try {
            Class.forName("com.mysql.jdbc.Driver");
            String dbName = "jdbc:mysql://localhost:3306/todoapp";
            String dbUser = "root";
            String dbPass = "";

            Connection con = DriverManager.getConnection(dbName, dbUser, dbPass);
            String qry = "SELECT * FROM users WHERE username='"+username+"' AND password='"+password+"'";
            Statement st = con.createStatement();
            ResultSet rs = st.executeQuery(qry);
            if (rs.next()) {
                HttpSession session = req.getSession();
                session.setAttribute("username", rs.getString("username"));
                session.setAttribute("profilePic", rs.getString("profile_pic"));
                resp.sendRedirect("dashboard.jsp");
            } else {
                resp.setContentType("text/html");
                pw.println("<script type=\"text/javascript\">"); 
                pw.println("alert('Invalid Username or Password');"); 
                pw.println("</script>"); 
                RequestDispatcher rd = req.getRequestDispatcher("login.jsp");
                rd.include(req, resp);
            }
        } catch (SQLException ex) {
            pw.println("Error "+ex);
        } catch (ClassNotFoundException ex) {
            pw.println("Error "+ex);
        }
    }
}