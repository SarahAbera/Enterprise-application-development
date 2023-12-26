<%@ page import="servlets.DBConnection" %>
<%@ page import="servlets.FetchUser" %>
<%@ page import="java.sql.*" %>

<html>
  <head>
    <link rel="stylesheet" href="style.css" />
    <title>Profile</title>
  </head>
  <body>
    <main>

	  <%@ include file="inside-nav.jsp" %>
          <h1>Profile</h1>
      <div class="modal-container">
      
      <% 
      	int id = FetchUser.fetchId(request, response);
      	if (id == -1)return;
      	
      	Connection con = DBConnection.connect();
      	String query = "SELECT username, password FROM users WHERE user_id=?;";
		PreparedStatement ps = con.prepareStatement(query);
		ps.setInt(1, id);

      	ResultSet taskRs =  ps.executeQuery();
      	taskRs.next();

		String username = taskRs.getString(1);
		String password = taskRs.getString(2);

      %>
        <form class="spaced" action="profile" method="POST">
          <label>
            Username <br />
            <input type="text" name="username" value="<%= username %>" />
          </label>

          <label>
            Password <br />
            <input type="password" name="password" value="<%= password %>"/>
          </label>

          <div>
            <button>Save</button>
          </div>
        </form>
      </div>
    </main>
  </body>
</html>
