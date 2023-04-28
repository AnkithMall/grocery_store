<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%@ page import="java.sql.*" %>
<%@ page import="java.util.logging.*" %>

<div id="addItem">
add item here
<form action="shopkeeper.jsp" class="productForm" method="post">
	<input type="text" name="pname" placeholder="Product Name.." required><br><br>
	<input type="number" name="price" placeholder="Product Price.."  required><br><br>
	<input type="number" name="mrp" placeholder="Product MRP.."  required><br><br>
	<span>Category : </span>
	<select name="pcat">
		<option value="dairy">Dairy</option>
		<option value="vegitable">Vegitables</option>
		<option value="beverages">Beverages</option>
		<option value="snacks">Snacks</option>
		<option value="housholds">Houshold</option>
		<option value="kitchen">Kitchen</option>
		<option value="healthy">Healthy</option>
		<option value="masala">Masala</option>
		<option value="babycare">Baby Care</option>
	</select><br><br>
	<input type="url" name="image" placeholder="Product image link.."  required><br><br>
	<input type="textarea" name="description" placeholder="Product Description.."  required><br><br>
	<input type="date" name="manufacture" placeholder="Product Manufactured Date.." required><br><br>
	<input type="date" name="expired" placeholder="Product Expired Date.." required><br><br>
	<input type="number" name="quantity" placeholder="Product Quantity.." required><br><br>
	<button type="submit" style="width:100px;height:50px;background:blue;color:white;"><i class="fa fa-plus"></i> Add</button>
</form>

<%!
class addItem{
	public static String addRow(String pname,String price,String mrp,String pcat,String image,String description,String manufacture,String expired,String quantity){
		String msg = "" ;
		
		String url = "jdbc:mysql://localhost/grocery";
        String user = "ankith";
        String password = "Medha@2020";
         
        
        try {
        	Connection con = DriverManager.getConnection(url,user,password) ;
        	String template = "insert into product(pname,price,mrp,pcat,image,description,manufacture_date,expired_date,quantity) values(?,?,?,?,?,?,?,?,?)" ;
        	PreparedStatement inserter = con.prepareStatement(template) ;
        	inserter.setString(2, pname) ;
        	inserter.setDouble(3, Double.parseDouble(price)) ;
        	inserter.setDouble(4, Double.parseDouble(mrp)) ;
        	inserter.setString(5,pcat) ;
        	inserter.setString(6,image) ;
        	inserter.setString(7,description) ;
        	inserter.setDate(8, java.sql.Date.valueOf(manufacture)) ;
        	inserter.setDate(9, java.sql.Date.valueOf(expired)) ;
        	inserter.setInt(10, Integer.parseInt(quantity));
        	
        	inserter.executeUpdate() ;
        	con.close() ;
        	
        	/*HttpSession session = request.getSession() ;
        	session.invalidate() ;*/
        	msg = "<span>New Item is Added Successfully..</span>" ;
        	//request.setAttribute("msg1","<span>New Item is Added Successfully..</span>");
			//request.getRequestDispatcher("shopkeeper.jsp").forward(request, response);
        }catch(SQLException e) {
        	
        }
		
		
		return msg ;
	}
}

%>
<%
	String	pname = request.getParameter("pname") ;
	String  price = request.getParameter("price") ;
	String mrp = request.getParameter("mrp") ;
	String  pcat = request.getParameter("pcat") ;
	String image = request.getParameter("image") ;
	String  description = request.getParameter("description");
	String manufacture = request.getParameter("manufacture") ;
 	String expired = request.getParameter("expired") ;
 	String quantity = request.getParameter("quantity");
 	
 	String msg = addItem.addRow(pname, price, mrp, pcat, image, description, manufacture, expired, quantity) ;
 	out.print(msg);
 	
	
%>

</div>

</body>
</html>