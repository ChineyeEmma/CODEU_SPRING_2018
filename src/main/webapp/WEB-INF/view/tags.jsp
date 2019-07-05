<%@ page import="java.util.List" %>
<%@ page import="codeu.model.data.Conversation" %>
<%@ page import="codeu.model.data.Message" %>
<%@ page import="codeu.model.data.User" %>
<%@ page import="codeu.model.store.basic.UserStore" %>
<%@ page import="codeu.model.store.basic.ConversationStore" %>
<%@ page import="codeu.model.store.basic.MessageStore" %>


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

  </style>

</head>

<body id="con">
	
<div id="tagList" style="background-color: #d62d20;width:49%;margin-left:25%;border-radius: 70px;color: white;">

      <ul> <!--create list-->
    <%=

    ConversationStore cs = ConversationStore.getInstance();

    MessageStore ms = MessageStore.getInstance();

    List<Conversation> convos = cs.getAllConversations();

    for (Conversation convos : convos){

    	List<Message> getMess = ms.getMessagesInConversation(convos.getId());

     	for (Message message : getMess) {

        	String currMessage = message.getContent();
    %>

    			<!--if the message contains the tag, show it-->
              <%=if(currMessage.contains("#test")) { %>

              	<li style="font-size: 15px;"><%= currMessage %></li>
             <% }
  		    }
  	     } %>

      </ul>
    </div>


</body>