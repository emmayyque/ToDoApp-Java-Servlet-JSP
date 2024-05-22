<header>
    <nav class="col-lg-12 bg-primary">
        <ul class="col-6 list-inline text-align-center d-flex p-3 m-0 text-center mx-auto">
            <%
                if (session.getAttribute("username") != null) { %>
                    <li class="mx-4 text-center"><a href="dashboard.jsp" class="text-white">Dashboard</a></li>
                    <li class="mx-4 text-center"><a href="dashboard.jsp?option=My Tasks" class="text-white">My Tasks</a></li>
                    <li class="mx-4 text-center"><a href="dashboard.jsp?option=Finished Tasks" class="text-white">Finished Tasks</a></li>
                    <li class="mx-4 text-center"><a href="dashboard.jsp?option=Add New Tasks" class="text-white">My Tasks</a></li>
                <% } else { %>
                    <li class="mx-4 text-center"><a href="index.jsp" class="text-white">Home</a></li>
                <% }
            %>
            
            
            <%
                if (session.getAttribute("username") != null) { %>
                    <li class="mx-4 text-center"><a href="Logout" class="text-white">Logout</a></li> 
                <% } else { %>
                    <li class="mx-4 text-center"><a href="login.jsp" class="text-white">Login</a></li> 
                    <li class="mx-4 text-center"><a href="signup.jsp" class="text-white">Sign Up</a></li> 
                <% }
            %>
            
        </ul>
    </nav>
</header>