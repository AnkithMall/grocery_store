package Cart;

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
 * Servlet implementation class removeCart
 */
@WebServlet("/removeCart")
public class removeCart extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public removeCart() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
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
	    	String query = "delete from cart where cid ="+id+";" ;
	    	Statement st = con.createStatement() ;
	    	
	    	st.executeUpdate(query) ;
	    	
	    	/*	
	    	String query1 = "select * from product,cart where product.pid = cart.pid and usrid="+request.getParameter("usrid")+";" ;
	    	st = con.createStatement() ;
	    	ResultSet rs = st.executeQuery(query1) ;
	    	boolean flag = rs.next();
	    	double tprice = 0 ;
	    	if(flag){
	    		while(flag){
	    			out.println("<tr><td>"+rs.getInt(1)+"</td>");
	    			out.println("<td><a target='_blanck' href='"+rs.getString(5)+"'><img id='pimg' src=\""+rs.getString(5)+"\"></a></td>");
	    			out.println("<td>"+rs.getString(2)+"</td>");//pname
	    			out.println("<td>"+rs.getString(6)+"</td>");//description
	    			out.println("<td>"+rs.getInt(13)+"</td>") ;//quantity
	    			out.println("<td>"+rs.getDouble(3)+"</td>");//price
	    			tprice += rs.getDouble(3)*rs.getInt(13) ;
	    			
	    			out.print("<td>"
	    					+"<button style='height:35px;width:60px;border: 1px solid #00B4CC;background: red;text-align: center;color: #fff;border-radius: 5px;cursor: pointer;' type='submit' class='rmv' data-id='"+rs.getInt(10)+"'  onclick='deleteDB(this)'>"
	    					+"<i class='fa fa-trash-o'></i>"
	    					+"</button></td>") ;
	    			
	    			out.println("</tr>");
	    			//out.print("<td>"+rs.getInt(9)+"</td></tr>");
	    			flag = rs.next();
	    		}
	    		out.println("<tr><td colspan='5'>Total Price</td><td colspan='2'>&#8377; "+tprice+"</td></tr>") ;
	    	}else{
	    		out.print("<tr><td colspan='7'>"+"Cart is Empty"+"</td></tr>");
	    	}*/
	    	con.close() ;
	    	
	    }catch(SQLException e){
	    	out.print("Error rmv");
	    }
	}

}
