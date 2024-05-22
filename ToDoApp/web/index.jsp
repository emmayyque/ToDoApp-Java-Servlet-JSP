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
      <title>Task Master</title>
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
          
          h1 { 
              font-size: 4.5rem;
          }
          
          h2 { 
              font-size: 3rem;
          }
          
          p { 
              font-size: 1.5rem;
          }
      </style>
    </head>

    <body>
        <%@include file="components/header.jsp" %>
        <!-- Start your project here-->
        <section class="vh-100 bg-primary bg-opacity-10" style="background-color: #eee;">
            
        <div class="container py h-100 m-auto">
          <div class="row d-flex justify-content-center align-items-center h-100">
            <div class="col col-lg-12 col-xl-12 d-flex justify-content-center align-items-center">
                <div class="card rounded-3 col-7 mx-auto bg-transparent shadow-none">
                    <h1 class="text-primary">Welcome to TaskMaster</h1>
                    <h3 class="text-dark mt-3 mb-3">Your Ultimate Todo List App</h3>
                    <p class="text-muted">Stay organized and on top of your tasks with TaskMaster. Our intuitive design and powerful features make managing your to-dos a breeze.</p>
                    <span><button class="btn btn-primary "><a class="text-light" href="login.jsp">Login</a></button></span>
                </div>
                
                <div class="card rounded-3 col-5 my-auto bg-transparent shadow-none">
                <div class="card-body p-4 m-auto">
                    <div class="col-12 m-auto">
                        <img src="img/todo.png" class="col-12 text-center" alt="">
                    </div>
                </div>
              </div>
            </div>
          </div>
        </div>
        </section>
        <!-- End your project here-->

        <!-- MDB -->
        <script type="text/javascript" src="js/mdb.min.js"></script>
        <!-- Custom scripts -->
        <script type="text/javascript"></script>
    </body>
</html>