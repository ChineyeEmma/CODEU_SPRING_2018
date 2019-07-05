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
<%@ page import="codeu.model.data.Message" %>
<%@ page import="codeu.model.store.basic.UserStore" %>
<%
Conversation conversation = (Conversation) request.getAttribute("conversation");
List<Message> messages = (List<Message>) request.getAttribute("messages");
%>

<!DOCTYPE html>
<html>
<head>
  <title><%= conversation.getTitle() %></title>
   <link href="https://fonts.googleapis.com/css?family=Roboto" rel="stylesheet">
   <link rel="stylesheet" href="/css/main.css">
   <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.1.0/css/all.css" integrity="sha384-lKuwvrZot6UHsBSfcMvOkWwlCMgc0TaWr+30HWe3a4ltaBwTZhyTEggF5tJv8tbt" crossorigin="anonymous">

 <script src="https://apis.google.com/js/platform.js" async defer></script>

   <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>

   <script src="/js/script.js"></script>
   
  <style>
    #chat {
      background-color: white;
      height: 500px;
      overflow-y: scroll
    }
  </style>

  <script>
    // scroll the chat div to the bottom
    function scrollChat() {
      var chatDiv = document.getElementById('chat');
      chatDiv.scrollTop = chatDiv.scrollHeight;
    };
  </script>
</head>
<body onload="scrollChat()">

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

       <!--user profile photo-->
    <div class="data" style="margin-left: 60px; margin-top: 10px;">
            <img id="picChange" src="https://pbs.twimg.com/profile_images/888907252702347265/g2JwwLDR_400x400.jpg" style="width: 200px; height: 200px; border-radius: 50%; margin-left:40%;"/>
    <div id="container" style="margin-left: 1%;padding-left: 10px">


    <h1 style= "color: #d62d20; text-align: center; font-size: 60px;"><%= conversation.getTitle() %>
      <a href="" style="float: right">&#8635;</a></h1>

    <hr/>

    <div id="chat" style="background-color: #d62d20;width:49%;margin-left:25%;border-radius: 70px;color: white;">
      <ul>
    <%
      for (Message message : messages) {
        String author = UserStore.getInstance()
          .getUser(message.getAuthorId()).getName();
    %>

      <!--messages in the chat-->
      <!--if it is author message align right, else align left-->

              <%if(author.equals(request.getSession().getAttribute("user"))) { %>

                  <li style="text-align: right; padding-bottom: 10px; margin-left: 15%; padding-right: 10px; border-radius: 20px; margin-top: 30px; width: 80% ; background-color: #8e2d2b;font-size:1.5em;padding-top: 10px;"><strong><%= author %>:</strong> <em><%= message.getContent() %></em></li>
           <% } else { %>

                <!--not logged in user, align left-->
                <li style="text-align: left; padding-bottom: 10px; margin-right: 15%; padding-left: 10px; border-radius: 20px; margin-top: 30px; width: 80% ; background-color: #8e2d2b;font-size:1.5em;padding-top: 10px;"><strong><%= author %>:</strong> <em><%= message.getContent() %></em></li>
            <% } 

      }%>

      </ul>
    </div>

    <hr/>

    <% if (request.getSession().getAttribute("user") != null) { %>
    <form style="margin-left: 25%" action="/chat/<%= conversation.getTitle() %>" method="POST">
        <input type="text" name="message" style="border-radius: 20px; width: 380px;; height: 40px;">
        <br/>


        <button style="font-size: 25px; margin-top: 10px; margin-bottom: 10px; color: white; border-width: 5px; border-color: #a94442; background-color: #d62d20; border-radius: 20px; width: 35%; height: 50px; padding:10px;" type="submit">Send</button>

    </form>
    <% } else { %>
      <p><a href="/login">Login</a> to send a message.</p>
    <% } %>

    <hr/>

  </div>

</body>
</html>
