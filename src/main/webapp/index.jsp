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
  <title>Team Four Chat App</title>
  <link href="https://fonts.googleapis.com/css?family=Roboto" rel="stylesheet">
  <link rel="stylesheet" href="/css/main.css">
  <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.1.0/css/all.css" integrity="sha384-lKuwvrZot6UHsBSfcMvOkWwlCMgc0TaWr+30HWe3a4ltaBwTZhyTEggF5tJv8tbt" crossorigin="anonymous">
</head>
<body>
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

  <div id="container" style="margin: auto; text-align:center">

   <p style="font-size: 50px; margin-left:40px">Welcome to Yada-Yada, Chat Away!</p>

    <div style="width:100%; margin-top: 50px;">

      <ul>
        <li>
            <a href="/login"><button class="linkButtons homeButtons"><i title="Login" class="fas fa-sign-in-alt"></i></button></a>
        </li>

        <li>
            <a href="/conversations"><button class="linkButtons homeButtons"><i title="Convos"class="fas fa-comments"></i></button></a>
        </li>

        <li>
            <a href="/about.jsp"><button class="linkButtons homeButtons"><i title="About"class="fas fa-user"></i></button></a>
        </li>

        <li>
            <a href="/adminlogin"><button class="linkButtons homeButtons"><i title="Admin"class="fas fa-lock"></i></button></a>
        </li>
            
      </ul>
    </div>
  </div>
</body>
</html>
