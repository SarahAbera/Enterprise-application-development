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


@WebServlet("/login")
public class LoginServlet extends HttpServlet {

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String query = "SELECT user_id FROM users WHERE username=? AND password=?;";
		String username = request.getParameter("username");
		String password = request.getParameter("password");
		try {
			Connection con = DBConnection.connect();
			PreparedStatement ps = con.prepareStatement(query);
			ps.setString(1, username);
			ps.setString(2, password);
			ResultSet rs = ps.executeQuery();
			if (!rs.next()) {

				response.sendRedirect("login.jsp");
			}else {
				int id = rs.getInt(1);
				request.getSession().setAttribute("uid", id);
				response.sendRedirect("home.jsp");
			}

		} catch (SQLException e) {
			e.printStackTrace();
			response.getWriter().println(e.getMessage());
		}
		
		
	}

}
