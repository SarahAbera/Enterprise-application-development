package servlets;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.*;


@WebServlet("/new")
public class NewServlet extends HttpServlet {

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int id = FetchUser.fetchId(request, response);
		if (id == -1) return;

		String query = """
			INSERT INTO tasks (title, description, due_date, priority_level, user_id)
			VALUES (?,?,?,?,?);
		""";

		String title = request.getParameter("title");
		String description = request.getParameter("description");
		String due_date = request.getParameter("due_date");
		int priority_level = Integer.parseInt(request.getParameter("priority_level"));
		int user_id = id;
		
		try {
			Connection con = DBConnection.connect();
			PreparedStatement ps = con.prepareStatement(query);
			ps.setString(1, title);
			ps.setString(2, description);
			ps.setString(3, due_date);
			ps.setInt(4, priority_level);
			ps.setInt(5, user_id);

			ps.executeUpdate();
			response.sendRedirect("home.jsp");

		} catch (SQLException e) {
			e.printStackTrace();
			response.getWriter().println(e.getMessage());
		}
		
		
	}

}