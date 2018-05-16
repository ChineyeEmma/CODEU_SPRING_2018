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
  <title>CodeU Chat App</title>
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
    <div
      style="width:75%; margin-left:auto; margin-right:auto; margin-top: 50px;">

      <h1>About the Team4 coders</h1>
      <p>
        This is a chat app created by 3 CodeU students and one google advisor 
      </p>

      <ul>
        <li><strong>David Fernandez-Wang</strong>David is a rising sophmore attending the University of Illinois. In his spare time he likes to juggle and do robotics</li>
        <li><strong>John Thomas</strong> John is an upcoming junior from Fisk University. His majors include computer science along with physics. listining to music and playing basketball are some of his favorite hobbies</li>
        <li><strong>Chineye Emeghara</strong> Chineye attends the University of Texas at Austin. She is majoring in Computer Science, Digital Art, and Entertainment (Technologies which are primarly technology used to make films). She is a film buff with her favorite movies including Prisoners, X-Men First Class, and The Nice Guys.Her favorite artist are the Strokes, Alt J, and George Ezra.</li>
        <li><strong>Jonathan Tan - PA,</strong>Jonathon is the supervisor of our team. He works in the Git a.k.a. version control team at Google. Version control is basically keeping up with all of the changes or modifiers that are made to a code. He enjoys reading and learning languages such as French and Spanish.</li>

      </ul>

      <p>
        This website that you are currently on is our teams summer project. We were given the task to modify and enhance a very basic chat app. Each of us were given a specific task to complete and we as a team had to work together in order to make sure we created a functional app that we are proud of.
      </p>
    </div>
  </div>
</body>
</html>
