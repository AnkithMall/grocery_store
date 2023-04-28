package login.register;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.Driver;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.logging.Level;
import java.util.logging.Logger;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletConfig;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


/**
 * Servlet implementation class register
 */
@WebServlet("/reg")
public class register extends HttpServlet {
	

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		String url = "jdbc:mysql://localhost/grocery";
        String user = "ankith";
        String password = "Medha@2020";
       
        PrintWriter out = response.getWriter();
	
		
		try{
			DriverManager.registerDriver(new com.mysql.cj.jdbc.Driver ());
			Connection con = DriverManager.getConnection(url, user, password);
			String email = request.getParameter("email");
			String query = "select * from user where email =\'"+email+"\';" ;
			Statement st = con.createStatement();
			ResultSet rs = st.executeQuery(query) ;
			
			if(!(rs.next())) {
				String template = "insert into user(uname,password,email) values(?,?,?)" ;
				PreparedStatement inserter = con.prepareStatement(template) ;
				inserter.setString(1,request.getParameter("username"));
				inserter.setString(2,request.getParameter("password"));
				inserter.setString(3,request.getParameter("email"));
				inserter.executeUpdate();
				
				 //response.setContentType("text/jsp");  
				//RequestDispatcher redis = request.getRequestDispatcher("/index.jsp") ;
		        //redis.include(request,response);
				request.setAttribute("msg","<span>successfully registered</span>");
				request.getRequestDispatcher("index.jsp").forward(request, response);
				//out.println("<span bgcolor=\"red\">user registered successfully..</span>");
			}else {
				 //response.setContentType("text/jsp");  
				 request.setAttribute("msg","<span>use another email</span>");
				//RequestDispatcher redis = request.getRequestDispatcher("/index.jsp") ;
		        //redis.include(request,response);
		        request.getRequestDispatcher("index.jsp").forward(request, response);
				//out.println("<span bgcolor=\"red\">use another email</span>");
				
			}
			con.close() ;
		}catch(SQLException e) {
			 Logger lgr = Logger.getLogger(register.class.getName());
	            lgr.log(Level.SEVERE, e.getMessage(), e);
	            response.setContentType("text/jsp");  
	            RequestDispatcher redis = request.getRequestDispatcher("/index.jsp") ;
	            redis.include(request,response);
			out.println("<span bgcolor=\"red\">db access failed</span>") ;
			
		}
		
	}

}
