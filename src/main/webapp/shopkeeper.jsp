<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Admin Page</title>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<link rel="stylesheet" href="shopkeeper.css" >
<style type="text/css">

body {
margin: 0;
font-family:'Times New Roman', Times, serif ;
	background-image: url(background-image.jpg); 
    //background-position: center;
     background-attachment: fixed;
    background-repeat: no-repeat;
    background-size: cover;
    height:1000px;
}
.content {
	position:relative ;
	top:25px ;

}
header {
	background-color:#0b007e ;
	text-align:center;
	padding: 6px;
  	border: none;
  	margin: auto;
  	font-size: 40px;
  	color:white ;	
}

ul.nav {
  list-style-type: none;
  margin: 0;
  padding: 0;
  overflow: hidden;
  background-color: #333;
  transition: .5s ;
  width:100%;
  position:relative;
  top:-1px;
}

ul.nav li {
	float: left;
}

ul.nav li a {
  display: block;
  color: white;
  text-align: center;
  padding: 14px 16px;
  text-decoration: none;
}

/*ul.nav li a:hover  {
	background-color: #111;
}*/

ul.nav li a.active {
	background-color: #04AA6D;
}

a {
	cursor:pointer;
}
.search input[type=text] {
  
  float: right;
  
  padding: 6px;
  border: none;
  margin-top: 8px;
  margin-right: 16px;
  font-size: 17px;
}

@media screen and (max-width: 600px) {
  ul.nav li , .search input[type=text] {
  	float: none;
  }
   .search input[type=text] {
    border: 1px solid #ccc;  
  }
}

.Home {
	position:relative ;
	top:15px ;
	background-color:white ;
}

.add {
	width:400px;
	height:500px;
	position:relative;
	left: 50%;
    top:40px;
    transform: translate(-50%, 0);
    position: relative;
 
	padding:10px;
	border:2px solid black;
	background-color:white ;
}
.add button[type=submit] {
	width:100px;
	height:40px;
	border-radius:15px;
	background:blue;
	color:white;
}
.add button:hover {
	background:#3672e0;
}
#pimg {
	width:70px;
	height:70px;
}
#customers {
	align="center" ;
}
.profileimg {
	border:2px solid blue;
		border-radius:50% ;
		object-fit: cover;
		cursor:pointer ;
		position:relative;
		top:5px;
		left:5px;
}
div.pro {
	cursor:pointer;
	
}
div.profile{
	width:200px;
	height:400px;
	position:relative;
	left: 50%;
    top:40px;
    transform: translate(-50%, 0);
    position: relative;
 
	padding:10px;
	border:2px solid black;
}
div.profile {
	position : relative ;
	/*left:50% ;
	top:20% ;
	transform: translate(-50%, -20%);*/
	padding-left:5%;
	padding-top:50px
	
}
tr,th,td {
	text-align:center ;
}

#Home ,#history{
position:relative ;
	top:25px ;
	margin:auto;
	width:80% ;
	padding:50px;
	border:2px solid black ;
	height:64%;
	overflow:scroll ;

}
#ruser{
	position:relative ;
	top:25px ;
	margin:auto;
	width:27% ;
	padding-bottom:20px;
	border:2px solid black ;
	height:50% ;
	overflow:scroll ;
}
#imgtext{
	display: block;
  color: white;
  text-align: center;
  padding: 14px 16px;
  text-decoration: none;
}
div.pro:hover{
	background-color:#111 ;
}
.productForm{
	padding-left:70px; 
	padding-top:20px;	
}
.link{
	padding:10px ;
	float:right;
}
.link button{
	width:100px;
	height:35px;
	background-color:#3672e0 ;
	border-radius:10px ;
}
.edit{
	width:100px;
	height:30px;
	background-color:#3672e0 ;
	border-radius:10px ;
	
}
.deleteId {
	width:100px;
	height:30px;
	background-color:#3672e0 ;
	border-radius:10px ;
}
#deleteId{
	position:relative ;
	top:25px ;
	margin:auto;
	width:25% ;
	
	border:2px solid black ;
	padding-left:50px; 
	padding-top:50px;
	padding-bottom:50px ;
}
#editForm {
	position:relative ;
	top:25px ;
	margin:auto;
	width:25% ;
	
	border:2px solid black ;
	padding-left:130px; 
	padding-top:50px;
	padding-bottom:50px ;
	
		
}
footer{
	 position: absolute;
  		left: 0%;
  		top:980px ;
  		width: 100%;
		background-color:#0b007e ;
		text-align:left;
		padding: 6px;
  		border: none;
  		margin: auto;
  		font-size: 20px;
  		color:white ;	

}


		

