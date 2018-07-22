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
<%@ page import="java.util.List" %>
<%@ page import="codeu.model.data.Conversation" %>
<%@ page import="codeu.model.data.User" %>
<%@ page import="codeu.model.data.Message" %>
<%@ page import="codeu.model.store.basic.UserStore" %>




<!DOCTYPE html>
<html>
<head>
  <title>Conversations</title>
   <link rel="stylesheet" href="/css/main.css">
   <link href="https://fonts.googleapis.com/css?family=Roboto" rel="stylesheet">
   <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.1.0/css/all.css" integrity="sha384-lKuwvrZot6UHsBSfcMvOkWwlCMgc0TaWr+30HWe3a4ltaBwTZhyTEggF5tJv8tbt" crossorigin="anonymous">

   <script src="https://apis.google.com/js/platform.js" async defer></script>

   <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>

   <script src="/js/script.js"></script>
</head>
<body>

  <nav>
    <a id="navTitle" href="/">Yada-Yada</a>

    <span class="navicons" style="text-align: right; margin-left:10%">
      <a href="/conversations"><i class="fas fa-comments"></i></a>
      <% if(request.getSession().getAttribute("user") != null){ %>
      <a>Hello <%= request.getSession().getAttribute("user") %>!</a>
      <% } else{ %>
      <a href="/login"><i class="fas fa-sign-in-alt"></i></button></a>
      <% } %>
      <a href="/about.jsp"><i class="fas fa-user"></i></a>
    </span>

  </nav>


  <div id="container" style="margin-left: 1%;padding-left: 10px">

        <!--user profile photo-->
        <div class="data" src="https://pbs.twimg.com/profile_images/888907252702347265/g2JwwLDR_400x400.jpg">
            <img id="picChange"  onload="setProfilePic()" style="width: 100px; height: 100px; border-radius: 50%"/>
            <p id="test"></p>
        </div>


    <% if(request.getAttribute("error") != null){ %>
        <h2 style="color:red"><%= request.getAttribute("error") %></h2>
    <% } %>

    <% if(request.getSession().getAttribute("user") != null){ %>
      <h1 style="color: #a94442; font-size: 30px;">New Conversation</h1>
      <form action="/conversations" method="POST">
          <div class="form-group" style="margin-bottom: 20px;">
            <label style="font-size:30px; color:#a94442" class="form-control-label">title:</label>
          <input type="text" name="conversationTitle" style="width: 250px; height:40px; border-radius: 20px; font-size:25px; padding-left: 10px; color: #a94442">
        </div>

        <button type="submit" style="border-radius: 20px; color:white; font-size: 25px; margin-left: 70px;height: 50px;width: 260px;background-color: #d62d20">let's chat!</button>
      </form>

      <hr/>
    <% } %>

   
    <p style="font-size: 60px; margin-left:20px; font-weight: bold; color:#a94442 "><%= request.getSession().getAttribute("user") %>'s Conversations</p>



<div>
    <%

    UserStore userS = UserStore.getInstance(); //get user store

    List<Conversation> conversations =
      (List<Conversation>) request.getAttribute("conversations");
    if(conversations == null || conversations.isEmpty()){
    %>
      <p>Create a convo!</p>
    <%
    }
    else{
    %>
      <ul class="mdl-list">
    <%

      for(Conversation conversation : conversations){
    %>
      <li><a id="convo-item" style=" font-style: italic; border-radius: 20px; height: 60px; width: 60%; font-size: 40px; text-align: center; display:block; color:white; padding: 20px; text-decoration: none; margin-top: 20px; background-color: #d62d20;" href="/chat/<%= conversation.getTitle() %>">

        <%= conversation.getTitle() + " Started By: " + userS.getUser(conversation.getOwnerId()).getName()%></a>

      </li>
    <%
      }
    %>
      </ul>
    </div>



    <%
    }
    %>
    <hr/>
  </div>
</body>
</html>
