<%@ page import="servlets.DBConnection" %>
<%@ page import="servlets.FetchUser" %>
<%@ page import="java.sql.*" %>

<ul>
<%

	ResultSet taskRs = (ResultSet) request.getAttribute("tasks");
	boolean isEmpty = true;
	while (taskRs.next()){
		isEmpty = false;
		int taskId = taskRs.getInt(1);
		String title = taskRs.getString(2);
		String description = taskRs.getString(3);
		boolean isFinished = taskRs.getBoolean(4);
		String dueDate = taskRs.getString(5);
		int priorityLevel = taskRs.getInt(6);
	%>
	<li class="task">
	  <i><%= isFinished?"Finished":"Not Finished" %></i>
	  <h3><%= title %></h3>
	  <p><%= description %></p>
	  <p>Due Date: <%= dueDate %></p>
	  <p>Priority: <%= priorityLevel %></p>
	  <div>
	  	<% if(!isFinished){
	  		%> <a href="<%= "finish?task_id="+taskId %>">Finish</a> <%
	  	} %>
		<a href="<%= "edit.jsp?task_id="+taskId %>">Edit</a>
		<a href="<%= "delete?task_id="+taskId %>">Delete</a>
	  </div>
	</li>
	<%
	}
%>


</ul>

<% if (isEmpty) {%>
	<p class="white">  No Tasks ...</p>
<% } %>