#mail:visited{
	color:yellow ;
}
#mail{
	color:white ;
}
.logo{
	color:#663399;
	font-size:25px;
	font-family:verdana;
	text-align:left;
	margin-top:0px;
	float:left;
	margin:0px;
	line-height:50px;
	padding-left:9px;
	position:relative;
	top:15px;
	left:10px;
}

::-webkit-scrollbar {
  width: 20px;
}

/* Track */
::-webkit-scrollbar-track {
  box-shadow: inset 0 0 5px grey;
  border-radius: 10px;
}

/* Handle */
::-webkit-scrollbar-thumb {
  background: red;
  border-radius: 10px;
}

</style>

<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<script type="text/javascript">
$("document").ready(function(){
		
		
		$("#Home").css("background-color","white");	
		$("#addItem").css("background-color","white");	
		$("#history").css("background-color","white");	
		$("#ruser").css("background-color","white");	
		$("div.profile").css("background-color","white");
		
		
		$("#home").css("background-color","#333") ;
		$("#add").css("background","#333");
		$("#his").css("background","#333");
		$("#users").css("background","#333");
		$(".profile").hide();
		/*$("a").hover(function(){
			$(this).css("background-color","#111") ;
		},function(){
			$(this).css("background-color","#333") ;
		});*/
		$("#Home").hide();	
		$("#addItem").hide();	
		$("#history").hide();	
		$("#ruser").hide();	
		$("div.profile").show();
		$("#editForm").hide() ;
		$("#deleteId").hide() ;
		
		$("#ruid").hide();
		$("#rd").hide();
		$("#rd2").hide();
		
		$("#home").click(function(){
			$("#Home").show();	
			$("#addItem").hide();	
			$("#history").hide();	
			$("#ruser").hide();	
			$("div.profile").hide();
			$("#editForm").hide() ;
			$("#deleteId").hide() ;
			
			$("#home").css("background-color","#04AA6D") ;
			$("#add").css("background","#333");
			$("#his").css("background","#333");
			$("#users").css("background","#333");
			
			$(".pro").css("background","#333");
		});
		$("#add").click(function(){
				$("#Home").hide();	
				$("#addItem").show();	
				$("#history").hide();	
				$("#ruser").hide();	
				$("div.profile").hide();
				$("#editForm").hide() ;
				$("#deleteId").hide() ;
				
				$("#home").css("background-color","#333") ;
				$("#add").css("background","#04AA6D");
				$("#his").css("background","#333");
				$("#users").css("background","#333");
				
				$(".pro").css("background","#333");
		});
		$("#his").click(function(){
				$("#Home").hide();	
				$("#addItem").hide();	
				$("#history").show();	
				$("#ruser").hide();	
				$("div.profile").hide();
				$("#editForm").hide() ;
				$("#deleteId").hide() ;
				
				$("#home").css("background-color","#333") ;
				$("#add").css("background","#333");
				$("#his").css("background","#04AA6D");
				$("#users").css("background","#333");
				
				$(".pro").css("background","#333");
		});
		$("#users").click(function(){
				$("#Home").hide();	
				$("#addItem").hide();	
				$("#history").hide();	
				$("#ruser").show();	
				$("div.profile").hide();
				$("#editForm").hide() ;
				$("#deleteId").hide() ;
				
				$("#home").css("background-color","#333") ;
				$("#add").css("background","#333");
				$("#his").css("background","#333");
				$("#users").css("background","#04AA6D");
				
				$(".pro").css("background","#333");
		});
		$(".pro").click(function(){
			$("#Home").hide();	
			$("#addItem").hide();	
			$("#history").hide();	
			$("#ruser").hide();	
			$("#editForm").hide() ;
			$("#deleteId").hide() ;
			
			$("div.profile").show();
			
			$("#home").css("background-color","#333") ;
			$("#add").css("background","#333");
			$("#his").css("background","#333");
			$("#users").css("background","#333");
			
			$(".pro").css("background","#04AA6D");
			
		});
		
		$("#edit").click(function(){
			$("#home").css("background-color","#333") ;
			$("#Home").hide() ;
			$("#editForm").show() ;
			$("#editForm").css({"background":"white"}) ;
		});
		$("#delete").click(function(){
			$("#home").css("background-color","#333") ;
			$("#Home").hide() ;
			$("#deleteId").show() ;
			$("#deleteId").css({"background":"white"}) ;
		});
		$("#uid").click(function(){
			$("#rd").hide();
			$("#rd2").hide();
			$("#ruid").show();
		});
		$("#d").click(function(){
			$("#rd").show();
			$("#rd2").hide();
			$("#ruid").hide();
		});
		$("#d2").click(function(){
			$("#rd").hide();
			$("#rd2").show();
			$("#ruid").hide();
		});
});
</script>
<script type="text/javascript">
function loadId(obj){
		var id =  $(obj)[0].value ;
		const xhttp = new XMLHttpRequest();
	  	console.log(id);
	  	xhttp.onload  = function() {
	  		//if (xhttp.readyState == 4 && xhttp.status == 200) {
	  	    document.getElementById("cnt").innerHTML = xhttp.responseText;  	    
	  		//}
	  	};
	  	xhttp.open("POST", "myorders.jsp?usrid="+id);
	  	xhttp.setRequestHeader("Content-type", "application/x-www-form-urlencoded");
	  	xhttp.send("usrid="+id);
		
	
}
function loadD(obj){
	var d =  $(obj)[0].value ;
	const xhttp = new XMLHttpRequest();
  	console.log(d);
  	xhttp.onload  = function() {
  		//if (xhttp.readyState == 4 && xhttp.status == 200) {
  	    document.getElementById("cnt").innerHTML = xhttp.responseText;  	    
  		//}
  	};
  	xhttp.open("POST", "date.jsp?d="+d);
  	xhttp.setRequestHeader("Content-type", "application/x-www-form-urlencoded");
  	xhttp.send("d="+d);
	

}
function loadD2(){
	var d1 = document.getElementById("date1").value ;
	var d2 = document.getElementById("date2").value ;
	const xhttp = new XMLHttpRequest();
	console.log(d1+":"+d2);
	xhttp.onload  = function() {
  		//if (xhttp.readyState == 4 && xhttp.status == 200) {
  	    document.getElementById("cnt").innerHTML = xhttp.responseText;  	    
  		//}
  	};
  	xhttp.open("POST", "dates.jsp?d1="+d1+"&d2="+d2);
  	xhttp.setRequestHeader("Content-type", "application/x-www-form-urlencoded");
  	xhttp.send("d1="+d1+"&d2="+d2);
	
}
function vEdit(){
	var x = document.getElementById("editpid").value;
	var y = document.getElementById("stock").value;
	if(x=""){
		alert("please enter product id");
		return false ;
	}
	if(isNaN(x)){
		alert("please enter a number");
		return false ;
	}
	if(x < 0){
		alert("please enter positive number");
		return false ;
	}
	if(y=""){
		alert("please enter product id");
		return false ;
	}
	if(isNaN(y)){
		alert("please enter a number");
		return false ;
	}
	if(y < 0){
		alert("please enter positive number");
		return false ;
	}
	return true ;
}
function vDelete(){
	var x = document.getElementById("deleteid").value;
	if(x=""){
		alert("please enter product id");
		return false ;
	}
	if(isNaN(x)){
		alert("please enter a number");
		return false ;
	}
	if(x < 0){
		alert("please enter positive number");
		return false ;
	}
	return true ;
}
function vAdd(){
	var x = document.getElementById("vprice").value ;
	var y = document.getElementById("vq").value ;
	
	if(x=""){
		alert("please enter product id");
		return false ;
	}
	if(isNaN(x)){
		alert("please enter a number");
		return false ;
	}
	if(x < 0){
		alert("please enter positive number");
		return false ;
	}
	if(y=""){
		alert("please enter product id");
		return false ;
	}
	if(isNaN(y)){
		alert("please enter a number");
		return false ;
	}
	if(y < 0){
		alert("please enter positive number");
		return false ;
	}
	return true ;
	
}

