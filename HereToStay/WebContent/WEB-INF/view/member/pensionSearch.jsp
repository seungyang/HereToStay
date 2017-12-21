<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %> 
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
 <%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html lang="en">
<head>
  <title>hereToStay | 펜션찾기</title>
  <meta name="description" content="" />
  <meta name="keywords" content="" />
  <meta charset="utf-8" /><link rel="icon" href="favicon.png" />
  <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no"> 
  <link rel="stylesheet" href="/css/jquery-ui.css">
  <link rel="stylesheet" href="/css/jquery.formstyler.css">
  <link rel="stylesheet" href="/css/style.css" />
  <link rel="stylesheet" href="/css/member/option_.css">
  <link href='http://fonts.googleapis.com/css?family=Montserrat:400,700' rel='stylesheet' type='text/css'>
  <link href='http://fonts.googleapis.com/css?family=Lora:400,400italic' rel='stylesheet' type='text/css'>    
  <link href='http://fonts.googleapis.com/css?family=Raleway:100,200,300,400,600,700,800' rel='stylesheet' type='text/css'>
  <link href='http://fonts.googleapis.com/css?family=Raleway:400,600' rel='stylesheet' type='text/css'>  <link href='http://fonts.googleapis.com/css?family=PT+Sans:400,700&amp;subset=latin,cyrillic' rel='stylesheet' type='text/css'>	
  <link href='http://fonts.googleapis.com/css?family=Lato:400,700&amp;subset=latin,latin-ext' rel='stylesheet' type='text/css'>
  <link href='http://fonts.googleapis.com/css?family=Open+Sans:400,600,700&amp;subset=latin,cyrillic' rel='stylesheet' type='text/css'>
<!-- // scripts // -->
<!--   <script src="/js/jquery-1.11.3.min.js"></script> -->
<script src="/js/jquery-1.7.1.js" type="text/javascript"></script>
  <script src="/js/jqeury.appear.js"></script>  
  <script src="/js/jquery-ui.min.js"></script> 
  <script src="/js/jquery.formstyler.js"></script>  
  <script src="/js/owl.carousel.min.js"></script>
  <script src="/js/bxSlider.js"></script>
  <script src="/js/custom.select.js"></script>
  <script type="text/javascript" src="/js/twitterfeed.js"></script>
  <script src="/js/script.js"></script>
  <!-- script -->
<style type="text/css">
#mtwrapper {
    padding-bottom: 110px;
    padding-top: 0px;
}
#breadcrumbs_inner {
    margin-bottom: 50px;
}
</style>
</head>  

<body style="background-color:white">  
<jsp:include page="/WEB-INF/view/include/header.jsp"/>
<!-- // authorize // -->
	
