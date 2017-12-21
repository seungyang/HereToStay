<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
   String mode = (String)request.getAttribute("mode");
%>
<jsp:include page="/WEB-INF/view/include/owner_header.jsp"></jsp:include>
<!DOCTYPE html>
<html lang="ko-KR" class="no-js">
<head>
    <title>여기없대 사장님 페이지</title>
<!--     <link rel="canonical" href="https://guest.goodchoice.kr"/> -->
    <link rel="shortcut icon" href="/favicon.ico" />
    <link href="/css/owner/bootstrap.min.css" rel="stylesheet">
    <link href="/css/owner/common.host.css" rel="stylesheet">
    <link href="/css/owner/font-awesome.min.css" rel="stylesheet">
    <link href="/css/owner/daterangepicker-bs3.css" rel="stylesheet" />
    <link href="/css/owner/bootstrap-timepicker.css" rel="stylesheet" />
    <script src="/js/owner/jquery-2.1.3.min.js"></script>
    <script src="/js/owner/jquery-ui.min.js"></script>
    <script src="/js/owner/jquery.lazyload.min.js"></script>
    <script src="/js/owner/jquery.cookie.min.js"></script>
    <script src="/js/owner/list.min.js"></script>
    <script src="/js/owner/common.host.js"></script>
    <script src="/js/owner/pension.js"></script>
    <style>
   		.menu-step4 > h1 > button {height:10px;}
    	.header-logo{margin:10px 0 0 0;}
    </style>   
</head>

<body id="main">
<section class="container">
<div class="menu-step4">
   <% if(mode.equals("apply")){%>
      	<h1>STEP 2</h1>
        <h1>펜션 검수 요청을 해주세요.</h1>
        <h3>검수 후 등록이 되면 문의하기를 통해 수정이 가능합니다</h3>
        <h1>
           <button class="btn btn-yeogi btn-submit btn-guest-room" type="button" onclick="startRoomInsert()" style="margin-right:20px;">펜션 수정</button>
           <button class="btn btn-yeogi btn-submit btn-guest-room" type="button" onclick="startRoomApply()">검수 요청</button>
        </h1>
   <% }else if (mode.equals("appling")){ %>
        <h1>STEP 3</h1>
        <h1>펜션 검수 요청 중입니다</h1>
        <h3>자세한 사항은 문의를 통해 확인하실수 있습니다.</h3>
        <h1>
           <button class="btn btn-yeogi btn-submit btn-guest-room" type="button" onclick="startRoomQna()">펜션 문의</button>
        </h1>
   <% }else if (mode.equals("success")){ %>
     	<h1>펜션 등록 완료</h1>
        <h1>펜션 수정은 문의를 통해 가능합니다. </h1>
        <h1>
           <button class="btn btn-yeogi btn-submit btn-guest-room" type="button" onclick="startRoomQna()">펜션 문의</button>
        </h1>
    <% } else {%>
        <h1>STEP 1</h1>
        <h1>펜션을 등록해주세요.</h1>
        <h1>
           <button class="btn btn-yeogi btn-submit btn-guest-room" type="button" onclick="startRoomInsert()">펜션 등록</button>
        </h1>
     <% } %>
        
        
        
        
</div>
    <div class="main-layer">
        <div class="affiliate-layer">
            <div class="not-used">
			   <a href="/owner/QnAWrite.do"><img src="/img/owner/QnA.png" alt="" style="display: block; width: 100%;"></a>
			</div>
            <div class="room-layer">
                <a><span>예약 객실 판매  ></span></a>
                <span>
                    <ul>
                        <li>${today}</li>
                        <li>${week}</li>
                        <li>${month}</li>
                    </ul>
                    <ul>
                        <li>오늘</li>
                        <li>이번주</li>
                        <li>이번달</li>
                    </ul>
                </span>
            </div>
            <div class="review-layer">
                <span>등록된 리뷰수 (총 55개) <i class="fa fa-angle-right" aria-hidden="true"></i></span>
                <span>
                    <ul>
                        <li>1</li>
                        <li>5</li>
                        <li>20</li>
                    </ul>
                    <ul>
                        <li>오늘</li>
                        <li>이번주</li>
                        <li>이번달</li>
                    </ul>
                </span>
            </div>

        </div>
        <div class="reservation-layer">
                <span class="reservation-title">입실 예정 고객 정보</span>
                <span class="date">2017. 11. 21</span>
                 <a href='/owner/Reservation.do?pageS=1'><span class="more">더보기 <i class="fa fa-angle-right" aria-hidden="true"></i></span></a>
                <table>
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
	                    		<c:when test="${reserve.size() eq 0}">
		                   			<tr>
		                   				<td class='text-center' colspan="6">예약 내역이 없습니다.</td>
		                   			</tr>
		                   		</c:when>
		                   		<c:otherwise>
			                       <c:forEach var="reserve" items="${reserve}" varStatus="status">
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
            </div>
    </div>
</section>

<jsp:include page="/WEB-INF/view/include/footer3.jsp"/>
</body>


</html>