<%--
  Copyright 2017 Google Inc.

  Licensed under the Apache License, Version 2.0 (the "License");
  you may not use this file except in compliance with the License.
  You may obtain a copy of the License at

     http://www.apache.org/licenses/LICENSE-2.0

  Unless required by applicable law or agreed to in writing, software
  distributed under the License is distributed on an "AS IS" BASIS,
  WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
  See the License for the specific language governing permissions and
  limitations under the License.
--%>
<!DOCTYPE html>
<html>
<head>
  <title>Login</title>
  <link rel="stylesheet" href="/css/main.css">
</head>
<body>

  <nav>
    <a id="navTitle" href="/">CodeU Chat App</a>
    <a href="/conversations">Conversations</a>
    <% if(request.getSession().getAttribute("user") != null){ %>
      <a>Hello <%= request.getSession().getAttribute("user") %>!</a>
    <% } else{ %>
      <a href="/login">Login</a>
    <% } %>
    <a href="/about.jsp">About</a>
  </nav>

  <div id="container">
    <h1>Login</h1>

    <% if(request.getAttribute("error") != null){ %>
        <h2 style="color:red"><%= request.getAttribute("error") %></h2>
    <% } %>

    <form action="/login" method="POST">
      <label for="username">Username: </label>
      <br/>
      <input type="text" name="username" id="username">
      <br/>
      <label for="password">Password: </label>
      <br/>
      <input type="password" name="password" id="password">
      <br/><br/>
      <div><a href="/login">GOOGLE SIGN IN</a>
            <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">

            <meta name="google-signin-client_id" content="1048856689894-39vdb2phm51qr4io83gid11biphvl86j.apps.googleusercontent.com">

            <script src="https://apis.google.com/js/platform.js" async defer></script>
            <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
            <script src="script.js"></script>

            <style>
              .g-signin2{
                  margin-left: 50px;
                  margin-right: 20px;
              }

              .data{
                display:none;
              }
            </style>

        </div>

        <div class="g-signin2" data-onsuccess="onSignIn">
        </div>
        <div class="data">
          <p> Profile Deets</p>
          <img id="sign-in-pic" class="img-circle" width="100" height="100"/>
          <p>EMAIL</p>
          <p id="email" class= "alert-danger"></p>
          <button onclick="signOut()" class="btn btn-danger">SIGN OUT</button>
        </div>


    </form>

    <p>New users can register <a href="/register">here</a>.</p>
  </div>
</body>
</html>