<form id='fr'>
<!-- main-cont -->
<div class="main-cont">
   <!-- 해당 페이지 설명 start -->
   <div class="inner-page">
      <div class="inner-breadcrumbs" id='breadcrumbs_inner'>
         <div class="content-wrapper">
            <div class="page-title"><b>펜션 - 펜션찾기</b></div>
            <div class="breadcrumbs">
                 <a href="/member/index_member.do">Home</a> / <span>펜션찾기</span>
               </div>
               <div class="clear"></div>
            </div>      
      </div>
   </div>
   <!-- 해당 페이지 설명 end -->
  <div class="body-wrapper" id='mtwrapper'>
    <div class="wrapper-padding">
    
    
    <div class="two-colls">
      <div class="two-colls-left">
        
        <div class="srch-results-lbl fly-in" style="border:solid 1px #808080;">
          <span>${result} results found.</span>
        </div>
        
        <div class="side-block fly-in" style="border:solid 1px #808080;">
          <div class="side-block-search">
            <div class="page-search-p">
						<!-- // -->
						<div class="srch-tab-line">
							<label>장소 / 펜션 이름</label>
							<c:choose>
							<c:when test='${sessionScope.search.searchName ne null }'>
							<div class="input-a"><input name='place' type="text" value="${sessionScope.search.searchName }" placeholder="ex)풀빌라"></div>
							</c:when>
							<c:otherwise>
							<div class="input-a"><input name='place' type="text" placeholder="ex)풀빌라"></div>
							</c:otherwise>							
							</c:choose>
						</div>
						<!-- // -->
						<!-- // -->
						<div class="srch-tab-line">
							<div class="srch-tab-left">
								<label>Check in</label>
								<c:choose>
								<c:when test='${sessionScope.search.checkIn ne null }'>
								<div class="input-a"><input id='in' name='in' type="text" value="${sessionScope.search.checkIn}" class="date-inpt" placeholder="mm/dd/yy"> <span class="date-icon"></span></div>
								</c:when>
								<c:otherwise>
								<div class="input-a"><input id='in' name='in' type="text" value="" class="date-inpt" placeholder="mm/dd/yy"> <span class="date-icon"></span></div>
								<script>
								var today= new Date();
								var month=today.getMonth()+1;
								var date =today.getDate();
								if((""+month).length ==1)
									month = "0" + month;
								if((""+date).length ==1)
									date = "0" + date;
								var day= month+"/"+date+"/"+today.getFullYear();
								$("#in").val(day);
								</script>
								</c:otherwise>
								</c:choose>	
							</div>
							<div class="srch-tab-right">
								<label>Check out</label>
								<c:choose>
								<c:when test='${sessionScope.search.checkOut ne null }'>
								<div class="input-a"><input id='out' name='out' type="text" value="${sessionScope.search.checkOut}" class="date-inpt" placeholder="mm/dd/yy"> <span class="date-icon"></span></div>	
								</c:when>
								<c:otherwise>
								<div class="input-a"><input id='out' name='out' type="text" value="" class="date-inpt" placeholder="mm/dd/yy"> <span class="date-icon"></span></div>	
								<script>
								var tomorrow= new Date();
								tomorrow.setDate(tomorrow.getDate()+1);
								var tmonth=tomorrow.getMonth()+1;
								var tdate =tomorrow.getDate();
								if((""+tmonth).length ==1)
									tmonth = "0" + tmonth;
								if((""+tdate).length ==1)
									tdate = "0" + tdate;
								var day2= tmonth+"/"+tdate+"/"+tomorrow.getFullYear();
								$("#out").val(day2);
								</script>
								</c:otherwise>
								</c:choose>
							</div>
							<div class="clear"></div>
						</div> 
						<!-- \\ -->
						<!-- // --> 
						<div class="srch-tab-line no-margin-bottom">
							<div class="srch-tab-3c">
								<label>인원수</label>
								<div class="select-wrapper">
								<select name = 'sel' class="custom-select">
								<c:forEach var='i' begin='2' end='20' step='1'>
								<c:set var='val' value='${i}'/>
								<c:choose>
								<c:when test='${sessionScope.search.persons ne null }'>
									<c:choose>
									<c:when test ='${sessionScope.search.persons eq val}'>
									<option selected="selected">${i}</option>
									</c:when>
									<c:otherwise><option value='${i}'>${i}</option></c:otherwise>
									</c:choose>
								</c:when>
								<c:otherwise><option value='${i}'>${i}</option></c:otherwise>
								</c:choose>
								</c:forEach>

								</select>
								</div>
							</div>
						
							<div class="clear"></div>
						</div>
						<!-- \\ -->
              <input type="button" class="srch-btn" id='srch-btn' value='검색'></input> 
    					</div>        
          </div>          
        </div>
        
        <!-- // side // -->
        <div class="side-block fly-in" style="border:solid 1px #808080;">
          <div class="side-price">
            <div class="side-padding">
              <div class="side-lbl">가격</div>
              <div class="price-ranger">
                <div id="slider-range"></div>              
              </div>
              <div class="price-ammounts"> 
             <input type="text" name='ammount-from' id="ammount-from" readonly>
               <input type="text" name='ammount-to' id="ammount-to" readonly>                           
                <div class="clear"></div>
              </div>              
            </div>
          </div>  
        </div>
        <!-- \\ side \\ -->
        <!-- // side // -->

        <!-- \\ side \\ -->
        <!-- // side // -->
        <div class="side-block fly-in" style="border:solid 1px #808080;">
          <div class="side-stars">
            <div class="side-padding">
              <div class="side-lbl">펜션  옵션</div>
              <div class="checkbox">
                <label>                
                  <input name='penOpt' type="checkbox" value="BBQ" id='bbq'/>
                   BBQ 
                </label>&emsp;&emsp;&emsp;&emsp;&emsp;&ensp;&nbsp;
          	   <label>
                  <input name='penOpt' type="checkbox" value="카페" id='cafe'/>
                   	카페
                </label>
              </div>             
              <div class="checkbox">
                <label>
                  <input name='penOpt' type="checkbox" value="레스토랑" id='res' />
                  레스토랑 
                </label>&emsp;&emsp;&emsp;&emsp;&nbsp;
                   <label>
                  <input name='penOpt' type="checkbox" value="수영장" id='swim' />
                  수영장
                </label>
              </div>              
              <div class="checkbox">
                <label>
                  <input name='penOpt' type="checkbox" value="족구장" id='sport'/>
                 족구장 
                </label>&emsp;&emsp;&emsp;&emsp;&ensp;&ensp;
                <label>
                  <input name='penOpt' type="checkbox" value="갯벌체험" id='gb' />
                  갯벌 체험
                </label>
              </div>
             <div class="checkbox">
                <label>
                  <input name='penOpt' type="checkbox" value="바다낚시" id='nak' />
                  바다낚시
                </label> &emsp;&emsp;&emsp;&ensp;&ensp;&nbsp;
                  <label>
                  <input name='penOpt' type="checkbox" value="무료주차" id='free'/>
               무료주차
                </label>
              </div>           
              <div class="checkbox">
                <label>
                  <input name='penOpt' type="checkbox" value="반려견동반" id='animal' />
                  반려견동반 
                </label>
              </div>
            
           <script type="text/javascript">               
              var penOpt= document.getElementsByName('penOpt');
              <c:if test='${sessionScope.search.penOpt ne null}'>
              <c:forEach var ="j" begin="1" end="9" step="1">
              <c:forEach var ="i" begin ="1" end="${fn:length(sessionScope.search.penOpt)}" step="1">
               	 var imsi=Number(${j})-1;	 
              	  sessOpt ='${sessionScope.search.penOpt[i-1]}';
               	  if(sessOpt== penOpt[imsi].value)
               	  {
               		$("#"+penOpt[imsi].id).attr("checked","checked");
               	  }               	  				
              </c:forEach>
              </c:forEach>
              </c:if>            
              </script>           
            </div>
          </div>  
        </div>
        <!-- \\ side \\ -->
        <!-- // side // -->
        <div class="side-block fly-in" style="border:solid 1px #808080"  >
          <div class="side-stars">
            <div class="side-padding">
              <div class="side-lbl">룸 옵션</div>  
              <div class="checkbox r_option">
                <label>
                  <input type="checkbox" name="romOpt" value="침대" id='bed'/>침대</label>
                   <label class="tv">
                  <input type="checkbox" name="romOpt" value="TV"  id='TV'/>TV</label>
                  <label>
                  <input type="checkbox" name="romOpt" value="냉장고" id='ref' />냉장고</label>
              </div>      
               <div class="checkbox r_option">
                <label>
                  <input type="checkbox" name="romOpt" value="쇼파" id='sofa'/>쇼파</label>
                   <label>
                  <input type="checkbox" name="romOpt" value="옷장" id='clo' />옷장</label>
                  <label>
                  <input type="checkbox" name="romOpt"  value="화장대" id='makeup' />화장대</label>
              </div>   
             <div class="checkbox r_option">
                <label class="cook">
                  <input type="checkbox" name="romOpt" value="전기밥솥"  id='cook'/>전기밥솥</label>
                   <label class="rain">
                  <input type="checkbox" name="romOpt" value="전자레인지" id='rain' />전자레인지</label>
                  <label>
                  <input type="checkbox" name="romOpt" value="인덕션" id='induk' />인덕션</label>
              </div>                                       
              <div class="checkbox r_option">
                <label class="gas">
                  <input type="checkbox" name="romOpt" value="가스레인지" id='gas' />가스레인지</label>
                <label class="fire">
                  <input type="checkbox" name="romOpt" value="취사도구" id='fire' />취사도구</label>
                <label>
                  <input type="checkbox" name="romOpt" value="커피포트" id='coffe' />커피포트</label>
              </div>
                  <div class="checkbox">
                <label>
                  <input type="checkbox" name="romOpt" value="헤어드라이기" id='hair' />헤어드라이기</label>
                <label class="water">
                  <input type="checkbox" name="romOpt" value="정수기" id='water'/>정수기</label>
                <label>
                  <input type="checkbox" name="romOpt" value="욕실용품" id='bath' />욕실용품</label>
              </div>
   			<div class="checkbox">
                <label>
                  <input type="checkbox" name="romOpt" value="스파" id='spa' />스파</label>           
              </div>    
                <script type="text/javascript">            
              var romOpt= document.getElementsByName('romOpt');   
          
              <c:if test='${sessionScope.search.roomOpt ne null}'>
              <c:forEach var ="j" begin="1" end="16" step="1">
              <c:forEach var ="i" begin ="1" end="${fn:length(sessionScope.search.roomOpt)}" step="1">
            	 var imsi=Number(${j})-1 ;            
             	  sessOpt ='${sessionScope.search.roomOpt[i-1]}';
              	  if(sessOpt== romOpt[imsi].value)
              	  {
              		$("#"+romOpt[imsi].id).attr("checked","checked");
              	  }                	  				
              </c:forEach>
              </c:forEach>
              </c:if>       
              </script>                
            </div>
          </div>  
        </div>
        <!-- \\ side \\ -->
        
      </div>
      <div class="two-colls-right"  >
        <div class="two-colls-right-b"  >
          <div class="padding">  
          
            <div class="catalog-head large fly-in" style="border:solid 1px #808080">
              <label>정렬:</label>

