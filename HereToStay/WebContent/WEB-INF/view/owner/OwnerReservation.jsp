<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%> 
<jsp:include page="/WEB-INF/view/include/owner_header.jsp"></jsp:include>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE html>
<html>
<head>
<title>Sparrow | Travel Agency</title>
<meta name="description" content="" />
<meta name="keywords" content="" />
<meta charset="utf-8" />
<link rel="icon" href="favicon.png" />
<meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no">
<link rel="stylesheet" href="/build/mediaelementplayer.min.css" />
<link rel="stylesheet" href="/css/jquery.formstyler.css">
</head>
<style>
body{
background:#fff;

}

#reservation {height: 149px;}
.tables tr th{text-align:center;}
.tables tr td{text-align:center;}
.table-left {width: 1100px; margin: 0 auto; float: none; height:auto; margin-bottom:40px;
;overflow-y:hidden;}
.counters {width: 1100px; margin: 0 auto;}
.progress-bars {width: 1100px; margin: 0 auto;}
.tabs {width: 1100px; margin: 0 auto;}
.pie-charts {width: 1100px; margin: 0 auto;}
.counters-five-colls .counters-row-i:last-child{float:right;}
.counters-five-colls .counters-row-i{margin-right:10%;}
.counters_wrap{padding-left:16%; width:520px; margin:0 auto;}
.counters-row-i{margin-right:20%}
.shortcodes-left{margin-bottom:80px;}
.res-title{font-size:26px;}
@media screen and (max-width: 1100px){
.table-left {width:100%;}
.counters {width:100%;}
.progress-bars{width:100%;}
.tabs {width:100%;}
.pie-charts{width:100%;}
.table-left{margin-bottom:20px;}
.tables{padding-bottom:0;}


.header-account a{
	border:none;
	padding:0;
	}
</style>

<body>
	<section id="reservation"></section>
	<div style="position:fixed; top:0px; left:0px; width:0; height:0;" id="scrollzipPoint"></div>
	<!-- // tables // -->
	<div class="tables">
		<div class="typography-heading res-title">예약리스트</div>
		<div class="shortcodes-left table-left">
			<table class="table-a light">
                    <thead>
                        <tr>
                            <th>예약번호</th>
                            <th>객실명</th>
                            <th>예약자</th>
                            <th>전화번호</th>
                            <th>체크인</th>
                            <th>체크아웃</th>
                        </tr>
                    </thead>
                    <tbody>
                    	<c:choose>
	                    		<c:when test="${listModel.size() eq 0}">
		                   			<tr>
		                   				<td class='text-center' style="text-align: center;" colspan="6">예약 내역이 없습니다.</td>
		                   			</tr>
		                   		</c:when>
		                   		<c:otherwise>
			                       <c:forEach var="reserve" items="${listModel}" varStatus="status">
				                          <tr>
				                             <td>${reserve.resId}</td>
				                             <td>${reserve.romName}</td>
				                             <td>${reserve.memName}</td>
				                             <td>${reserve.memTel}</td>
				                             <td>${reserve.resIndate}</td>
				                             <td>${reserve.resOutdate}</td>
				                          </tr>
			                       </c:forEach>	                   		
		                   		</c:otherwise>
                    		</c:choose>
                    </tbody>
                </table>
                
                <div class="clear"><br/><br/></div>
				   <div class="pagination">
				      <input id="currentPage" name="page" type="hidden" value ="1"/>
				      <c:forEach var="i" begin="1" end="${totalPage}" step="1" varStatus="status">
				         <c:choose>
				            <c:when test="${page eq status.count}">
				               <a href="/owner/Reservation.do?pageS=${i}" class="active">${i}</a>
				            </c:when>
				            <c:otherwise>
				               <a href="/owner/Reservation.do?pageS=${i}">${i}</a>
				            </c:otherwise>
				         </c:choose>
				      </c:forEach>
				
				   <div class="clear"></div>
				 </div>
			</div>
	</div>
	<!-- // tables // -->
	
<!-- 	<div class="about-us-devider fly-in"></div> -->
	
                  <!-- // counters // -->
                  <div class="counters">
                     <div class="typography-heading res-title">전체 이용자수, 총매출액</div>
                     <div class="counters-five-colls fly-in">
                        <div class="counters_wrap">
                           <div class="counters-row-i" style="width:auto;">
                              <img alt="" src="/img/counters-i-02.png" />
                              <b class="numscroller" data-slno='1' data-min='2'
                                 data-max=${listCount.resNumber } data-delay='1' data-increment="10"></b> <span>전체이용자수</span>
                           </div>
                           <div class="counters-row-i" style="width:auto;">
                              <img alt="" src="/img/counters-i-04.png" />
                              <b class="numscroller" data-slno='1' data-min='0'
                                 data-max='${listCount.restot }' data-delay='3' data-increment="10000"></b> <span>총매출액</span>
                           </div>
                        <div>
                     </div>
                     <div class="clear"></div>
                  </div>
                  </div>
                  <!-- \\ counters \\ -->
               </div>
      <div class="clear"></div>
      
      <div class="about-us-devider fly-in"></div>
      <!-- \\ progress-bars \\ -->
      <div class="progress-bars">
                     <div class="typography-heading res-title">월별 펜션 이용률</div>
                     <div class="shortcodes-left fly-in">
                        <c:forEach items="${listRate}" var="rate" begin="0" end="5">
                           <div class="about-percent">
                              <label>${rate.resOutdate}월 - ${rate.resNumber}%</label>
                              <div data-percentage="${rate.resNumber}" class="about-percent-a">
                                 <span style="width: ${rate.resNumber}%;"></span>
                              </div>
                           </div>
                        </c:forEach>      
                     </div>
                     <div class="shortcodes-right fly-in">
                           <c:forEach items="${listRate}" var="rate" begin="6" end="12">
                           <div class="about-percent">
                              <label>${rate.resOutdate}월 - ${rate.resNumber}%</label>
                              <div data-percentage="${rate.resNumber}" class="about-percent-a">
                                 <span style="width: ${rate.resNumber}%;"></span>
                              </div>
                           </div>
                           </c:forEach>
                     </div>
                  </div>
                  <div class="clear "></div>

   <!-- // scripts // -->
   <script src="/js/jquery-1.11.3.min.js"></script>
   <script src="/js/numscroller-1.0.js"></script>
   
   
   <!-- \\ scripts \\ -->
   

<jsp:include page="/WEB-INF/view/include/footer3.jsp"/>
</body>
</html>