<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ page import="java.sql.*" %>
<%@ page import="java.util.logging.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<table border="1" cellpadding="5" id="products" align="center">
	<tr>
		<th>Product ID</th>
		<th>image</th>
		<th>Product Name</th>
		<th>Description</th>
		<th>Quantity</th>
		<th>Price</th>
		<th>Total Price</th>
		<th>Purchase Date</th>
	</tr>

	<% 
	String url = "jdbc:mysql://localhost/grocery";
    String user = "ankith";
    String password = "Medha@2020";
    response.setContentType("text/html");  
    try{
    	Connection con = DriverManager.getConnection(url,user,password) ;
    	//out.print("connection established");
    	String query = " select cartorder.pid,image,pname,description,q,price,q*price,odate from cartorder,product where cartorder.pid=product.pid and odate between '"+request.getParameter("d1")+"' and '"+request.getParameter("d2")+"' ;" ;
    	Statement st = con.createStatement() ;
    	//out.print("state created");
    	ResultSet rs = st.executeQuery(query) ;
    	//out.print("query executed");
    	boolean flag = rs.next();
    	double tprice = 0 ;
    	//out.print("Error err before flag");
    	if(flag){
    		while(flag){
    			out.println("<tr><td>"+rs.getInt(1)+"</td>");
    			out.println("<td><a target='_blanck' href='"+rs.getString(2)+"'><img id='pimg' src=\""+rs.getString(2)+"\"></a></td>");
    			out.println("<td>"+rs.getString(3)+"</td>");//pname
    			out.println("<td>"+rs.getString(4)+"</td>");//description
    			out.println("<td>"+rs.getInt(5)+"</td>") ;//quantity
    			out.println("<td>"+rs.getDouble(6)+"</td>");//price
    			out.println("<td>"+rs.getDouble(7)+"</td>");
    			out.println("<td>"+rs.getDate(8)+"</td>");
    			tprice += rs.getInt(7) ;
    			
    			
    			out.println("</tr>");
    			//out.print("<td>"+rs.getInt(9)+"</td></tr>");
    			flag = rs.next();
    		}
    		out.println("<tr><td colspan='5'>Total Amount Spent</td><td colspan='3'>&#8377; "+tprice+"</td></tr></table> <br>") ;
    		//out.println("<button style='margin:auto;position:relative;left:45%;width:100px;height:35;border: 1px solid #00B4CC;background: #00B4CC;text-align: center;color: #fff;border-radius: 5px;cursor: pointer;' usrid='"+request.getParameter("usrid")+"' onclick='order(this)'>Place Your Order</button>  ");
    	}else{
    		out.print("<tr><td colspan='8'>"+"No Past Purchases"+"</td></tr></table> <br>");
    		//out.print("Error err");
    	}
    	con.close() ;
    }catch(SQLException e){
    	//out.print("<tr><td colspan='7'>"+"Cart is Empty"+"</td></tr>");
    	out.print("<tr><td colspan='8'>"+"Invalid User Id"+"</td></tr></table> <br>");
    } %>


</body>
</html>