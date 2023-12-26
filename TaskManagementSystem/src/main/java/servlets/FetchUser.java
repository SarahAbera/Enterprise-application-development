package servlets;

import java.io.IOException;
import java.sql.*;

import jakarta.servlet.ServletException;
import jakarta.servlet.http.*;

public class FetchUser {
	public static int fetchId (HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException  {
		String query = "SELECT user_id FROM users WHERE user_id=?";
		Object id = req.getSession().getAttribute("uid");
		try {
			if (id == null) {
				res.sendRedirect("login.jsp");
				return -1;
			}
			
			Connection con = DBConnection.connect();
			PreparedStatement ps = con.prepareStatement(query);
			ps.setInt(1, (int)id);
			ResultSet rs = ps.executeQuery();
			
			if (!rs.next()) {
				res.sendRedirect("login.jsp");
				return -1;
			}
			
			return (int) id;

		} catch (SQLException e) {
			e.printStackTrace();
			res.getWriter().println(e.getMessage());
		}
		return -1;
	}
			
}
