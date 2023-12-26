<%@ page import="servlets.DBConnection" %>
<%@ page import="servlets.FetchUser" %>
<%@ page import="java.sql.*" %>


<html>
  <head>
    <link rel="stylesheet" href="style.css" />
    <title>Home</title>
  </head>
  <body>
    <main>

	<%@ include file="inside-nav.jsp" %>
      <h1>Tasks</h1>
      <% 
      	int id = FetchUser.fetchId(request, response);
      	if (id == -1)return;
      	
      	Connection con = DBConnection.connect();
      	String query = "SELECT * FROM tasks WHERE user_id=?;";
		PreparedStatement ps = con.prepareStatement(query);
		ps.setInt(1, id);

      	ResultSet rs =  ps.executeQuery();
      	request.setAttribute("tasks", rs);

      %>
      <%@ include file="task-list-component.jsp" %>
      
      <a href="new.jsp"><button>Create New Task</button></a>
    </main>
  </body>
</html>
