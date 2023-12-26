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


@WebServlet("/profile")
public class ProfileServlet extends HttpServlet {

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int id = FetchUser.fetchId(request, response);
		if (id == -1) return;

		String query = "UPDATE users SET username=?, password=? WHERE user_id=?;";
		
		String username = request.getParameter("username");
		String password = request.getParameter("password");

		try {
			Connection con = DBConnection.connect();
			//check if username not taken
			PreparedStatement searchPs = con.prepareStatement("SELECT * FROM users WHERE username=?;");
			searchPs.setString(1, username);
			if (searchPs.executeQuery().next()) {
				response.sendRedirect("profile.jsp");
				return;
			}


			PreparedStatement ps = con.prepareStatement(query);
			ps.setString(1, username);
			ps.setString(2, password);
			ps.setInt(3, id);
			ps.executeUpdate();
			response.sendRedirect("home.jsp");

		} catch (SQLException e) {
			e.printStackTrace();
			response.getWriter().println(e.getMessage());
		}
		
		
	}

}