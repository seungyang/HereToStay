<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
  <title>Sparrow | Travel Agency</title>
  <meta name="description" content="" />
  <meta name="keywords" content="" />
  <meta charset="utf-8" /><link rel="icon" href="favicon.png" />
  <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no">
  <link rel="stylesheet" href="/build/mediaelementplayer.min.css" />
  <link rel="stylesheet" href="/css/jquery.formstyler.css">  
  <link rel="stylesheet" href="/css/style.css" />
  <link href='http://fonts.googleapis.com/css?family=Montserrat:400,700' rel='stylesheet' type='text/css'>
  <link href='http://fonts.googleapis.com/css?family=Lora:400,400italic' rel='stylesheet' type='text/css'>    
  <link href='http://fonts.googleapis.com/css?family=Raleway:300,400,500,700' rel='stylesheet' type='text/css'>  
  <link href='http://fonts.googleapis.com/css?family=PT+Sans:400,700&amp;subset=latin,cyrillic' rel='stylesheet' type='text/css'>
  <link href='http://fonts.googleapis.com/css?family=Open+Sans:300,400,600,700&amp;subset=latin,cyrillic' rel='stylesheet' type='text/css'>
    
    <style>
    .contacts-colls-l > div > a:hover{color:#FFC5D0;}
	.booking-form-i.textarea{width:141%; margin-left:12px;}
	.chatwrap{width:580px; height:520px; position:relative;}
	.chatwrap img{display:block; height:520px; width:52%}
	.booking-form{position:absolute; left:0; bottom:0;}
	.booking-form-i .textarea-wrapper{border:none;}
	.contacts-colls .booking-form-i{margin-bottom:0;}
	.booking-form-i{margin-bottom:7px;}
	.contacts-send{color:#fff; border-radius:20px; width:auto; position:absoltue; left:50px; bottom:10px; margin-left: 131px; margin-bottom: 4px; background:#FFC5D0; border:1px solid #fff}
	.masterChat{
		float:left;
	}
	.userChat{
		float:right;
		margin-right:10px;
	}
	.textcontent{margin-left:10px;}
	
	.textcontent div{
	 background:#fff;
	 border-radius:7px;
	 -webkit-border-radius:7px;
	 -o-border-radius:7px;
	 -ms-border-radius:7px;
	 padding:12px 5px 5px 5px;
	 margin-bottom:10px;
	 width:65%;
	 }
	 
	 .textwrap{height:300px; background:#e6e6e6; width: 262px; position:absolute; left: 19px;
	    top: 58px;}
	.contacts-colls-rb{position:relative;}
	.booking-form-i .textarea-wrapper textarea{height:22px;}
	.contacts-colls-r{margin:0 0 0 407px;}
	.masterChat,
	.userChat{position:relative;}
	.masterChat img{position:absolute; left:-1px; top:-30px; width:25%;}
	.userChat img{position:absolute; left:-5px; top:-5px; width:25%;}
	</style>
  
	<script src="/js/jquery-1.7.1.js" type="text/javascript"></script>
	<script type="text/javascript">
	var chatapp = {
		append: function(msg){
			if(msg.message.match(/first@/)) {
				var msg = '실시간 1:1 문의사항이 가능합니다.';
				$("#chatmessage").append(msg + "<br/><br/><br/>");
			}else if(msg.message.match(/zCli@/)) {
				var msg = msg.message.split('@');
				$("#chatmessage").append("<div class='userChat' style='text-align: right; margin-left:10px;'><p>" + msg[1] + "</p></div>");
			} else {
				var msg = msg.message.split('@');
				$("#chatmessage").append("<div class='masterChat'><img src='/img/master.png' alt='master프로필'><p>" + msg[1] + "</p></div>");				
			}
			
		}
	};
	
	$(function() {
		$("#sendQnA").click(function() {
			var msg = 'zCli@' + $("#qnaContext").val();
			$.ajax({
				type: "POST",
				url: '/sendMessage',
				data: {message: msg},
				success: function(data) {}
			});
			$("#qnaContext").val("");
		});
		document.getElementById("comet-frame").src = "/enter";
	});
	</script>
  
</head>  
<body>  
<%-- <jsp:include page="/WEB-INF/view/include/owner_header.jsp"/> --%>

<!-- main-cont -->
<div class="main-cont">
 	
<!--  	여기에 회면구성 -->
	<div class="contacts-page-holder">
 	<div class="contacts-page">
		<header class="page-lbl">
			<div class="offer-slider-lbl">문의 사항을 보내주세요</div>
		</header> 	
		
		<div class="contacts-colls">
			<div class="contacts-colls-l">
				<div><a href="/owner/Main.do" style="font-size:30px; text-decoration:none;">Home&nbsp;&nbsp;</a><br /></div>
				<div class="contact-colls-lbl">직접 문의하시길 원하나요?</div>
				<div class="contacts-colls-txt">
					<p>Address : 가산디지털 1로 149, 가산동 371-59 </p>
					<p>Telephones : +82 2-156-1577</p>
					<p>E-mail : HereToStay@gmail.com</p>
					<p>Kakao : HTS</p>
					<div class="side-social">
        				<a class="side-social-twitter"></a>
        				<a class="side-social-facebook"></a>
        				<a class="side-social-vimeo"></a>
        				<a class="side-social-pinterest"></a>
        				<a class="side-social-instagram"></a> 
      				</div>
				</div>
			</div>
			
				<div class="contacts-colls-r">
	  				<div class="contacts-colls-rb">
	  					<div class="textwrap" style="padding-top:35px; overflow-y:scroll">
					        <div class="textcontent" id="chatmessage"></div>
					    </div>
	  					<div class="chatwrap">
	  						<img src="/img/owner/i_phone.png" alt="" >
<!-- 						<div class="contact-colls-lbl">Q &amp; A</div> -->
						<div class="booking-form">
								<div class="booking-form-i textarea">
<!-- 									<label>QnA 내용 :</label> -->
									<div class="textarea-wrapper">
										<textarea name="qnaContext" id="qnaContext"></textarea>
									</div>
								</div>
								<div class="clear"></div>
								<input type="button" class="contacts-send" id="sendQnA" value="Q&A">
								<iframe id="comet-frame" style="display: none;"></iframe>
						</div>
						</div>
	  				</div>
	  			<div class="clear"></div>
				</div>
			</div>
		<div class="clear"></div>	
 	</div>
	</div>
	
	
 	
</div>
<!-- /main-cont -->

<jsp:include page="/WEB-INF/view/include/footer3.jsp"/>

<!-- // scripts // -->
  <script src="/js/jquery-1.11.3.min.js"></script>
  <script src="/js/jquery.form.js"></script>
  <script src="/js/jqeury.appear.js"></script>  
  <script src="/js/jquery-ui.min.js"></script> 
  <script src="/js/owl.carousel.min.js"></script>
  <script src="/js/bxSlider.js"></script>
  <script src="/js/jquery.formstyler.js"></script> 
  <script src="/js/custom.select.js"></script>    
  <script type="text/javascript" src="/js/twitterfeed.js"></script>
  <script src="/js/script.js"></script>
<!-- \\ scripts \\ --> 
 
</body>  
</html> 