</script>
</head>
<body>

<header><h1 class="logo"><img src="bigmart.png" style="border-radius:70px;"></h1><br>BigMart<br><br></header>

<div class="nav1">
<ul class="nav">
<li ><a id="home" >Available Products</a></li>
<li><a id="add" >Add New Item</a></li>
<li><a id="his" >Purchase History</a></li>
<li><a id="users" >Registered User</a></li>

<li><a id="logout" href="logout">Log Out</a></li>
<li  style="float:right;color:white;"><div class="pro" style="display:flex ; justify-content:center;"><img class="profileimg" width=35px height=35px src="profile.png"  /><span id="imgtext"><%
if(request.getSession(false)!=null){  
String name=(String)session.getAttribute("name");  
  
out.print(name);  
}  
else{  
    out.print("Please login first");  
    request.getRequestDispatcher("index.jsp").include(request, response);  
}  
%></span></div>
</li>
</ul>
</div>





<div id="deleteId">
	<form action="delete" onsubmit="vDelete()" method="post">
		<input type="number" name="id" id="deleteid" placeholder="Enter Product ID to Delete.." required/>
		<button class="deleteId" type="submit"><i class="fa fa-trash-o"></i>Delete</button><br>
	</form>
	
</div>
<div id="editForm">
<form action="edit" onsubmit="vEdit()" method="post">
	<input type="number" placeholder="Enter Product ID to be Updated.." id="editpid" name="pid" required/><span style="color:red">*</span><br>
	<br><br>
