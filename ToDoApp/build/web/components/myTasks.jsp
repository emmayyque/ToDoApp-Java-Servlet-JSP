<div class="card-body p-4">
    <h4 class="text-center my-3 pb-3"><%=request.getParameter("option")%></h4>

    <table class="table mb-4">
      <thead>
        <tr>
          <th scope="col">No.</th>
          <th scope="col">User</th>
          <th scope="col">Todo Item</th>
          <th scope="col">Status</th>
          <th scope="col">Actions</th>
        </tr>
      </thead>
      <tbody>
        <%
            try {
                Class.forName("com.mysql.jdbc.Driver");
                String dbName = "jdbc:mysql://localhost:3306/todoapp";
                String dbUser = "root";
                String dbPass = "";

                String username = (String) session.getAttribute("username");
                Connection con = DriverManager.getConnection(dbName, dbUser, dbPass);
                String qry = "SELECT * FROM tasks WHERE user='"+username+"'";
                Statement st = con.createStatement();

                ResultSet rs = st.executeQuery(qry);
                while (rs.next()) { %> 
                    <tr>
                        <th scope="row"><%=rs.getInt("task_id")%></th>
                        <td><%=rs.getString("user")%></td>
                        <td><%=rs.getString("task")%></td>
                        <td><%=rs.getString("status")%></td>
                        <td>
                            <button class="btn btn-danger"><a href="deleteTask?taskID=<%=rs.getInt("task_id")%>" class="text-white text-decoration-none">Delete</a></button>
                            <button class="btn btn-success ms-1"><a href="finishTask?taskID=<%=rs.getInt("task_id")%>" class="text-white text-decoration-none">Finished</a></button>
                        </td>
                    </tr>
                <% }

            } catch (ClassNotFoundException ex) {
                out.println("Error: "+ex);
            }
        %>
      </tbody>
    </table>

  </div>