<input type="hidden" name='sort' id='sort' />
<script>
$('#sort').val("${sessionScope.search.sort}");
</script>
<c:if test="${sessionScope.search.sort eq '높은 별점순'}">
<style>
#highStar{background:#63b2c8; color:#fff;}
</style>
</c:if>
<c:if test="${sessionScope.search.sort eq '리뷰 많은순'}">
<style>
#highReviews{background:#63b2c8; color:#fff;}
</style>
</c:if>
<c:if test="${sessionScope.search.sort eq '높은 가격순'}">
<style>
#highPrice{background:#63b2c8; color:#fff;}
</style>
</c:if>
<c:if test="${sessionScope.search.sort eq '낮은 가격순'}">
<style>
#lowPrice{background:#63b2c8; color:#fff;}
</style>
</c:if>
              <div class="search-select">
              <input id ='highStar' type ='text' class='sort' value='높은 별점순' readonly/>
    					</div>
    			
              <div class="search-select">
    		 <input id='highReviews'type ='text' class='sort' value='리뷰 많은순'  readonly/>
    					</div>
              <div class="search-select">
    		  <input id='highPrice' type ='text' class='sort' value='높은 가격순'  readonly/>
    					</div>
    		  <div class="search-select">
    		  <input id='lowPrice' type ='text' class='sort' value='낮은 가격순'  readonly/>
    					</div>
