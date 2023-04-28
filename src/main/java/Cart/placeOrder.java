package Cart;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.time.LocalDate;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class placeOrder
 */
@WebServlet("/placeOrder")
public class placeOrder extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public placeOrder() {
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
		response.setContentType("text/html");  
		
		PrintWriter out = response.getWriter() ;
		
		try(Connection con = DriverManager.getConnection(url,user,password) ;){
		try (Statement st = con.createStatement()) {
			//String q = "" ;
			String usrid = request.getParameter("usrid") ;
			out.println("connection and statement established "+usrid+"<br>");
			ResultSet rs = st.executeQuery("select * from product,cart where product.pid = cart.pid and usrid="+usrid);
			out.println("result set is created<br>");
			con.setAutoCommit(false);
			out.println("commit is set to false<br>");
			int i = 1 ;
			while(rs.next()){
				out.println("while loop start <br>"+i+++"<br>");
			st.executeUpdate("update product set quantity=quantity-"+rs.getInt(13) + " where pid="+rs.getInt(1));
			out.println("quantity is decreased<br>");
			PreparedStatement ins = con.prepareStatement("insert into cartorder(usrid,pid,q,tprice,odate) values(?,?,?,?,'?')");
			out.println("statement prepared<br>");
			ins.setInt(1,rs.getInt(12));
			out.println("set inserter 1<br>");
			ins.setInt(2,rs.getInt(1));
			out.println("set inserter 2<br>");
			ins.setInt(3,rs.getInt(13));
			out.println("set inserter 3<br>");
			ins.setDouble(4,rs.getDouble(3)*rs.getInt(13));
			out.println("set inserter 4<br>");
			ins.setDate(5,java.sql.Date.valueOf(LocalDate.now()));
			out.println("set inserter 5<br>");

			ins.executeUpdate() ;
			out.println("order is recorded<br>");
			
			}
			out.println("loop ends<br>");
			st.executeUpdate("delete from cart where usrid="+usrid); 
			out.println("cart is emptied<br>");
			con.commit();
			out.print("Transaction is successfull");
		} catch (SQLException ex) {

			try {

				con.rollback();
				out.print("Transaction is faild");
				
			} catch (SQLException ex1) {
				out.print("Transaction rollback is failed");
			}
		}
		con.close();

		} catch (SQLException ex) {
		    
		   out.print("error connection");
		} 
		
	}

}
