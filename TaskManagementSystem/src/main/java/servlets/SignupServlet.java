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


@WebServlet("/signup")
public class SignupServlet extends HttpServlet {

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String query = "INSERT INTO users (username, password) VALUES (?, ?);";
		String username = request.getParameter("username");
		String password = request.getParameter("password");
		try {
			Connection con = DBConnection.connect();
			
			//check if username is not taken
			PreparedStatement searchPs = con.prepareStatement("SELECT * FROM users WHERE username=?;");
			searchPs.setString(1, username);
			if (searchPs.executeQuery().next()) {
				response.sendRedirect("signup.jsp");
				return;
			}
			
			PreparedStatement ps = con.prepareStatement(query);
			ps.setString(1, username);
			ps.setString(2, password);
			ps.executeUpdate();
			response.sendRedirect("login.jsp");

		} catch (SQLException e) {
			e.printStackTrace();
			response.getWriter().println(e.getMessage());
		}
		
		
	}

}