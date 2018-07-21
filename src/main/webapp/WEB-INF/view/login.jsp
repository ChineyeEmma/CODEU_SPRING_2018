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

   <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
   <link href="https://fonts.googleapis.com/css?family=Roboto" rel="stylesheet">
   <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.1.0/css/all.css" integrity="sha384-lKuwvrZot6UHsBSfcMvOkWwlCMgc0TaWr+30HWe3a4ltaBwTZhyTEggF5tJv8tbt" crossorigin="anonymous">

            <meta name="google-signin-client_id" content="1048856689894-l74tkon6ne6pn6c45i6le89o42m1n0bd.apps.googleusercontent.com">

            <script src="https://apis.google.com/js/platform.js" async defer></script>

            <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>

            <script src="/js/script.js"></script>
      

    <style>
              .g-signin2
              {
                  margin-left: 50px;
                  margin-right: 20px;
              }

              .data
              {

                  display: none;
              }

    </style>

</head>
<body style="font-family:'Roboto Light', sans-serif">

    <nav>
    <a id="navTitle" href="/">Yada-Yada</a>

    <span class="navicons" style="text-align: right; margin-left:60%">
      <a href="/conversations"><i class="fas fa-comments"></i></a>
      <% if(request.getSession().getAttribute("user") != null){ %>
      <a>Hello <%= request.getSession().getAttribute("user") %>!</a>
      <% } else{ %>
      <a href="/login"><i class="fas fa-sign-in-alt"></i></button></a>
      <% } %>
      <a href="/about.jsp"><i class="fas fa-user"></i></a>
    </span>

  </nav>

  <div id="container">

    <div id="logCon" style="margin-left: 40%">

    <span style="font-size: 60px;">Login</span>

    <% if(request.getAttribute("error") != null){ %>
        <h2 style="color:red"><%= request.getAttribute("error") %></h2>
    <% } %>

    <!--traditional sign in form-->
    <form action="/login" method="POST" id="logForm">

      <label for="username" style="font-family:Roboto; margin-top: 30px; font-size:20px; ">Username: </label>
      <br/>
      <input type="text" name="username" id="username" autocomplete="username email" style="width: 200px; height: 40px;">
      <br/>
      <label for="password" style="margin-top: 20px;font-family:Roboto; font-size: 20px;" autocomplete="password">Password: </label>
      <br/>
      <input type="password" name="password" id="password" style="width: 200px; height: 40px;">
      <br/><br/>

      <div>
          <button type="submit" id="logButton">Login</button>
      </div>

      <!--Google Sign In Button-->
      <a href="/login">
        <div name="" type="submit" name="" class="g-signin2" href="/login" data-onsuccess="onSignIn" style="margin-left: 0px; width: 200%">
        </div>
      </a>

    </form>

    <p style="font-family: Roboto; margin-top:10px; font-size: 20px;">New users can register <a href="/register">here</a>.</p>

    <div style="height: 10px;"></div>

     <p style="font-family: Roboto; margin-top:10px; font-size: 20px;">change profile pic <a href="/changeprofilepic"> !</a>.
    </p>
    
    </div>
  </div>
</body>
</html>
