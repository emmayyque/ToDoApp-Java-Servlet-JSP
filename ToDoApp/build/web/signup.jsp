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
      <title>Task Master | Signup</title>
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
          input[type=text] {
              margin: 15px 0px;
              border: none;
              outline: none;
              border-bottom: 2px solid #000000;
              padding: 5px;
          }
          input[type=password] {
              margin: 15px 0px;
              border: none;
              outline: none;
              border-bottom: 2px solid #000000;
              padding: 5px;
          }
          input[type=email] {
              margin: 15px 0px;
              border: none;
              outline: none;
              border-bottom: 2px solid #000000;
              padding: 5px;
          }
          input[type=submit] {
              align-self: center;
              width: 50%;
          }
          h2 { 
              text-align: center;
              font-weight: 600;
              text-transform: uppercase;
              margin-bottom: 20px;
          }
      </style>
    </head>

    <body>
        <%@include file="components/header.jsp" %>
        <!-- Start your project here-->
        <section class="vh-100" style="background-color: #eee;">
            
        <div class="container py-5 h-100">
          <div class="row d-flex justify-content-center align-items-center h-100">
            <div class="col col-lg-12 col-xl-12 d-flex">
              <div class="card rounded-3 col-5 mx-auto">
                <div class="card-body p-4">
                    <form action="Register" method="POST" enctype='multipart/form-data'>
                        <h2 class="text-primary">Sign Up Form</h2>
                        <div class="d-flex flex-column">
                            <label for="name">Name</label>
                            <input type="text" name="name" required>
                        </div>
                        <div class="d-flex flex-column">
                            <label for="username">Username</label>
                            <input type="text" name="username" required>
                        </div>
                        <div class="d-flex flex-column">
                            <label for="email">Email</label>
                            <input type="email" style="border: none; border-bottom: 2px solid #000000;" class="mb-3" name="email" required>
                        </div>
                        <div class="d-flex flex-column mb-3">
                            <label for="password">Password</label>
                            <input type="password" style="border: none; border-bottom: 2px solid #000000;" name="password" required>
                        </div>
                        <div class="d-flex flex-column">
                            <label for="profilePic">Add Profile Pic</label>
                            <input type="file" class="mb-3" name="profilePic" required>
                        </div>
                        <input class="btn btn-primary m-auto" type="submit" name="signUpBtn" value="Sign Up" required>
                    </form>
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