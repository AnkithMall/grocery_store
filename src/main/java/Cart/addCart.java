package Cart;

import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class addCart
 */
@WebServlet("/addCart")
public class addCart extends HttpServlet {
	
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
        	String template = "insert into cart(pid,usrid,q) values(?,?,?)" ;
        	PreparedStatement inserter = con.prepareStatement(template) ;
            msg += "set inserter," ;
            inserter.setInt(1,Integer.parseInt(request.getParameter("pid")));
            inserter.setInt(2,Integer.parseInt(request.getParameter("usrid")));
        	inserter.setInt(3,Integer.parseInt(request.getParameter("quantity")));
        	msg += "query update initalize,";
        	inserter.executeUpdate() ;
        	msg += "update success,";
        	con.close() ;
        	msg = "New Item is Added to Cart.." ;
        	
        	response.sendRedirect("customer.jsp"); 
        	//request.setAttribute("msg1",msg);
			//request.getRequestDispatcher("customer.jsp").include(request, response);
        }catch(SQLException e) {
        	msg = "New Item failed to add.." ;
        	request.setAttribute("msg1","<span>"+msg+"</span>");
			request.getRequestDispatcher("customer.jsp").include(request, response);
        }
	}

}
