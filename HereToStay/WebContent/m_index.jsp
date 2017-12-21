<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<jsp:include page="/WEB-INF/view/common/owner_header.jsp"></jsp:include>
<jsp:include page="/WEB-INF/view/common/manager_header.jsp"></jsp:include>
<!DOCTYPE html>
<html>
<head>
  <title>Sparrow | Travel Agency</title>
  <meta name="description" content="" />
  <meta name="keywords" content="" />
 <link rel="shortcut icon" href="/favicon.ico" />
  <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no"> 
  <link rel="stylesheet" href="/source/jquery.fancybox.css">
  <link rel="stylesheet" href="/css/jquery.formstyler.css">  
  <link rel="stylesheet" href="/css/common/style.css" />
  <link href='http://fonts.googleapis.com/css?family=Montserrat:400,700' rel='stylesheet' type='text/css'>
  <link href='http://fonts.googleapis.com/css?family=Lora:400,400italic' rel='stylesheet' type='text/css'>    
  <link href='http://fonts.googleapis.com/css?family=Raleway:300,400,500,700' rel='stylesheet' type='text/css'>  
  <link href='http://fonts.googleapis.com/css?family=PT+Sans:400,700&amp;subset=latin,cyrillic' rel='stylesheet' type='text/css'>
  <link href='http://fonts.googleapis.com/css?family=Open+Sans:300,400,600,700&amp;subset=latin,cyrillic' rel='stylesheet' type='text/css'>
   <link rel="stylesheet" href="/css/jquery-ui.css"> 
  <link rel="stylesheet" href="/css/owl.carousel.css">
  <link rel="stylesheet" href="/css/idangerous.swiper.css">

  <style>
   body{background:#000;}
  
   .portfolio-i-text b{
      font-size:16px;
   }
   .portfolio-i-text span{
      font-size:14px;
      color:#ff6638;
   }
   
   .bg_event{
      position: fixed;
      left: 0;
      top: 0;
      width: 100%;
      height: 100%;
      background: url(/img/bg_event1.jpg) no-repeat center;
      background-size: cover;
   }

 	.portfolio-three-colls .portfolio-i{
		       margin-left: 35%;
	 }
   .autorize-tab-content input[type='password']{
   border: 1px solid #ebebeb;
    background: #fff;
    width: 381px;
    border-radius: 3px;
    font-size: 11px;
    padding: 10px 8px 10px 8px;
    font-family: 'Raleway';
    font-weight: 600;
    color: #8a8a8a;
    margin-bottom: 15px;
   }
   
   .header-account a{font-size:14px; border:none;}
   .header-account2 a{font-size:14px; border:none;}
	.header-account3 a{font-size:14px; border:none;}
   .portfolio-i-text{height:60px;}
   .portfolio-i-text b{padding-top:9px;}
   .portfolio-holder{padding-top:180px;} 
 	@media screen and(max-width:1130px){
 		.portfolio-three-colls .portfolio-i{
		   margin-left: 1.1%
		 }
 	};
 	
 	@media screen and (min-width: 900px){
	.portfolio-three-colls .portfolio-i {
   		 margin-left: 30%;
		}
    }
 	
	@media screen and (max-width: 500px){
	.portfolio-three-colls .portfolio-i {
	    width: 100%;
	    margin-left: 0px;
	    margin-right: 0px;
	   
	    }
	     .portfolio-holder{padding-top:100px;} 
	 }
  </style>
</head>  
<body>  

      <div class="bg_event"></div>
      <div class="portfolio-holder portfolio-holder-three">
      <div class="portfolio-three-colls">
         
         <!-- // -->
         <div class="header-account3">
         <div class="portfolio-i photography">
            <div class="portfolio-i-img">   
               <div class="portfolio-i-over">
                  <div class="portfolio-i-over-a">
                     <div class="portfolio-i-over-b">
<!------------------------------------------------------------ START OF 로그인 창 띄어주기 (관리자)---------------------------------------------------------->
                              <a href="#">Click Here</a>
<!------------------------------------------------------------- END OF 로그인 창 띄어주기 (관리자)---------------------------------------------------------->
                     </div>
                  </div>
               </div>
            <img alt="" src="/img/manager/managerindex.png" >
            </div>
            <div class="portfolio-i-text">
               <b>관리자 </b>
               <span>Join</span>
            </div>
         </div>

         </div>
         <!-- \\ -->
      </div>
      </div>

<!-- /main-cont -->
<!-- // scripts // -->
   <script src="/js/jquery-1.11.3.min.js"></script>
  <script src="/js/jqeury.appear.js"></script>  
  <script src="/js/jquery-ui.min.js"></script> 
  <script src="/js/owl.carousel.min.js"></script>
  <script src="/js/bxSlider.js"></script>
  <script src="/js/custom.select.js"></script>
  <script src="/js/isotope.js"></script>
  <script src="/source/jquery.fancybox.js"></script>  
  <script src="/js/common/script.js"></script>
  <script>
      $(document).ready(function(){
          'use strict';
            var $container = $('.portfolio-three-colls'); 
            $container.isotope({
                itemSelector: '.portfolio-i',
                columnWidth: 520,
                rowHeight: 220
            });  
            $(".fancybox").fancybox({
              helpers:  {
                overlay : {
                locked : false
              },
              title : { type : 'over' }
              },
              beforeShow : function() {
                this.title = (this.title ? '' + this.title + '' : '')  + (this.index + 1) + ' of ' + this.group.length;
              }
            });   
          
          $('.portfolio-filters li a').on('click', function(){
            var $sort = $(this).data('sort');
            if ($sort=='all') {
              var $sort = '*';
              $container.isotope({ filter: $sort }); 
            } else {
              $container.isotope({ filter: '.'+$sort });      
            }   
            $('.portfolio-filters li').removeClass('active');    
            $(this).closest('li').addClass('active');
            return false;
          });      
      });

  </script>
<!-- \\ scripts \\ --> 
 
</body>  
</html> 