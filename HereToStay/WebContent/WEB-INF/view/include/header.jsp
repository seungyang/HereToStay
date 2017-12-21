<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%-- <% String sess = (String)request.getAttribute("session"); --%>
<!-- //    String goLogin = (String)request.getAttribute("goLogin"); -->

<!-- //    System.out.println("go LoGIN "+ goLogin); -->
<!-- //    if(sess != null) { -->
<!-- // 	   session.setAttribute("memId", sess); -->
<!-- //    } -->
<%-- %> --%>
<% String memId = (String)session.getAttribute("memId"); %>
<link rel="shortcut icon" href="/favicon.ico" />
<script type="text/javascript">
	//아이디 중복체크
	function idDuplicateCheck(){
	    // 로그인 프로세스 호출
	    $.ajax({
	        type: 'post',
	        async: true,
	        url:'/member/idCheck.do',
	        contentType:'application/x-www-form-urlencoded;charset=UTF-8',
	        data: "memId=" + $("#memId").val(),
	       
	        success:function(resultData){
	        	$('#memId').parent().find('b').eq(0).html(resultData);
			}
	    });
	}
</script>

<input type='hidden' id='memberId' value="<%=memId%>"/>
<!-- // authorize // -->
	<form id="loginOk" method="post">
		<div class="overlay"></div>
		<div class="autorize-popup2" style="z-index:9999;width:444px;height:255px;background:#fff;position:fixed;left:50%;top:-300px;margin-top:-128px;margin-left:-222px;">
			<div class="autorize-tabs2">
				<a href="#" class="autorize-tab-a current2">로그인</a>
				<a href="#" class="autorize-close"></a>
				<div class="clear"></div>
			</div>
			<section class="autorize-tab-content">
				<div class="autorize-padding">
					<h6 class="autorize-lbl">'여기없대'를 방문해주셔서 감사합니다</h6>
					<input type="text" id="logId" placeholder="ID">
					<input type="password" id="logPwd" placeholder="PASSWORD">
					<footer class="autorize-bottom">
						<input class="authorize-btn" type="button" value="로그인" id="memLogin"></input>
						<div class="clear"></div>
						
					</footer>
				</div>
			</section>
		</div>
	</form>

	
	<form action="/member/joinInsert.do" id="joinInsert" method="post">
		<div class="autorize-popup">
			<div class="autorize-tabs">
				<a href="#" class="autorize-tab-a current">회원가입</a>
				<a href="#" class="autorize-close"></a>
				<div class="clear"></div>
			</div>
			<section class="autorize-tab-content">
				<div class="autorize-padding">
					<h6 class="autorize-lbl">회원가입을 통해 '여기없대'의 모든 서비스를 받아보세요</h6>
					<br/>
					<input type="text" id="memId" name="memId" placeholder="ID" onkeyup="idDuplicateCheck()"> <b id="idCheck" class="autorize-lbl" style="color: red; margin-left: 10px;">아이디를 입력하세요</b>
					<input type="password" id="memPwd" name="memPwd" placeholder="PASSWORD"> <b id="idCheck" class="autorize-lbl" style="margin-left: 10px;">8자리 이상이여야 합니다</b>
					<input type="password" id="memPwdCk" placeholder="PASSWORD-CHECK"> <b id="idCheck" class="autorize-lbl" style="margin-left: 10px;">비밀번호를 다시 입력하세요</b>
					<input type="text" id="memName" name="memName" placeholder="NAME"> <b id="idCheck" class="autorize-lbl" style="margin-left: 10px;">성명을 입력하세요</b>
					<input type="text" id="memTel" name="memTel" placeholder="TEL-NUM"> <b id="idCheck" class="autorize-lbl" style="margin-left: 10px;">전화번호를 입력하세요</b>
					<input type="email" id="memMail" name="memMail" placeholder="E-MAIL">  <b id="idCheck" class="autorize-lbl" style="margin-left: 10px;">이메일을 입력하세요</b>
					<input type="text" id="memBirth" name="memBirth" placeholder="BIRTHDAY"> <b id="idCheck" class="autorize-lbl" style="margin-left: 10px;">(ex) 920415-2 &nbsp;→&nbsp; 9204152</b>
					<input type="text" id="memRpwd" name="memRpwd" placeholder="ROOM-PASSWORD"> <b id="idCheck" class="autorize-lbl" style="margin-left: 10px;">입실 시 사용할 비밀번호</b>
					<footer class="autorize-bottom">
						<button class="authorize-btn2" id="memJoin">회원가입</button>
						<div class="clear"></div>
					</footer>
				</div>
			</section>
		</div>
	</form>
<!-- \\ authorize \\-->

