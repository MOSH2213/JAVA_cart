package cn.techtutorial.servlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import cn.techtutorial.connection.DbCon;
import cn.techtutorial.dao.AdminDao;
import cn.techtutorial.dao.UserDao;
import cn.techtutorial.model.Admin;
import cn.techtutorial.model.User;


@WebServlet("/user-login")
public class LoginServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.sendRedirect("login.jsp");
	}

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setContentType("text/html;charset=UTF8");
		try(PrintWriter out = response.getWriter()){
			String email=request.getParameter("login-email");
			String password=request.getParameter("login-password");
//			out.print(email+password);
			
			try {
				//for user based login credentials
				UserDao udao = new UserDao(DbCon.getConnection());
				User user = udao.userLogin(email,password);
				if(user !=null) {
					out.print("user gmmc thma");
					request.getSession().setAttribute("auth", user);
					response.sendRedirect("index.jsp");
				}
				//for admin based lodin credentials
				AdminDao adao = new AdminDao(DbCon.getConnection());
				Admin admin = adao.adminLogin(email,password);
				if(admin !=null) {
					out.print("user gmmc thma");
					request.getSession().setAttribute("authadmin", admin);
					response.sendRedirect("admin.jsp");
				}
				else {
					out.print("plyn ynda");
				}
			}
			catch (ClassNotFoundException e) {
				e.printStackTrace();
			}
			
		}  
		catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}

}
