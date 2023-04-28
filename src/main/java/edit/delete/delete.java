package edit.delete;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class delete
 */
@WebServlet("/delete")
public class delete extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public delete() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String url2 = "jdbc:mysql://localhost/grocery";
	    String user2 = "ankith";
	    String password2 = "Medha@2020";
	    
	    try {
        	Class.forName("com.mysql.jdbc.Driver");
        	} catch (ClassNotFoundException e) {
        	e.printStackTrace();
        }
	    
	    PrintWriter out = response.getWriter();;
		try{
			String id = request.getParameter("id") ;
			//DriverManager.registerDriver(new com.mysql.cj.jdbc.Driver ());
	    	Connection con = DriverManager.getConnection(url2,user2,password2) ;
	    	String query = "delete from product where pid ="+id+";" ;
	    	Statement st = con.createStatement() ;
	    	try{
	    		st.executeUpdate(query) ;
	    		response.sendRedirect("shopkeeper.jsp");
	    		//request.setAttribute("ms", "Delete Successfull..") ;
	    		//request.getRequestDispatcher("shopkeeper.jsp").include(request, response);  
	    	}catch(Exception ex) {
	    		request.setAttribute("ms", "Delete failed..") ;
	    		request.getRequestDispatcher("shopkeeper.jsp").include(request, response);  
	    	}
	    	
	    	
	    	
	    	con.close() ;
	    }catch(SQLException e){
	    	out.print("Error");
	    }
	}

}
