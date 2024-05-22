/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package Pages;

import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.sql.*;

/**
 *
 * @author muham
 */
@WebServlet("/addTask")
public class addTask extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp)
            throws ServletException, IOException {
        PrintWriter pw = resp.getWriter();
        String username = req.getParameter("username");
        String task = req.getParameter("task");
        
        try {
            Class.forName("com.mysql.jdbc.Driver");
            String dbName = "jdbc:mysql://localhost:3306/todoapp";
            String dbUser = "root";
            String dbPass = "";

            Connection con = DriverManager.getConnection(dbName, dbUser, dbPass);
            String qry = "INSERT INTO tasks (user, task) VALUES (?, ?)";
            PreparedStatement ps = con.prepareStatement(qry);
            ps.setString(1, username);
            ps.setString(2, task);
            int res = ps.executeUpdate();
            if (res > 0) {
                resp.sendRedirect("dashboard.jsp?option=Add New Tasks");
            }
        } catch (SQLException ex) {
            pw.println("Error "+ex);
        } catch (ClassNotFoundException ex) {
            pw.println("Error "+ex);
        }
    }
}
