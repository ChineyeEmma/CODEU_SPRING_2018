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


import codeu.model.store.basic.ConversationStore;
import codeu.model.store.basic.MessageStore;
import codeu.model.store.basic.UserStore;
import codeu.model.data.User;
import codeu.model.store.basic.UserStore;
import java.io.IOException;
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
   * Set up state for handling login-related requests. This method is only called when running in a
   * server, not when running in a test.
   */
  
  /**
   * This function fires when a user requests the /login URL. It simply forwards the request to
   * login.jsp.
   */
  @Override
  public void doGet(HttpServletRequest request, HttpServletResponse response)
      throws IOException, ServletException {
    request.getRequestDispatcher("/WEB-INF/view/adminlogin.jsp").forward(request, response);
    
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

    if (!userStore.isUserRegistered(username)) {
      request.setAttribute("error", "That username was not found.");
      request.getRequestDispatcher("/WEB-INF/view/adminlogin.jsp").forward(request, response);
      return;
    }
     if(username.equals("admin")){
      response.sendRedirect("/admin.jsp");
     }
    User user = userStore.getUser(username);

    if (!BCrypt.checkpw(password, user.getPasswordHash())) {
      request.setAttribute("error", "Please enter a correct password.");
      request.getRequestDispatcher("/WEB-INF/view/adminlogin.jsp").forward(request, response);
      return;
    }

    request.getSession().setAttribute("user", username);
    response.sendRedirect("/admin.jsp");
  }
}