<header id="top" style="z-index:99999;">

	<% if(memId == null) { %>

		<div class="header-a">
			<div class="wrapper-padding">
				<div class="header-account">
					<a href="#">회원가입</a>
				</div>
			</div>
			<div class="wrapper-padding">
				<div class="header-account2" style="float:right;">
					<a href="#" style="color:#fff;font-size:11px;text-transform:uppercase;font-family:'Montserrat';font-weight:700;text-decoration:none;display:inline-block;border-left:1px solid #333333;border-right:1px solid #333333;	padding:14px 22px 0px 22px;height:26px;">로그인</a>
				</div>
			</div>
			<div class="wrapper-padding_mobile">
				<div class="header-account2_mobile" style="float:right;">
					<a  class='mobile_login' style="cursor:pointer;color:#fff;font-size:11px;text-transform:uppercase;font-family:'Montserrat';font-weight:700;text-decoration:none;display:inline-block;border-left:1px solid #333333;border-right:1px solid #333333;	padding:14px 22px 0px 22px;height:26px;">로그인</a>
				</div>
			</div>
		</div>
	
	<% } else {%>
	
		<div class="header-a">
			<div class="wrapper-padding">
				<div class="header-account3" style="float:right;">
					<a href="index_memberLogout.do" style="color:#fff;font-size:11px;text-transform:uppercase;font-family:'Montserrat';font-weight:700;text-decoration:none;display:inline-block;border-left:1px solid #333333;border-right:1px solid #333333;	padding:14px 22px 0px 22px;height:26px;">로그아웃</a>
				</div>
			</div>
			<div class="wrapper-padding">
				<div class="header-account3" style="float:right;">
					<a href="#" style="color:#fff;font-size:11px;text-transform:uppercase;font-family:'Montserrat';font-weight:700;text-decoration:none;display:inline-block;border-left:1px solid #333333;border-right:1px solid #333333;	padding:14px 22px 0px 22px;height:26px;"><%= memId %> 님 반갑습니다.</a>
				</div>
			</div>
		</div>
	
	<% } %>
	
	
	<div class="header-b">
		<!-- // mobile menu // -->
			<div class="mobile-menu">
				<nav>
					<ul>
						<li><a class="has-child" id='mobile_aboutUs'  href="/member/aboutUs.do">
						<img style="width:50px;height:20px" src="/img/about_log2.png"></img></a>					
						</li>
						<li><a id='findPension' class="has-child" href="/member/pensionSearch.do?page=1&opt=what">
						<img style="width:50px;height:20px" alt="펜션찾기" src="/img/find_log2.png"></img></a>
						</li>						
						<li><a class="has-child mobile_login" >
						<img style="width:50px;height:20px" src="/img/qna_log2.png"></img></a>
						<input type="hidden" value="/member/qnaWrite.do" >
						</li>
						<li><a class="has-child mobile_login">
						<img style="width:50px;height:20px" alt="마이페이지" src="/img/mypage_log2.png"></img></a>
						<input type="hidden" value="/member/myPage.do?pageS=1&tag=1&sort1=1&sort2=1">
						</li>
					</ul>
					
				</nav>	
			</div>
		<!-- \\ mobile menu \\ -->
			
		<div class="wrapper-padding">
			<div class="header-logo"><a href="/member/index_member.do"><img alt="" src="/img/logo.png" /></a></div>
			<div class="header-right">
				<div class="hdr-srch">
					<a href="#" class="hdr-srch-btn"></a>
				</div>
				<div class="hdr-srch-overlay">
					<div class="hdr-srch-overlay-a">
						<input type="text" value="" placeholder="Start typing...">
						<a href="#" class="srch-close"></a>
						<div class="clear"></div>
					</div>
				</div>	
				<div class="hdr-srch-devider"></div>
				<a href="#" class="menu-btn"></a>
				<nav class="header-nav" style="height:50px;margin-top:-5px">
					<ul>
						<li><a class="has-child" href="/member/aboutUs.do">
						<b style="font-size:17px">여기없대   </b></a>				
						</li>
						<li><a class="has-child" href="/member/pensionSearch.do?page=1&opt=what">
						<b style="font-size:17px">펜션찾기</b></a>
						</li>						
						<li><a class="has-child" style="cursor:pointer" id='QnAbtn'>
						<b style="font-size:17px">문의사항</b></a>
						</li>
						<li><a class="has-child" style="cursor:pointer" id ='MyPage' >
						<b style="font-size:17px">마이페이지</b></a>
						</li>
					</ul>
				</nav>
			</div>
			<div class="clear"></div>
		</div>
	</div>	
</header>
<script>
$('.mobile_login').click(function(){
	var memId=$('#memberId').val();
	if(memId=='null')
	{
		$('.autorize-popup2').css('width','300px');
	    $('.autorize-popup2').css('margin-left','-150px');
		$('#logId').css('width','200px');
		$('#logPwd').css('width','200px');
		$('.autorize-popup2').animate({top: '80%'}, 300).find('input:text').eq('0').focus();
	 	$('.overlay').css('display','block');
	 	
	 	$(this).removeClass('open');
		$(this).closest('li').find('ul').slideUp(); 
	 	$('.mobile-menu').removeClass('open');
		$('.mobile-menu').slideUp(); 
	 
	}else{
		
	 	$(this).attr("href", $(this).next().val());
	}
		
	
});
$('#QnAbtn').click(function(){
	var memId=$('#memberId').val();
	if(memId=='null')
	{
		$('.autorize-popup2').animate({top: '50%'}, 300).find('input:text').eq('0').focus();
	 	$('.overlay').css('display','block');	
	 	$('.autorize-popup2').css("width",'444px');
	 	$('.autorize-popup2').css("margin-left",'-222px');
		$('#logId').css('width','399px');
		$('#logPwd').css('width','399px');
	 	
	}else{
		
	 	$(this).attr("href", "/member/qnaWrite.do");
	}
		
	
});
$('#MyPage').click(function(){
	var memId=$('#memberId').val();
	if(memId=='null')
	{
		$('.autorize-popup2').animate({top: '50%'}, 300).find('input:text').eq('0').focus();
	 	$('.overlay').css('display','block');	
		$('.autorize-popup2').css("width",'444px');
	 	$('.autorize-popup2').css("margin-left",'-222px');
		$('#logId').css('width','399px');
		$('#logPwd').css('width','399px');
	}else{
		
	 	$(this).attr("href", "/member/myPage.do?pageS=1&tag=1&sort1=1&sort2=1");
	}
		
	
});


// $('#findPension').click(function(){

// 	$(this).attr("href", "/member/pensionSearch.do?page=1&opt=what");
	
// });


</script>