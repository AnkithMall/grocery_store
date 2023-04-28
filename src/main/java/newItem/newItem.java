package newItem;

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
import javax.servlet.http.HttpSession;

/**
 * Servlet implementation class newItem
 */
@WebServlet("/newItem")
public class newItem extends HttpServlet {
    
	public newItem() {
		super();
	}
	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
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
        	String template = "insert into product(pname,price,pcat,image,description,manufacture_date,expired_date,quantity) values(?,?,?,?,?,?,?,?)" ;
        	PreparedStatement inserter = con.prepareStatement(template) ;
            msg += "set inserter," ;
        	inserter.setString(1, request.getParameter("pname")) ;
        	inserter.setDouble(2, Double.parseDouble(request.getParameter("price"))) ;
        	
        	inserter.setString(3, request.getParameter("pcat")) ;
        	inserter.setString(4, request.getParameter("image")) ;
        	inserter.setString(5, request.getParameter("description")) ;
        	inserter.setDate(6,java.sql.Date.valueOf(request.getParameter("manufacture"))) ;
        	inserter.setDate(7,java.sql.Date.valueOf(request.getParameter("expired"))) ;
        	inserter.setInt(8,Integer.parseInt(request.getParameter("quantity")));
        	msg += "query update initalize,";
        	inserter.executeUpdate() ;
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