<!--  	<input type="text" name="pname" placeholder="Product Name.." ><br><br>
		<input type="number" name="price" placeholder="Product Price.."  ><br><br> 
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
		<input type="url" name="image" placeholder="Product image link.."  ><br><br>
		<input type="textarea" name="description" placeholder="Product Description.."  ><br><br>
		<span>Manufactured Date : </span>
		<input type="date" name="manufacture" placeholder="Product Manufactured Date.." ><br><br>
		<span>Expring Date : </span>
		<input type="date" name="expired" placeholder="Product Expired Date.." ><br><br> -->
		<input type="number" name="quantity" id="stock" placeholder="Product Stock.." ><br><br>
		<button type="submit"  class="edit" ><i class="fa fa-edit"></i>Update</button>
</form>	
	

</div>

<div class="profile">
<img align="center" class="profileimg" width=150px height=150px src="profile.png" /> <br><br>

<table align="center" style="padding:0;text-align:left;" >
<tr ><td style="text-align:left;">ID </td><td style="text-align:left;">: <%=session.getAttribute("id") %></td></tr>
<tr><td style="text-align:left;">Name </td><td style="text-align:left;">: <%=session.getAttribute("name") %></td></tr>
<tr><td style="text-align:left;">Password </td><td style="text-align:left;">: <%=session.getAttribute("password")%></td></tr>
</table>

</div>

<%@ page import="java.sql.*" %>
<%@ page import="java.util.logging.*" %>


<div class="add" id="addItem" >
	<h2 align="center">Enter Product Details</h2>
	<form onsubmit="vAdd()" action="newItem" name="productForm" class="productForm" method="post">
		<input type="text" name="pname" placeholder="Product Name.." required><br><br>
		<input type="float" name="price" id="vprice" placeholder="Product Price.."  required><br><br> 
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
		<span>Manufactured Date : </span>
		<input type="date" name="manufacture" placeholder="Product Manufactured Date.." required><br><br>
		<span>Expring Date : </span>
		<input type="date" name="expired" placeholder="Product Expired Date.." required><br><br>
		<input type="number" name="quantity" id="vq" placeholder="Product Quantity.." required><br><br>
		<button type="submit" ><i class="fa fa-plus"></i> Add</button>
		<div>
			<%
				if(request.getAttribute("msg1")==null){
				
				}else{
					out.print(request.getAttribute("msg1"));
				}
			%>
		</div>
	</form>
</div>
<div id="history">
<div id="" style="display:flex;justify-content:center;flex-flow:row nowrap;">
<button id="uid" style="width:100px;height:40px;background-color:#366bcf;border-radius:5px;box-shadow:0 5px 5px 0;" >Report With User ID</button>
<button id="d" style="width:100px;height:40px;background-color:#366bcf;border-radius:5px;box-shadow:0 5px 5px 0;">Report On Date</button>
<button id="d2" style="width:100px;height:40px;background-color:#366bcf;border-radius:5px;box-shadow:0 5px 5px 0;">Report Between Date</button>
</div>
<div id="ruid" style="position:relative;margin:auto;">
		<input type="number" id="uid" name="uid" onkeyup="loadId(this)" required/>
</div>
<div id="rd" style="position:relative;margin:auto;">
	<input type="date" onchange="loadD(this)" required/>
</div>
<div id="rd2" style="position:relative;margin:auto;">
	
	<input type="date" id="date1" required/>
	<input type="date" id="date2" required/>
	<button type="button" onclick="loadD2()">Load</button>
	
