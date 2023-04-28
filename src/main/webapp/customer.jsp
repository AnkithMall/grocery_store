<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<%@ page import="java.util.logging.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Customer Page</title>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
</head>
<style type="text/css">
	body {
		margin: 0;
		font-family:'Times New Roman', Times, serif ;
		background-image: url(background-image.jpg); 
     	background-attachment: fixed;
    	background-repeat: no-repeat;
    	background-size: cover;
    	height:1000px;
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
  		width:100%;
  		margin: 0;
  		padding: 0;
  		overflow: hidden;
  		background-color: #333;
  		transition: .5s ;
  		position:relative ;
  		top:-2px	;
  		
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
	a {
		cursor:pointer;
	}
	@media screen and (max-width: 600px) {
  		ul.nav li , .search input[type=text] {
  			float: none;
  		}
   		.search input[type=text] {
    		border: 1px solid #ccc;  
  		}
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
	#profile{
		width:250px;
		height:400px;
		position:relative;
		left: 50%;
    	top:40px;
    	transform: translate(-50%, 0);
    	position: relative;
		padding-left:5%;
		padding-top:50px;
		border:2px solid black;
	}
	tr,th,td {
		text-align:center ;
	}

	#Home,#dcart,#orderh {
		position:relative ;
		top:25px ;
		margin:auto;
		width:80% ;
		padding:50px;
		border:2px solid black ;
		height:64%;
		overflow:scroll ;
	}
	#pimg {
		width:70px;
		height:70px;
	}
	
	.search {
  width: 1000px;
  position: relative;
  display: flex;
  left:395px;
}

.searchTerm {
  width: 300px;
  border: 3px solid #00B4CC;
  border-right: none;
  padding: 5px;
  height: 20px;
  border-radius: 5px 0 0 5px;
  outline: none;
  color: #9DBFAF;
}

.searchTerm:focus{
  color: #00B4CC;
}

