<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ page import="java.sql.*" %>
<%@ page import="java.util.logging.*" %>
<%@ page import="java.time.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%

String url = "jdbc:mysql://localhost/grocery";
String user = "ankith";
String password = "Medha@2020";
response.setContentType("text/html");  



try(Connection con = DriverManager.getConnection(url,user,password) ;){
try (Statement st = con.createStatement()) {
	String usrid = request.getParameter("usrid") ;
	Statement st1 = con.createStatement() ;
	ResultSet rs = st1.executeQuery("select * from product,cart where product.pid = cart.pid and usrid="+usrid);
	con.setAutoCommit(false);
	int i = 1 ;
	int pid , uid,q,pr;
	double tp ;
	LocalDate od ;
	while(rs.next()){
		pid =rs.getInt(1) ;
		pr=rs.getInt(3);
		uid = rs.getInt(12);
		q = rs.getInt(13) ;
		tp=pr*q;
		
		st.executeUpdate("update product set quantity=quantity-"+q + " where pid="+pid);
		PreparedStatement inserter = con.prepareStatement("insert into cartorder(usrid,pid,q,tprice,odate) values(?,?,?,?,?)");
		inserter.setInt(1,uid);
		inserter.setInt(2,pid);
		inserter.setInt(3,q);
		inserter.setDouble(4,tp);
		inserter.setDate(5,java.sql.Date.valueOf(LocalDate.now()));
		inserter.executeUpdate() ;
	}
		st.executeUpdate("delete from cart where usrid="+usrid); 
		con.commit();
		out.print("Purchase Complete");
	} catch (SQLException ex) {

	try {

		con.rollback();
		out.print("Pusrchase faild");
		out.print(ex.toString());
	} catch (SQLException ex1) {
		out.print("Transaction rollback is failed");
	}
}
con.close();

} catch (SQLException ex) {
    
   out.print("error connection");
} 

%>
</body>
</html>