<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
   <% String memId =(String)session.getAttribute("memId"); %> 
<link rel="stylesheet" href="/css/w3.css">

<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Chat</title>


<div class="w3-container">
  <% if(memId!=null){ %>
     <a href="/member/realQnA.do"><button onclick="document.getElementById('id01').style.display='block'" class="w3-button w3-black w3-custum">Open Animated Modal</button></a>
 <%} else{%>
   <a ><button onclick="realQnA_login()" class="w3-button w3-black w3-custum">Open Animated Modal</button></a>
<%} %>
</div>
   
<footer class="footer-b">
   <div class="wrapper-padding">
      <div class="footer-left">© Copyright 2017 by HereToStay. All rights reserved.</div>
      <div class="footer-social">
         <a class="footer-twitter"></a>
         <a class="footer-facebook"></a>
         <a class="footer-vimeo"></a>
         <a class="footer-pinterest"></a>
         <a class="footer-instagram"></a>
      </div>
      <div class="clear"></div>
   </div>
   
</footer>
<script>
function realQnA_login()
{
	$('.autorize-popup2').animate({top: '50%'}, 300).find('input:text').eq('0').focus();
 	$('.overlay').css('display','block');	
	
	}
</script>