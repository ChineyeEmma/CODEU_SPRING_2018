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
   <link href="httpsa://fonts.googleapis.com/css?family=Roboto" rel="stylesheet">
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

  <div id="container" style="margin:auto">
    <div
      style="width:75%; margin-left:auto; margin-right:auto; margin-top: 50px;">

      <h1 align="center">About the Team4 coders</h1>

      <!--picture of doggo-->
      <div class="polaroid">
        <img src="https://pbs.twimg.com/profile_images/888907252702347265/g2JwwLDR_400x400.jpg" alt="doggo" style="width:100%">
          <div class="polaroidCon">
            <p>doggo.</p>
          </div>
      </div>


    <div align="center">
      <p>
        This is a chat app created by 2 CodeU students and one Google advisor 
      </p>

      <ul>

        <li><strong>John Thomas (Admin)</strong> </li>
        <li><strong>Chineye Emeghara (Style Text and UI)</strong> </li>
        <li><strong>Jonathan Tan - PA,</strong> </li>

      </ul>

      <p>
        This website that you are currently on is our teams summer project. We were given the task to modify and enhance a very basic chat app. Each of us were given a specific task to complete and we as a team had to work together in order to make sure we created a functional app that we are proud of .
      </p>
    </div>
  </div>
  </div>
</body>
</html>
