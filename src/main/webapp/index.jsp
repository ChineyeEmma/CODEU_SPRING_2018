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
  <title>Team4 Chat App</title>
  <link rel="stylesheet" href="/css/main.css">
</head>
<body>
  <nav>
    <a id="navTitle" href="/">Team4 Chat App</a>
    <a href="/conversations">Conversations</a>
    <% if(request.getSession().getAttribute("user") != null){ %>
      <a>Hello <%= request.getSession().getAttribute("user") %>!</a>
    <% } else{ %>
      <a href="/login">Login</a>
    <% } %>
    <a href="/about.jsp">About</a>
  </nav>

  <div id="container">
    <div
      style="width:75%; margin-left:auto; margin-right:auto; margin-top: 50px;">

      <h1>Team Four Chat App</h1>
      <h2>Welcome to our webchat app!</h2>

      <ul>
        <li>
            <a href="/login"><button class="linkButtons homeButtons">Login to Get Started.</button></a>
        </li>

        <li>
            <a href="/conversations"><button class="linkButtons homeButtons">Start A Conversation!</button></a>
        </li>

        <li>
            <a href="/about.jsp"><button class="linkButtons homeButtons">About Us and Our Project!</button></a>
        </li>

         <li>
            <a href="/adminlogin"><button class="linkButtons homeButtons">Admin Page</button></a>
        </li>
            
      </ul>
    </div>
  </div>
</body>
</html>
