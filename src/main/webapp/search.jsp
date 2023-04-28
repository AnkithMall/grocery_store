<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%@ page import = "java.io.*,java.util.*,java.sql.*"%>
<%@ page import = "javax.servlet.http.*,javax.servlet.*" %>

<!-- for this to work download the jstl jar from https://tomcat.apache.org/download-taglibs.cgi -->
<!-- Also download http://www.java2s.com/Code/Jar/j/Downloadjstl12jar.htm -->
<html>
   <head>
      <title>SELECT Operation</title>
   </head>

   <body>
   <table border="1" cellpadding="5" id="products" align="center">
	<tr>
		<th>Product ID</th>
		<th>image</th>
		<th>Product Name</th>
		<th>Price</th>
		<th>Description</th>
		<th>Manufactured Date</th>
		<th>Expired Date</th>
		<th>Add To Cart</th>
	</tr>
   <% 
	String url = "jdbc:mysql://localhost/grocery";
    String user = "ankith";
    String password = "Medha@2020";
    response.setContentType("text/html");  
    try{
    	Connection con = DriverManager.getConnection(url,user,password) ;
    	//out.println("sql is connected");
    	String query = "select * from product where pname LIKE '%"+request.getParameter("keytext")+"%' ;" ;
    	Statement st = con.createStatement() ;
    	ResultSet rs = st.executeQuery(query) ;
    	boolean flag = rs.next();
    	if(flag){
    		while(flag){
    			out.print("<tr><td>"+rs.getInt(1)+"</td>");
    			out.print("<td><a target='_blanck' href='"+rs.getString(5)+"'><img id='pimg' src=\""+rs.getString(5)+"\"></a></td>");
    			out.print("<td>"+rs.getString(2)+"</td>");
    			out.print("<td>"+rs.getDouble(3)+"</td>");
    			out.print("<td>"+rs.getString(6)+"</td>");
    			out.print("<td>"+rs.getDate(7)+"</td>");
    			out.print("<td>"+rs.getDate(8)+"</td>");
    			
    			out.print("<td ><form method='post' action='addCart'>"
    				+"<input type='hidden' name='usrid' value='"+request.getParameter("id")+"'/>"
    				+"<input type='hidden' name='pid' value='"+rs.getInt(1)+"'/>"
    				+"<div style='display:flex;flex-flow:row nowrap;'><input type='number' name='quantity'  style='width:40px;float:left;'  required/>"
    				+"<button style='float:right;height:35px;width:60px;border: 1px solid #00B4CC;background: #00B4CC;text-align: center;color: #fff;border-radius: 0 5px 5px 0;cursor: pointer;' type='submit'><i class='fa fa-plus'></i></button></div>"
    			+"</form></td>") ;
    			
    			out.print("</tr>");
    			//out.print("<td>"+rs.getInt(9)+"</td></tr>");
    			flag = rs.next();
    		}
    	}else{
    		out.print("<tr><td colspan='8'>"+"No Product is Available"+"</td></tr>");
    	}
    	con.close() ;
    }catch(SQLException e){
    	out.print("Error");
    } %>
    </table>
   </body>
</html>