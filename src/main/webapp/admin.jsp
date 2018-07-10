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
 <%-- these three imports bring our infromation from the DataStore class --%>
<%@ page import="codeu.model.store.basic.ConversationStore" %>
    <%@ page import="codeu.model.store.basic.UserStore"%>
     <%@ page import="codeu.model.store.basic.MessageStore"%>
     <%-- These three steps give us the value of the Datastore .size() methods and also stores their values --%>
<% 
int numConversations = ConversationStore.getInstance().getNumConversations();
int numUsers = UserStore.getInstance().getNumUsers();
int numMessages = MessageStore.getInstance().getNumMessages();
%>

<!DOCTYPE html>
<html>
<head>
  <title>Admin page</title>
  <link rel="stylesheet" href="/css/main.css">
</head>
<body>

  <nav>
    <a id="navTitle" href="/">Admin Page</a>
    <a href="/conversations">Conversations</a>
    <% if(request.getSession().getAttribute("user") != null){ %>
      <a>Hello <%= request.getSession().getAttribute("user") %>!</a>
    <% } else{ %>
      <a href="/login">Login</a>
    <% } %>
    <a href="/admin.jsp">Admin</a>
  </nav>

</ul>
  <div id="container">
    <div
      style="width:75%; margin-left:auto; margin-right:auto; margin-top: 50px;">

      <h1>Here is the administrative page 
</h1>
<p>
    <%-- This calls their numbers and displayes them on the page --%>
<li>The conversation count is <%= numConversations%> </li> 
<li>The user count is <%= numUsers%></li>
<li>There have been <%= numMessages%> messages</li>:
      </p>

         
    </div>
  </div>
</body>
</html>