</div>
<div id="cnt" style="padding-top:20px;"></div>
</div>
<div id="ruser">
<h2 align="center">Registered Customers</h2>
<table border="1" cellpadding="5" id="customers" align="center">
	<tr>
		<th>User ID</th>
		<th>User Name</th>
		<th>Email ID</th>
	</tr>
	<% 
	String url1 = "jdbc:mysql://localhost/grocery";
    String user1 = "ankith";
    String password1 = "Medha@2020";
    //response.setContentType("text/jsp");  
    try{
    	Connection con = DriverManager.getConnection(url1,user1,password1) ;
    	String query = "select usrid,uname,email from user" ;
    	Statement st = con.createStatement() ;
    	ResultSet rs = st.executeQuery(query) ;
    	boolean flag = rs.next();
    	if(flag){
    		while(flag){
    			out.print("<tr><td>"+rs.getInt(1)+"</td>");
    			out.print("<td>"+rs.getString(2)+"</td>");
    			out.print("<td>"+rs.getString(3)+"</td></tr>");
  
    			flag = rs.next();
    		}
    	}else{
    		out.print("<tr>"+"No Registered User"+"</tr");
    	}
    	con.close() ;
    }catch(SQLException e){
    	out.print("Error");
    } %>

   </table> 
</div>

<div id="Home">
<table border="1" cellpadding="5" id="products" align="center">
	<tr>
		<th>Product ID</th>
		<th>image</th>
		<th>Product Name</th>
		<th>Price</th>
		<th>Description</th>
		<th>Manufactured Date</th>
		<th>Expired Date</th>
		<th>Stock</th>
	</tr>
	<% 
	String url = "jdbc:mysql://localhost/grocery";
    String user = "ankith";
    String password = "Medha@2020";
    //response.setContentType("text/jsp");  
    try{
    	Connection con = DriverManager.getConnection(url,user,password) ;
    	String query = "select * from product" ;
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
    			out.print("<td>"+rs.getInt(9)+"</td></tr>");
    			flag = rs.next();
    		}
    	}else{
    		out.print("<tr>"+"No Product is Available"+"</tr");
    	}
    	con.close() ;
    }catch(SQLException e){
    	out.print("Error");
    } %>

   </table> 
   <div class="link">
   		 <button id="edit"><i class="fa fa-edit"></i>Update</button>
   		<button id="delete"><i class="fa fa-trash-o"></i>Delete</button>
   </div>
</div>



<footer class="footer">
<h4 align="left">Contact Details:<a target="_blanck" href="https://www.google.com/url?sa=t&rct=j&q=&esrc=s&source=web&cd=&cad=rja&uact=8&ved=2ahUKEwj4kuyOjZT7AhW_T2wGHSKDD8UQjBB6BAgQEAE&url=https%3A%2F%2Fwww.instagram.com%2Faccounts%2Flogin%2F&usg=AOvVaw0BRCgcMCVNSSLcNcVjPzsz"><img alt="" src="Instagram-Icon.png" width="20px" height="20px"></a>
<a target="_blanck" href="https://www.google.com/url?sa=t&rct=j&q=&esrc=s&source=web&cd=&cad=rja&uact=8&ved=2ahUKEwjMxP_MjZT7AhWfSGwGHXjsCw4QjBB6BAgQEAE&url=https%3A%2F%2Fweb.whatsapp.com%2F&usg=AOvVaw1V09js0t2A_u6GXzP1jPsR"><img alt="" src="WhatsApp.png" width="20px" height="20px"></a>
<a target="_blanck" href="https://www.google.com/url?sa=t&rct=j&q=&esrc=s&source=web&cd=&cad=rja&uact=8&ved=2ahUKEwj86PfxjZT7AhVhRmwGHXPtAqwQFnoECAwQAQ&url=https%3A%2F%2Fwww.facebook.com%2Flogin%2F&usg=AOvVaw2NEj8NwnxhOue64pSijk7e" ><img alt="" src="fb.png" width="20px" height="20px"></a>
<a target="_blanck" href="https://www.google.com/url?sa=t&rct=j&q=&esrc=s&source=web&cd=&cad=rja&uact=8&ved=2ahUKEwjb1b2CjpT7AhV5TWwGHcyIB-wQjBB6BAgLEAE&url=https%3A%2F%2Fsupport.discord.com%2Fhc%2Fen-us%2Fcommunity%2Fposts%2F360056220432-Login&usg=AOvVaw2TY_CsuopU4hy9TI9atEch" ><img alt="" src="discord.jpg" width="20px" height="20px"></a></h3>
<span style="font-size:15px">Name:Ankith Mall</span><br>
<span style="font-size:15px">email:<a id="mail" href="mailto:20mcme19@uohyd.ac.in">20mcme19@uohyd.ac.in</a></span><br>
<span style="font-size:15px">Address:University Of Hyderabad , School of Computer Science ,500046</span><br>
<span style="font-size:15px;" align="right">&copy; Copyright 2022 BigMart.com</span>
</footer>


</body>
</html>