<!--               <a href="#" class="show-list"></a>               -->
<!--               <a href="#" class="show-table"></a> -->
<!--               <a href="#" class="show-thumbs chosen"></a>  -->
              <div class="clear"></div>
            </div>
            <div class="catalog-row list-rows">
             <c:choose>
              <c:when test="${not empty List}">
         	  <c:forEach var="i" begin="1" end="${fn:length(List)}" step="1"  >
                <div class="cat-list-item fly-in" style="border:solid #d3d3d3" >
                  <div class="cat-list-item-l">
                      <a href="/member/pensionDetail.do?id=${List[i-1].penId}"><img src="/uploadPhoto/${List[i-1].phothList[0].fullname}"></a>
                  </div>
                  <div class="cat-list-item-r">
                    <div class="cat-list-item-rb">
                      <div class="cat-list-item-p">
                        <div class="cat-list-content">
                          <div class="cat-list-content-a">
                            <div class="cat-list-content-l">
                              <div class="cat-list-content-lb">
                                <div class="cat-list-content-lpadding">
                                  <div class="offer-slider-link"><a href="/member/pensionDetail.do?id=${List[i-1].penId}"> ${List[i-1].penName}</a></div>
                                  <div class="offer-slider-location">${List[i-1].penAddr2} </div>
                                  <c:choose>
                                  <c:when test="${fn:length(List[i-1].penIntro) ge 50}">
                                  <p>${fn:substring(List[i-1].penIntro,0,50)}...</p>
                                  </c:when>
                                  <c:otherwise>
                                  <p>${List[i-1].penIntro}</p>
                                  </c:otherwise>
                                  </c:choose>  
                                  <div class="pen_icons pen_op">
                                  <c:if test="${fn:contains(List[i-1].penOpt,'BBQ')}">
  								    <span class="pen_opt kitchen"></span>
                                </c:if>
                                 <c:if test="${fn:contains(List[i-1].penOpt,'카페')}">
  								 <span class="pen_opt bar"></span>
  								</c:if>
  								 <c:if test="${fn:contains(List[i-1].penOpt,'레스토랑')}">
  								 <span class="pen_opt restourant"></span>
  								</c:if>
  								 <c:if test="${fn:contains(List[i-1].penOpt,'수영장')}">
  								 <span class="pen_opt pool"></span>
  								</c:if>
  								 <c:if test="${fn:contains(List[i-1].penOpt,'족구장')}">
  								 <span class="pen_opt play-place"></span>
  								</c:if>
  								<c:if test="${fn:contains(List[i-1].penOpt,'갯벌체험')}">
  								 <span class="pen_opt get"></span>
  								</c:if>
  								<c:if test="${fn:contains(List[i-1].penOpt,'바다낚시')}">
  								 <span class="pen_opt entertaiment"></span>
  								</c:if>
  								<c:if test="${fn:contains(List[i-1].penOpt,'무료주차')}">
  								 <span class="pen_opt parking"></span>
  								</c:if>
  								<c:if test="${fn:contains(List[i-1].penOpt,'무료주차')}">
  								 <span class="pen_opt pets"></span>
  								</c:if>
                                    <div class="clear"></div>
                                  </div>
                                </div>
                              </div>
                              <br class="clear" />
                            </div>
                          </div>
                          <div class="cat-list-content-r">
                            <div class="cat-list-content-p">
                              <nav class="stars">
            										<ul>
            										<c:forEach var="k" begin="1" end="5" step="1">            
            										<c:choose>
            										<c:when test="${k le List[i-1].avgStar}">
            											<li><a href="#"><img alt="" src="/img/star-b.png" /></a></li>
            										</c:when>
            										<c:otherwise>
            											<li><a href="#"><img alt="" src="/img/star-a.png" /></a></li>
            										</c:otherwise>
            										</c:choose>
            										</c:forEach>
            										</ul>
            										<div class="clear"></div>
            									</nav>
                              <div class="cat-list-review">${List[i-1].revCnt} reviews</div>
                              <div class="offer-slider-r">
                              <fmt:formatNumber var='Cost' value="${List[i-1].minCost}" type="number"/>
											<b id='co'>￦ ${Cost} 원</b>
              									<span>avg/night </span>
              								</div>           
                              <a href='/member/pensionDetail.do?id=${List[i-1].penId}' class="cat-list-btn">예약하기</a>   
                            </div>
                          </div>
                          <div class="clear"></div>
                        </div>
                      </div>
                    </div>
                    <br class="clear" />
                  </div>
                  <div class="clear"> </div>
                </div>
                </c:forEach>
              <!-- \\ -->
        
              <!-- \\ -->
              </c:when>
              <c:otherwise>
              <div><img style="width:350px" src='/img/member/failPension.gif'></div>
              <div class='clear'></div>
              검색된 펜션이 없습니다.. 다른 조건으로 검색해주세요.
              </c:otherwise>
              </c:choose>
              
            </div>
            
            <div class="clear">  </div>
            
            <div class="pagination">
            
            <input id="currentPage" name="page" type="hidden" value ="1"/>  
            
            <c:forEach var="i" begin="1" end="${totalPage}" step="1">            
               <c:choose>
               <c:when test="${currentPage eq i}">
               <a id = 'paging' style="cursor:pointer" class="paging active">${i}</a>
               </c:when> 
               <c:otherwise>
                <a id = 'paging' style="cursor:pointer" class="paging">${i}</a>
               </c:otherwise>
               </c:choose>             
              </c:forEach>
              <div class="clear"> </div>
            </div>            
          </div> 
        </div>
        <br class="clear" />
      </div>
    </div>
    <div class="clear"></div>
    </div>
   </div>
