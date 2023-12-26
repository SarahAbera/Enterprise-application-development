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


@WebServlet("/finish")
public class FinishServlet extends HttpServlet {

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int id = FetchUser.fetchId(request, response);
		if (id == -1) return;

		String query = "UPDATE tasks SET is_finished=TRUE WHERE task_id=?;";
		int taskId = Integer.parseInt(request.getParameter("task_id"));

		
		try {
			Connection con = DBConnection.connect();
			PreparedStatement ps = con.prepareStatement(query);
			ps.setInt(1, taskId);

			ps.executeUpdate();
			response.sendRedirect("home.jsp");

		} catch (SQLException e) {
			e.printStackTrace();
			response.getWriter().println(e.getMessage());
		}
		
		
	}

}