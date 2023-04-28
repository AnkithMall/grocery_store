package edit.delete;

import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class edit
 */
@WebServlet("/edit")
public class edit extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public edit() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		String url = "jdbc:mysql://localhost/grocery";
        String user = "ankith";
        String password = "Medha@2020";
        String msg = "" ;
        try {
        	Class.forName("com.mysql.jdbc.Driver");
        	} catch (ClassNotFoundException e) {
        	e.printStackTrace();
        }
        
        try {
        	msg= "connection is yet to be established ";
        	//DriverManager.registerDriver(new com.mysql.cj.jdbc.Driver ());	
        	Connection con = DriverManager.getConnection(url,user,password) ;
        	msg =msg+ "connection established," ;
        	String query = "update product set quantity = quantity+"+request.getParameter("quantity")+" where pid ="+request.getParameter("pid") +";";
        	Statement st = con.createStatement() ;
        	st.executeUpdate(query);
        	msg += "query update initalize,";
        	
        	msg += "update success,";
        	con.close() ;
        	msg = "New Item is Added Successfully.." ;
        	
        	response.sendRedirect("shopkeeper.jsp");
        	//request.setAttribute("msg1",msg);
			//request.getRequestDispatcher("shopkeeper.jsp").forward(request, response);
        }catch(SQLException e) {
        	msg = "New Item failed to add.." ;
        	request.setAttribute("msg1","<span>"+msg+"</span>");
			request.getRequestDispatcher("shopkeeper.jsp").forward(request, response);
        }
	}

}
