<div class="card-body p-4">
    <h4 class="text-center my-3 pb-3"><%=request.getParameter("option")%></h4>

    <form class="row row-cols-lg-auto g-3 justify-content-center align-items-center mb-4 pb-2" action="addTask?username=<%=(String) session.getAttribute("username")%>" method="POST">
      <div class="col-12">
        <div class="form-outline">
          <input type="text" id="task" name="task" class="form-control" />
          <label class="form-label" for="task">Enter a task here</label>
        </div>
      </div>

      <div class="col-12">
          <input type="submit" class="btn btn-primary" value="Add Task"> 
      </div>

<!--                  <div class="col-12">
        <button type="submit" class="btn btn-warning">Get tasks</button>
      </div>-->
    </form>

    <table class="table mb-4">
      <thead>
        <tr>
          <th scope="col">No.</th>
          <th scope="col">User</th>
          <th scope="col">Todo Item</th>
          <th scope="col">Status</th>
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
                String qry = "SELECT * FROM tasks WHERE user='"+username+"' AND status='In progress'";
                Statement st = con.createStatement();

                ResultSet rs = st.executeQuery(qry);
                while (rs.next()) { %> 
                    <tr>
                        <th scope="row"><%=rs.getInt("task_id")%></th>
                        <td><%=rs.getString("user")%></td>
                        <td><%=rs.getString("task")%></td>
                        <td><%=rs.getString("status")%></td>
                    </tr>
                <% }

            } catch (ClassNotFoundException ex) {
                out.println("Error: "+ex);
            }
        %>
      </tbody>
    </table>

  </div>