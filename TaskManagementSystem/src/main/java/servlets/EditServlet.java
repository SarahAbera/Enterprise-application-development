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


@WebServlet("/edit")
public class EditServlet extends HttpServlet {

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int id = FetchUser.fetchId(request, response);
		if (id == -1) return;

		String query = "UPDATE tasks SET title=?, description=?, due_date=?, priority_level=? WHERE task_id=?;";
		
		String title = request.getParameter("title");
		String description = request.getParameter("description");
		String dueDate = request.getParameter("due_date");
		int priorityLevel = Integer.parseInt(request.getParameter("priority_level"));
		int taskId = Integer.parseInt(request.getParameter("task_id"));

		
		try {
			Connection con = DBConnection.connect();
			PreparedStatement ps = con.prepareStatement(query);
			ps.setString(1, title);
			ps.setString(2, description);
			ps.setString(3, dueDate);
			ps.setInt(4, priorityLevel);
			ps.setInt(5, taskId);

			ps.executeUpdate();
			response.sendRedirect("home.jsp");

		} catch (SQLException e) {
			e.printStackTrace();
			response.getWriter().println(e.getMessage());
		}
		
		
	}

}