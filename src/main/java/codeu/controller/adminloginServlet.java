// Copyright 2017 Google Inc.
//
// Licensed under the Apache License, Version 2.0 (the "License");
// you may not use this file except in compliance with the License.
// You may obtain a copy of the License at
//
//    http://www.apache.org/licenses/LICENSE-2.0
//
// Unless required by applicable law or agreed to in writing, software
// distributed under the License is distributed on an "AS IS" BASIS,
// WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
// See the License for the specific language governing permissions and
// limitations under the License.

package codeu.controller;


import codeu.model.data.User;
import codeu.model.data.Conversation;
import codeu.model.data.Message;
import codeu.model.store.basic.UserStore;
import codeu.model.store.basic.ConversationStore;
import codeu.model.store.basic.MessageStore;
import java.io.IOException;

import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.mindrot.jbcrypt.BCrypt;


public class adminloginServlet extends HttpServlet {
 
    /** These three store classes brings acces to UserStore,MessageStore and ConversationStore */
    private ConversationStore conversationStore;
    private UserStore userStore;
    private MessageStore messageStore;
    

    /** Data Store methods are placed in the init() method as it allows for the frame work of the admin.jsp */
    @Override
    public void init() throws ServletException {
        super.init();
        setConversationStore(ConversationStore.getInstance());
        setMessageStore(MessageStore.getInstance());
        setUserStore(UserStore.getInstance());
    }
           void setConversationStore(ConversationStore conversationStore) {
        this.conversationStore = conversationStore;
    }
           void setUserStore(UserStore userStore) {
        this.userStore = userStore;
    }
           void setMessageStore(MessageStore messageStore) {
        this.messageStore = messageStore;
    }
    
 
  /**
   * This function fires when a user requests the /login URL. It simply forwards the request to
   * login.jsp.
   */
  @Override
  public void doGet(HttpServletRequest request, HttpServletResponse response)
      throws IOException, ServletException {
    request.getRequestDispatcher("/WEB-INF/view/adminlogin.jsp").forward(request, response);
    String username = (String) request.getSession().getAttribute("user");
    List<User> users = userStore.getAllUsers();
    List<Message> messages = messageStore.getAllMessages();
    int count = 0;
    int max = 0;
    String mostActiveUser =  null;
    for (Message message : messages) {
      count=0;
      for(User user : users){
        String active = UserStore.getInstance().getUser(message.getAuthorId()).getName();
         if(active.equals(user.getName())){
           count++;
           if(count > max){
             max = count;
             mostActiveUser = active;
           }
         } 
       }
    }
   User user = userStore.getUser(mostActiveUser);
   request.setAttribute("user", mostActiveUser);

  }

  /**
   * This function fires when a user submits the login form. It gets the username and password from
   * the submitted form data, checks for validity and if correct adds the username to the session so
   * we know the user is logged in.
   */
  @Override
  public void doPost(HttpServletRequest request, HttpServletResponse response)
      throws IOException, ServletException {
    String username = request.getParameter("username");
    String password = request.getParameter("password");

   if (username == null) {
      // user is not logged in, don't let them add a message
      response.sendRedirect("/login");
      return;
    }
    if (!userStore.isUserRegistered(username)) {
      request.setAttribute("error", "That username was not found.");
      request.getRequestDispatcher("/WEB-INF/view/adminlogin.jsp").forward(request, response);
      return;
    }
     
    User user = userStore.getUser(username);

    if (!BCrypt.checkpw(password, user.getPasswordHash())) {
      request.setAttribute("error", "Please enter a correct password.");
      request.getRequestDispatcher("/WEB-INF/view/adminlogin.jsp").forward(request, response);
      return;
    }
    if(username.equals("admin")){
      response.sendRedirect("/admin.jsp");
    }
    request.getSession().setAttribute("user", username);
    
  }
}