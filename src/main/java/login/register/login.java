package login.register;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.logging.Level;
import java.util.logging.Logger;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletConfig;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 * Servlet implementation class login
 */
@WebServlet("/Login")
public class login extends HttpServlet {
       
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		String url = "jdbc:mysql://localhost/grocery";
        String user = "ankith";
        String password = "Medha@2020";
        response.setContentType("text/jsp");  
        
        
        
        try {
        	DriverManager.registerDriver(new com.mysql.cj.jdbc.Driver ());
			Connection con = DriverManager.getConnection(url, user, password);
			PrintWriter out = response.getWriter();
			out.println("<html><body><p style=\"color:red;\">1</p></body></html>");
			if(request.getParameter("cat").equals("user")) {
				out.println("2");
				String uname = request.getParameter("username");
				String pass = request.getParameter("password") ;
				String query = "select * from user where uname =\'"+uname+"\';" ;
				
				Statement st = con.createStatement() ;
				ResultSet rs = st.executeQuery(query) ;
				if(rs.next()) {
				if(pass.equals(rs.getString(3))) {
					
					//out.println("3");
					//request.setAttribute("msg","<span>Log in succesfull</span>");
					//request.getRequestDispatcher("customer.jsp").forward(request, response);
					//RequestDispatcher redis = request.getRequestDispatcher("/customer.jsp") ;
			        //redis.include(request,response);
			        
			        //RequestDispatcher dispatcher = getServletContext().getRequestDispatcher("/customer.jsp");
		            //dispatcher.forward(request, response);
					
					HttpSession session = request.getSession() ;
					synchronized(session) {
						session.setAttribute("name", uname);
						session.setAttribute("email", rs.getString(4));
						session.setAttribute("id",rs.getInt(1));
						session.setAttribute("password", rs.getString(3));
					}
					response.sendRedirect("customer.jsp");
				}
				else {
					request.setAttribute("msg","<span>Credentials Mismatched</span>");
					request.getRequestDispatcher("index.jsp").forward(request, response);
					
					//RequestDispatcher dispatcher = getServletContext().getRequestDispatcher("/index.jsp");
		            //dispatcher.forward(request, response);
				}
				}
				else {
					request.setAttribute("msg","<span>Username is not registered</span>");
					request.getRequestDispatcher("index.jsp").forward(request, response);
					
					//RequestDispatcher dispatcher = getServletContext().getRequestDispatcher("/index.jsp");
		            //dispatcher.forward(request, response);
				}
			}
			else if(request.getParameter("cat").equals("admin")) {
				String uname = request.getParameter("username");
				String pass = request.getParameter("password") ;
				String query = "select * from admin where aname =\'"+uname+"\';" ;
				
				Statement st = con.createStatement() ;
				ResultSet rs = st.executeQuery(query) ;
				if(rs.next()) {
				if(pass.equals(rs.getString(3))) {
					
					
					HttpSession session = request.getSession() ;
					synchronized(session) {
					session.setAttribute("name", rs.getString(2));
					session.setAttribute("id",rs.getInt(1));
					session.setAttribute("password", rs.getString(3));
					}
					//request.setAttribute("msg","<span>Log in succesfull</span>");
					//request.getRequestDispatcher("shopkeeper.jsp").forward(request, response);
					response.sendRedirect("shopkeeper.jsp");
					//RequestDispatcher dispatcher = getServletContext().getRequestDispatcher("/shopkeeper.jsp");
		            //dispatcher.forward(request, response);
					
					
				}
				else {
					request.setAttribute("msg","<span>Credentials Mismatched</span>");
					request.getRequestDispatcher("index.jsp").forward(request, response);
					
					//RequestDispatcher dispatcher = getServletContext().getRequestDispatcher("/index.jsp");
		            //dispatcher.forward(request, response);
				}
				}else {
					request.setAttribute("msg","<span>Username is not registered</span>");
					request.getRequestDispatcher("index.jsp").forward(request, response);
					
					//RequestDispatcher dispatcher = getServletContext().getRequestDispatcher("/index.jsp");
		            //dispatcher.forward(request, response);
				}
			}
        	con.close() ;
        }catch(SQLException exc) {
        	 Logger lgr = Logger.getLogger(login.class.getName());
	            lgr.log(Level.SEVERE, exc.getMessage(), exc);
        }
	}

}
