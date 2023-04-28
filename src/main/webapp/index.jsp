<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>log in</title>
<link rel="stylesheet" href="index.css">
<style type="text/css">
header {
	background-color:#0b007e ;
	text-align:center;
	padding: 6px;
  	border: none;
  	margin: auto;
  	font-size: 40px;
  	color:white ;	
}
footer{

	bottom:0%;
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

</style>
</head>
<body>
<header><h1 class="logo"><img src="bigmart.png" style="border-radius:70px;"></h1><br>BigMart<br><br></header>
    <div class="box">
        <div class="button-box">
            <div id="btn"></div>
            <button class="toggle-btn" onclick="login()">Log In</button>
            <button class="toggle-btn" onclick="register()">Register</button>
        </div>
        <div class="form-box">
        <form id="login" class="input-form" method="post" action="Login" onsubmit="getElementById('msg').innerHTML = '' ">
            <select name="cat" id="cat">
            	<option value="user">User</option>
            	<option value="admin">Admin</option>
            </select>
            <input type="text" class="input" name="username" placeholder="Username" required>
            
            <input type="password" class="input" name="password" placeholder="Password" required>
            <!-- <input type="checkbox" name="rememberMe">
			<label for="checkbox">Remember Me</label> -->
            
            <button type="submit" class="login" >Log in</button>
        </form>
        
        
        
        <form id="register" class="input-form" method="post" action="reg">
            
            <input type="text" class="input" name="username" placeholder="Username" required>
            
            <input type="email" class="input" name="email" placeholder="abc@gmail.com" required>
            
            <input type="password" class="input" name="password" placeholder="Password" required>
            <button class="login" type="submit" >Register</button>
        </form>
        <div id="msg" ><% if(request.getAttribute("msg") == null){}else{out.println(request.getAttribute("msg"));} %></div>
        </div>    
    </div>

<script>
    var x = document.getElementById("login") ;
    var y = document.getElementById("register");
    var z = document.getElementById("btn") ;
    function register(){
        x.style.left = "-400px" ;
        y.style.left="50px" ;
        z.style.left="110px" ;
    }
    function login(){
        x.style.left = "50px" ;
        y.style.left="450px" ;
        z.style.left="0px" ;
    }
    
    
    function action(form){
    	var c = document.getElementById("cat").value ;
    	if (c == "user" ){
    		form.action = "customer.jsp";
    		return true ;
    	}
    	if(c == "admin"){
    		form.action = "shopkeeper.jsp" ;
    		return true ;
    	}
    	return false ;
    }
    
</script>
    
<footer>
<h4 align="left">Contact Details:<a target="_blanck" href="https://www.google.com/url?sa=t&rct=j&q=&esrc=s&source=web&cd=&cad=rja&uact=8&ved=2ahUKEwj4kuyOjZT7AhW_T2wGHSKDD8UQjBB6BAgQEAE&url=https%3A%2F%2Fwww.instagram.com%2Faccounts%2Flogin%2F&usg=AOvVaw0BRCgcMCVNSSLcNcVjPzsz"><img alt="" src="Instagram-Icon.png" width="20px" height="20px"></a>
<a target="_blanck" href="https://www.google.com/url?sa=t&rct=j&q=&esrc=s&source=web&cd=&cad=rja&uact=8&ved=2ahUKEwjMxP_MjZT7AhWfSGwGHXjsCw4QjBB6BAgQEAE&url=https%3A%2F%2Fweb.whatsapp.com%2F&usg=AOvVaw1V09js0t2A_u6GXzP1jPsR"><img alt="" src="WhatsApp.png" width="20px" height="20px"></a>
<a target="_blanck" href="https://www.google.com/url?sa=t&rct=j&q=&esrc=s&source=web&cd=&cad=rja&uact=8&ved=2ahUKEwj86PfxjZT7AhVhRmwGHXPtAqwQFnoECAwQAQ&url=https%3A%2F%2Fwww.facebook.com%2Flogin%2F&usg=AOvVaw2NEj8NwnxhOue64pSijk7e" ><img alt="" src="fb.png" width="20px" height="20px"></a>
<a target="_blanck" href="https://www.google.com/url?sa=t&rct=j&q=&esrc=s&source=web&cd=&cad=rja&uact=8&ved=2ahUKEwjb1b2CjpT7AhV5TWwGHcyIB-wQjBB6BAgLEAE&url=https%3A%2F%2Fsupport.discord.com%2Fhc%2Fen-us%2Fcommunity%2Fposts%2F360056220432-Login&usg=AOvVaw2TY_CsuopU4hy9TI9atEch" ><img alt="" src="discord.jpg" width="20px" height="20px"></a></h3>
<span style="font-size:15px">Name:Ankith Mall</span><br>
<span style="font-size:15px">email:<a id="mail" href="mailto:20mcme19@uohyd.ac.in">20mcme19@uohyd.ac.in</a></span><br>
<span style="font-size:15px">Address:University Of Hyderabad , School of Computer Science ,500046</span><br>
<span style="font-size:15px;" align="right">&copy; Copyright 2022 HTML.am</span>
</footer>

</body>
</html>