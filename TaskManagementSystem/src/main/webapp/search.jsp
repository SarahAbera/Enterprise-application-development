<%@ page import="servlets.DBConnection" %>
<%@ page import="servlets.FetchUser" %>
<%@ page import="java.sql.*" %>

<html>
  <head>
    <link rel="stylesheet" href="style.css" />
    <title>Search</title>
  </head>
  <body>
    <main>
	<%@ include file="inside-nav.jsp" %>
      <h1>Search</h1>
      <div class="modal-container vh-0">
        <div>
          <h2>Search</h2>
          <form class="flex">
            <input type="text" name="title" />
            <button>Title</button>
          </form>

          <p>or</p>

          <form class="flex">
            <input type="date" name="due_date" />
            <button>Due Date</button>
          </form>
        </div>
      </div>

      <% 
      	int id = FetchUser.fetchId(request, response);
      	if (id == -1)return;
      	
      	String searchTitle = request.getParameter("title");
      	String searchDueDate = request.getParameter("due_date");
      	
      	Connection con = DBConnection.connect();
		PreparedStatement ps;

      	

      	if (searchTitle != null && searchTitle!=""){
      		String query = "SELECT * FROM tasks WHERE user_id=? AND title LIKE ?";
			ps = con.prepareStatement(query);
			ps.setInt(1, id);
			ps.setString(2, "%"+searchTitle+"%");

      	}else if (searchDueDate != null && searchDueDate!=""){
      		String query = "SELECT * FROM tasks WHERE user_id=? AND due_date=?;";
			ps = con.prepareStatement(query);
			ps.setInt(1, id);
			ps.setString(2, searchDueDate);
      	}else{
			String query = "SELECT * FROM tasks WHERE user_id=?;";
			ps = con.prepareStatement(query);
			ps.setInt(1, id);
      	}
      	
      	ResultSet rs =  ps.executeQuery();
      	request.setAttribute("tasks", rs);

      %>

      <%@ include file="task-list-component.jsp" %>

    </main>
  </body>
</html>
