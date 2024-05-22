<%-- 
    Document   : index
    Created on : Dec 27, 2023, 4:24:33 PM
    Author     : muham
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page import = "java.sql.*" %>

<!DOCTYPE html>
<html lang="en">
    <head>
      <meta charset="UTF-8" />
      <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
      <meta http-equiv="x-ua-compatible" content="ie=edge" />
      <title>Task Master | Dashboard</title>
      <!-- MDB icon -->
      <link rel="icon" href="img/mdb-favicon.ico" type="image/x-icon" />
      <!-- Font Awesome -->
      <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.15.2/css/all.css" />
      <!-- Google Fonts Roboto -->
      <link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Roboto:wght@300;400;500;700;900&display=swap" />
      <!-- MDB -->
      <link rel="stylesheet" href="css/bootstrap-to-do-list.min.css" />
      <!-- Link to the CSS -->
      
      <style>
          * {
              font-family: 'Jost', sans-serif;
          }
          
          a {
              text-decoration: none;
          }
          
      </style>
    </head>

    <body>
        <%@include file="components/header.jsp" %>
        <!-- Start your project here-->
    <section class="vh-100" style="background-color: #eee;">
        <%
            if (request.getParameter("option") != null) { %>
                <div class="container py-5 h-100">
                    <div class="row d-flex justify-content-center align-items-center h-100">
                      <div class="col col-lg-12 col-xl-12 d-flex">

                        <div class="card rounded-3 col-3 mx-1">
                          <div class="card-body p-4">
                              <div class="col-12 m-auto">
                                  <img src="<%=session.getAttribute("profilePic")%>" class="col-12 text-center border rounded-circle" alt="">
                              </div>
                            <h4 class="text-center my-3 pb-3">Welcome <%=session.getAttribute("username")%></h4>

                            <div class="mb-5 mt-5">
                                <button class="btn btn-primary mt-1 mb-1"><a href="dashboard.jsp?option=My Tasks" class="text-white text-decoration-none">My Tasks</a></button>
                                <button class="btn btn-success mt-1 mb-1"><a href="dashboard.jsp?option=Finished Tasks" class="text-white text-decoration-none">Finished Tasks</a></button>
                                <button class="btn btn-dark mt-1 mb-1"><a href="dashboard.jsp?option=Add New Tasks" class="text-white text-decoration-none">Add New Tasks</a></button>
                            </div>
                          </div>
                        </div>

                        <!-- Component goes here -->
                        <div class="card rounded-3 col-9 mx-1">
                            <% 
                                if (request.getParameter("option").equals("My Tasks")) { %>
                                    <%@include file="components/myTasks.jsp" %>
                                <% } else if (request.getParameter("option").equals("Finished Tasks")) { %>
                                    <%@include file="components/finishedTasks.jsp" %>
                                <% } else if (request.getParameter("option").equals("Add New Tasks")) { %>
                                    <%@include file="components/addNewTasks.jsp" %>
                                <% }
                            %>
                        </div>
                      </div>
                    </div>
                </div>
            <% } else { %>
                <div class="container py-5 h-100">
                    <div class="row d-flex justify-content-center align-items-center h-100">
                      <div class="col col-lg-12 col-xl-12 d-flex">

                        <div class="card rounded-3 col-3 mx-1">
                          <div class="card-body p-4">
                              <div class="col-12 m-auto">
                                  <img src="<%=session.getAttribute("profilePic")%>" class="col-12 text-center border rounded-circle" alt="">
                              </div>
                            <h4 class="text-center my-3 pb-3">Welcome <%=session.getAttribute("username")%></h4>

                            <div class="mb-5 mt-5">
                                <button class="btn btn-primary mt-1 mb-1"><a href="dashboard.jsp?option=My Tasks" class="text-white text-decoration-none">My Tasks</a></button>
                                <button class="btn btn-success mt-1 mb-1"><a href="dashboard.jsp?option=Finished Tasks" class="text-white text-decoration-none">Finished Tasks</a></button>
                                <button class="btn btn-dark mt-1 mb-1"><a href="dashboard.jsp?option=Add New Tasks" class="text-white text-decoration-none">Add New Tasks</a></button>
                            </div>
                          </div>
                        </div>
                      </div>
                    </div>
                </div>
            <% }
        %>
        
        </section>
        <!-- End your project here-->

        <!-- MDB -->
        <script type="text/javascript" src="js/mdb.min.js"></script>
        <!-- Custom scripts -->
        <script type="text/javascript"></script>
    </body>
</html>