</div>
<script>
  	$(document).ready(function(){
		'use strict';
// 		(function($) {
// 			$(function() {
// 				$('.side-block input').styler({
// 					selectSearch: true
// 				});
// 			});
// 		})(jQuery);
		
		var slider_range = $("#slider-range");
		var ammount_from = $("#ammount-from");
		var ammount_to = $("#ammount-to");
		var from='50000';
		var to=Number('300000');
		
		<c:if test='${sessionScope.search.priceFrom ne null}'>
		from =('${sessionScope.search.priceFrom}').toString();
  		</c:if>
		<c:if test='${sessionScope.search.priceTo ne null}'>
		to =Number('${sessionScope.search.priceTo}');
		</c:if>	
		
		$(function() {
			slider_range.slider({
			  range: true,
			  min: 0,
			  max: 500000,
			  step:10000, 
			  values: [from,to],
			  slide: function( event, ui ) {
				ammount_from.val(ui.values[0]);
				ammount_to.val(ui.values[1]);
			  }
			});
			ammount_from.val(slider_range.slider("values",0));
			ammount_to.val(slider_range.slider("values",1));
		}); 
  	}); 
  	
  	
  	$("#srch-btn").click(function(){

		var In =$('#in').val();
		var InYY= In.substring(6,10);
		var InMM=In.substring(0,2);
		if(InMM.substring(0,1)=='0')
			InMM=InMM.substring(1,2);
		var InDD =In.substring(3,5);
		if(InDD.substring(0,1)=='0')
			InDD=InDD.substring(1,2);
		
		var Out =$('#out').val();
		var OutYY= Out.substring(6,10);
		var OutMM=Out.substring(0,2);
		if(OutMM.substring(0,1)=='0')
			OutMM=OutMM.substring(1,2);
		var OutDD =Out.substring(3,5);
		if(OutDD.substring(0,1)=='0')
			OutDD=OutDD.substring(1,2);
				
  		var InDate =new Date(InYY,InMM-1,InDD);
  		var OutDate = new Date(OutYY,OutMM-1,OutDD);
  		
  		var today=new Date();
  		var compareToday= new Date(today.getFullYear(),today.getMonth(),today.getDate());
  		
  		if(InDate.getTime()<compareToday.getTime())
  		{
  			alert('오늘 이 전 날짜를 선택할 수 없습니다.');
  			return;
  		}
  		
		if(InDate.getTime()>=OutDate){
		
			alert("checkIn 날짜는 checkOut날짜와 같거나 클 수 없습니다. 다시 입력해주세요");
			return;
		}
		
		var gap= (OutDate.getTime()-InDate.getTime())/1000/60/60/24;
		
		if(gap>=10){
			alert('10일 이상은 예약이 불가합니다.');
			return;
		}
		$("#currentPage").val("1");
		$("#fr").submit();  		
	
  	});
  	
  	
  	$(".paging").each(function(){
  		$(this).click(function(){
  			
  			
  			var begin=(Number($(this).text())-1)*6+1;
  			var end=Number(begin)+6;
  			
  			  	
  			$("#currentPage").val($(this).text());
  			$("#fr").submit();
  		
  			
  		});
  		
  	});
  	
  	$('.sort').click(function(){
  		
  		if($(this).css('background-color')=='rgb(99, 178, 200)')
  			$('#sort').val("");
  		else{
  			$('#sort').val($(this).val());
  		}
  		
  		$("#currentPage").val("1");
  		$("#fr").submit();

  	});
  	
  </script>