.searchButton {
  width: 40px;
  height: 36px;
  border: 1px solid #00B4CC;
  background: #00B4CC;
  text-align: center;
  color: #fff;
  border-radius: 0 5px 5px 0;
  cursor: pointer;
  font-size: 20px;
  position:relative;
  top:0px;
  left:-4px;
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



	
</style>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<script type="text/javascript">
var flag = true ;
$("document").ready(function(){
		
		
		$("#Home").css("background-color","white");	
		$("#profile").css("background-color","white");
		$("#home").css("background-color","#333") ;
		$("#dcart").css("background-color","white");	
		$("#order").css("background-color","#333");

		//$(".profile").hide();		
		$("#Home").hide();	
		$("#profile").show();
		$("#dcart").hide();
		$("#orderh").hide();
			//$("#tbl").hide() ;
			//$("#welcome").show() ;
		
		//$("#welcome").show() ;
		//$("#search").hide() ;
		//$("#nosearch").show() ;
		//$("#tbl").show() ;
		
		
		$(".search").click(function(){
			$("#nosearch").hide() ;
			
			$("#search").show() ;
			$("#tbl").show();
			$("#home").css("background-color","#333") ;
			
			
		});
		
		
		
		$("#home").click(function(){
			$("#Home").show();	
			$("#profile").hide();
			$("#dcart").hide();
			$("#nosearch").show() ;
			$("#search").hide() ;
			$("#welcome").hide();
			$("#orderh").hide();
			
			$("#home").css("background-color","#04AA6D") ;
			$("#cart").css("background","#333");
			$(".pro").css("background","#333");
			$("#order").css("background","#333");
		});
	
		$(".pro").click(function(){
			$("#Home").hide();	
			$("#profile").show();
			$("#dcart").hide();
			$("#search").hide() ;
			$("#welcome").hide();
			$("#orderh").hide();
			
			$("#home").css("background-color","#333") ;
			$(".pro").css("background","#04AA6D");
			$("#cart").css("background","#333");
			$("#order").css("background","#333");
		});
		
		$("#cart").click(function(){
			$("#Home").hide();	
			$("#profile").hide();
			$("#dcart").show();
			$("#search").hide() ;
			$("#welcome").hide();
			$("#orderh").hide();
			
			
			$(".pro").css("background","#333");
			$("#home").css("background-color","#333") ;
			$("#cart").css("background","#04AA6D");
			$("#order").css("background","#333");
		});
		
		$(".searchButton").click(function(){
			$("#nosearch").hide() ;
			$("#search").show() ;
			$("#welcome").hide();
			$("#tbl").show();
			
		});
		
		$("#order").click(function(){
			$("#Home").hide();	
			$("#profile").hide();
			$("#dcart").hide();
			
			$("#orderh").show();
			
			
			$(".pro").css("background","#333");
			$("#home").css("background-color","#333") ;
			$("#cart").css("background","#333");
			$("#order").css("background","#04AA6D");
		});
		
});

</script>
<script>
	function loadDB() {
	var x = document.getElementsByName("keytext")[0].value;  
	var id = document.getElementsByName("id")[0].value;
  	const xhttp = new XMLHttpRequest();
  	
  	xhttp.onreadystatechange  = function() {
  		if (this.readyState == 4 && this.status == 200) {
  	    document.getElementById("tbl").innerHTML = this.responseText;  	    
  		}
  	};
  	
  	xhttp.open("POST", "search.jsp?keytext="+x+"&id="+id);
  	xhttp.setRequestHeader("Content-type", "application/x-www-form-urlencoded");
  	xhttp.send("id="+id+"&keytext="+x);
  	
	}
	function loadcart(obj) {
		
		var id = $(obj).attr("usrid");
	  	const xhttp = new XMLHttpRequest();
	  	
	  	xhttp.onreadystatechange  = function() {
	  		if (this.readyState == 4 && this.status == 200) {
	  	    document.getElementById("dcart").innerHTML = this.responseText;  	    
	  		}
	  	};
	  	
	  	xhttp.open("POST", "cart.jsp?usrid="+id);
	  	xhttp.setRequestHeader("Content-type", "application/x-www-form-urlencoded");
	  	xhttp.send("usrid="+id);
	  	
		}
	function deleteDB(obj){
		var id = $(obj).attr("data-id") ;
		console.log(id);
const xhttp = new XMLHttpRequest();
		
	/*	xhttp.onreadystatechange  = function() {
	  		if (xhttp.readyState == 4 && xhttp.status == 200) {
	  	    document.getElementById("rmvc").innerHTML = xhttp.responseText;  	    
	  		}
	  	};*/
	  	var usrid = $(obj).attr("usrid");
	  	console.log(usrid);
	  	xhttp.open("POST", "removeCart?id="+id+"&usrid="+usrid);
	  	xhttp.setRequestHeader("Content-type", "application/x-www-form-urlencoded");
	  	xhttp.send("id="+id);
	  	
	  	loadcart($(obj));
	}
	function order(obj){
		var usrid = $(obj).attr("usrid");
		const xhttp = new XMLHttpRequest();
	  	console.log(usrid);
	  	xhttp.onload  = function() {
	  		//if (xhttp.readyState == 4 && xhttp.status == 200) {
	  	    document.getElementById("dcart").innerHTML = xhttp.responseText;  	    
	  		//}
	  	};
	  	xhttp.open("POST", "placeOrder.jsp?usrid="+usrid);
	  	xhttp.setRequestHeader("Content-type", "application/x-www-form-urlencoded");
	  	xhttp.send("usrid="+usrid);
		
	}
	function myorder(obj){
		var usrid = $(obj).attr("usrid");
		const xhttp = new XMLHttpRequest();
	  	//console.log(usrid);
	  	xhttp.onload  = function() {
	  		//if (xhttp.readyState == 4 && xhttp.status == 200) {
	  	    document.getElementById("orderh").innerHTML = xhttp.responseText;  	    
	  		//}
	  	};
	  	xhttp.open("POST", "myorders.jsp?usrid="+usrid);
	  	xhttp.setRequestHeader("Content-type", "application/x-www-form-urlencoded");
	  	xhttp.send("usrid="+usrid);
		
	}

		//var id = $(this).attr("data-id");
		
</script>
<body>
<header><h1 class="logo" ><img src="bigmart.png" style="border-radius:70px;"></h1><br>BigMart<br><br></header>

<div class="nav1">
<ul class="nav">
<li ><a id="home" >Home</a></li>
<li><a id="cart" usrid=<%=session.getAttribute("id") %> onclick="loadcart(this)">Cart</a></li>
<li><a id="order" usrid=<%=session.getAttribute("id") %> onclick="myorder(this)">My Orders</a></li>
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

<div id="Home">

<div class="wrap">
   <div class="search">
   	 <!--  <form name="searchform"> -->
      <input type="text" class="searchTerm" name="keytext" placeholder="What are you looking for?" onkeyup="loadDB()" required/>
      <input type="hidden" name="id" value=<%=session.getAttribute("id")%> />
      
      <button class="searchButton" onclick="loadDB()">
        <i class="fa fa-search"></i>
     </button>
     <!--  </form> --> 
     
   </div>
</div>
<br>
<div id="nosearch">
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
    			
    			out.print("<td ><form onsubmit='vAdd()' method='post' action='addCart'>"
    				+"<input type='hidden' name='usrid' value='"+session.getAttribute("id")+"'/>"
    				+"<input type='hidden' name='pid' value='"+rs.getInt(1)+"'/>"
    				+"<div style='display:flex;flex-flow:row nowrap;'><input type='number' name='quantity' style='width:40px;float:left;'  required/>"
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

   </table></div>
   <div id="search">
   <div id="tbl">
   		
	
	<!--  <session.getAttribute("rows") > -->
   </div>
  <!--   <div style="" id="welcome">
   	<h2 align="center">Welcome <=session.getAttribute("name") %> to Big Mart !</h2>
   	<h2 align="center">Shop Smart , Live Better !</h2>
   </div> -->
   </div>
    <br>
     <div class="npage" style="float:right;"><a href="">5</a> | <a href="">10</a> | <a href="">20</a> | <a href="">40</a></div>
   
</div>

<div id="dcart">
<h3 id="ord" ></h3>
</div>




<div id="profile">

<img align="center" class="profileimg" width=150px height=150px src="profile.png" style="left:18px;"/> <br><br>

<table align="center" style="padding:0;text-align:left;" >
<tr ><td style="text-align:left;">ID </td><td style="text-align:left;">: <%=session.getAttribute("id") %></td></tr>
<tr><td style="text-align:left;">Name </td><td style="text-align:left;">: <%=session.getAttribute("name") %></td></tr>
<tr><td style="text-align:left;">Email ID </td><td style="text-align:left;">: <%=session.getAttribute("email")%></td></tr>
<tr><td style="text-align:left;">Password </td><td style="text-align:left;">: <%=session.getAttribute("password")%></td></tr>
</table>

</div>

<div id="orderh" style="background-color:white;">


</div>

<footer class="footer">
<h4 align="left">Contact Details:<a target="_blanck" href="https://www.google.com/url?sa=t&rct=j&q=&esrc=s&source=web&cd=&cad=rja&uact=8&ved=2ahUKEwj4kuyOjZT7AhW_T2wGHSKDD8UQjBB6BAgQEAE&url=https%3A%2F%2Fwww.instagram.com%2Faccounts%2Flogin%2F&usg=AOvVaw0BRCgcMCVNSSLcNcVjPzsz"><img alt="" src="Instagram-Icon.png" width="20px" height="20px"></a>
<a target="_blanck" href="https://www.google.com/url?sa=t&rct=j&q=&esrc=s&source=web&cd=&cad=rja&uact=8&ved=2ahUKEwjMxP_MjZT7AhWfSGwGHXjsCw4QjBB6BAgQEAE&url=https%3A%2F%2Fweb.whatsapp.com%2F&usg=AOvVaw1V09js0t2A_u6GXzP1jPsR"><img alt="" src="WhatsApp.png" width="20px" height="20px"></a>
<a target="_blanck" href="https://www.google.com/url?sa=t&rct=j&q=&esrc=s&source=web&cd=&cad=rja&uact=8&ved=2ahUKEwj86PfxjZT7AhVhRmwGHXPtAqwQFnoECAwQAQ&url=https%3A%2F%2Fwww.facebook.com%2Flogin%2F&usg=AOvVaw2NEj8NwnxhOue64pSijk7e" ><img alt="" src="fb.png" width="20px" height="20px"></a>
<a target="_blanck" href="https://www.google.com/url?sa=t&rct=j&q=&esrc=s&source=web&cd=&cad=rja&uact=8&ved=2ahUKEwjb1b2CjpT7AhV5TWwGHcyIB-wQjBB6BAgLEAE&url=https%3A%2F%2Fsupport.discord.com%2Fhc%2Fen-us%2Fcommunity%2Fposts%2F360056220432-Login&usg=AOvVaw2TY_CsuopU4hy9TI9atEch" ><img alt="" src="discord.jpg" width="20px" height="20px"></a></h3>
<span style="font-size:15px">Name:Ankith Mall</span><br>
<span style="font-size:15px">email:<a id="mail" href="mailto:20mcme19@uohyd.ac.in">20mcme19@uohyd.ac.in</a></span><br>
<span style="font-size:15px">Address:University Of Hyderabad , School of Computer Science ,500046</span><br>
<span style="font-size:15px;" align="right">Copyright &copy;  2022 BigMart.com</span>
</footer>
</body>
</html>