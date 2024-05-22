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
@WebServlet("/finishTask")
public class finishTask extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp)
            throws ServletException, IOException {
        PrintWriter pw = resp.getWriter();
        int taskID = Integer.parseInt(req.getParameter("taskID"));
        
        try {
            Class.forName("com.mysql.jdbc.Driver");
            String dbName = "jdbc:mysql://localhost:3306/todoapp";
            String dbUser = "root";
            String dbPass = "";

            Connection con = DriverManager.getConnection(dbName, dbUser, dbPass);
            String qry = "UPDATE tasks SET status='Finished' WHERE task_id="+taskID;
            Statement st = con.createStatement();
            int res = st.executeUpdate(qry);
            if (res > 0) {
                resp.sendRedirect("dashboard.jsp?option=My Tasks");
            }
        } catch (SQLException ex) {
            pw.println("Error "+ex);
        } catch (ClassNotFoundException ex) {
            pw.println("Error "+ex);
        }
    }
}
