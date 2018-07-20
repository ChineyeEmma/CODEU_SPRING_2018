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


    <div id="con">

        <p style="margin-top: 20px;">Change your profile photo</p>

       <img id="profilePic" src="https://pbs.twimg.com/profile_images/888907252702347265/g2JwwLDR_400x400.jpg" alt="doggo" 
       style="width:100%">

    </div>

    <!--traditional sign in form-->
    <form action="/changeProfilePic" method="POST" id="profilePicForm">

      <label for="profilePic" style="font-family:Roboto; margin-top: 30px; font-size:20px; ">Paste Imgur URL: </label>
      <br/>
      <input type="text" name="profilePic" id="profilePic" style="width: 200px; height: 40px;">
      <br/>

      <div>
          <button type="submit" id="subPic" data-onsuccess="changeProfilePic">Change Profile Pic</button>
      </div>

    </form>

  </body>
</html>
