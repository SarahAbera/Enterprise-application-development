<%@ page import="servlets.DBConnection" %>
<%@ page import="servlets.FetchUser" %>
<%@ page import="java.sql.*" %>

<html>
  <head>
    <link rel="stylesheet" href="style.css" />
    <title>Edit Task</title>
  </head>
  <body>
    <main>
	<%@ include file="inside-nav.jsp" %>
      <h1>Edit Task</h1>
      <div class="modal-container">
      
      <% 
      	int id = FetchUser.fetchId(request, response);
      	if (id == -1)return;
		int taskId = Integer.parseInt(request.getParameter("task_id"));
      	
      	Connection con = DBConnection.connect();
      	String query = "SELECT * FROM tasks WHERE task_id=?;";
		PreparedStatement ps = con.prepareStatement(query);
		ps.setInt(1, taskId);

      	ResultSet taskRs =  ps.executeQuery();
      	taskRs.next();

		String title = taskRs.getString(2);
		String description = taskRs.getString(3);
		boolean isFinished = taskRs.getBoolean(4);
		String dueDate = taskRs.getString(5);
		int priorityLevel = taskRs.getInt(6);
      	

      %>
      
        <form class="spaced" action="edit">
        	<input type="number" hidden name="task_id" value="<%=taskId %>"/>

          <label>
            Title <br />
            <input type="text" name="title" value="<%=title %>" />
          </label>

          <label>
            Description <br />
            <textarea name="description" rows="5" cols="45" >
 <%= description %></textarea
            >
          </label>

          <label>
            Due Date <br />
            <input type="date" name="due_date" value="<%= dueDate %>" />
          </label>

          <label
            >Priority Level
            <br />
            <input type="number" name="priority_level" value="<%=priorityLevel %>" />
          </label>
          <div>
            <button>Save</button>
          </div>
        </form>
      </div>
    </main>
  </body>
</html>