<input type ="hidden" name='opt' value='what'/>
</form>
<!-- /main-cont -->


<jsp:include page="/WEB-INF/view/include/footer.jsp"/>

  
  <style>
  .srch-btn {
    cursor: pointer;
    font-family: 'Montserrat';
    font-size: 11px;
    font-weight: normal;
    padding-top: 2px;
    float: none;
    margin-top: 21px;
    height: 34px;
    }
   
   #co{
    font-size: 15px;}
    
    .sort {
    padding-top: 9px;
    padding-bottom: 8px;
    color: #8a8a8a;
    background-position: 80% center;
    background-repeat: no-repeat;  
    cursor: pointer;
    border: 0px;
    border-radius: 0;
    font-size: 11px;
    padding: 7px 0px 8px 4px;
    outline: medium none;
    width: 117%;
    -webkit-appearance: none;
    -o-appearance: none;
    -khtml-appearance: none;
    appearance: none;
    text-transform: uppercase;
    font-family: 'Raleway';
}
.r_option > label{
	margin-right:44px;
}

.r_option > label:last-child{
	margin-right:0;
}
.r_option .tv{margin-right:51px;}
.r_option .cook{margin-right:22px;}
.r_option .fire{margin-right:19px}
.r_option .rain,
.r_option .gas{margin-right:11px;}
.water{margin-right:30px;}

    </style>
<!-- \\ scripts \\ --> 
</body>  
</html> 