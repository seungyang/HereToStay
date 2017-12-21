
var map;
var tData;
var pName;
var addr;
var startX;
var startY;
var endX;
var endY;
var routeLayer;
var markerEndLayer;
var markerStartLayer;
var pointLayer;
var kmlForm;

function findMap()
{	
	pName = $('#na').val();
	addr = $('#ad').val();
	
	// 맵 실행
	findEndXY();
}

function findEndXY(){
	// 주소-좌표 변환 객체를 생성합니다
	 var geocoder = new daum.maps.services.Geocoder();
	 // 주소로 좌표를 검색합니다
	 geocoder.addressSearch(addr, function(result, status) {
		 // 정상적으로 검색이 완료됐으면 
		 if (status === daum.maps.services.Status.OK) {
	    	 endX = result[0].x+""; // 128.8927140865118
	    	 endY = result[0].y+""; // 37.80507889559843
    		 initMap();
    	 }
	 });
}


// 페이지가 로딩이 된 후 호출하는 함수입니다.
function initMap() {
	 var mapOptions = {
		div : 'map1'
	 };
	 if ( map != undefined){
		 map.removeLayer(markerStartLayer);
		 markerStartLayer = undefined;
		 map.removeLayer(pointLayer);
		 pointLayer = undefined;
		 routeLayer.removeFeatures(kmlForm);
		 kmlForm = undefined;
		 document.getElementById('startAddr').value="";
		 document.getElementById('roadInfo').innerHTML="";
		 document.getElementById('detailAddr').innerHTML="";
	 }else{
		 map = new Tmap.Map(mapOptions);
	 }

	// map 생성
	// Tmap.map을 이용하여, 지도가 들어갈 div, 넓이, 높이를 설정합니다.
	
	tData = new Tmap.TData();//REST API 에서 제공되는 경로, 교통정보, POI 데이터를 쉽게 처리할 수 있는 클래스입니다.

	routeLayer = new Tmap.Layer.Vector("route");
	map.addLayer(routeLayer);
	map.setCenter(new Tmap.LonLat(endX, endY).transform("EPSG:4326", "EPSG:3857"), 15);
	
	// 2. 도착
	markerEndLayer = new Tmap.Layer.Markers("end");
	map.addLayer(markerEndLayer);

	var size = new Tmap.Size(24, 38);
	var offset = new Tmap.Pixel(-(size.w / 2), -size.h);
	var icon = new Tmap.IconHtml("<img src='http://tmapapis.sktelecom.com/upload/tmap/marker/pin_r_m_e.png' />", size, offset);
	var marker_e = new Tmap.Marker(new Tmap.LonLat(endX, endY).transform("EPSG:4326", "EPSG:3857"), icon);
	markerEndLayer.addMarker(marker_e);
}

function findStartXY(){
	// 주소-좌표 변환 객체를 생성합니다
	 var geocoder = new daum.maps.services.Geocoder();
	 addr = $('#startAddr').val();
	 // 주소로 좌표를 검색합니다
	 geocoder.addressSearch(addr, function(result, status) {
		 // 정상적으로 검색이 완료됐으면 
		 if (status === daum.maps.services.Status.OK) {
	    	 startX = result[0].x+"";
	    	 startY = result[0].y+"";
	    	 initStartAddr();
    	 }
	 });
}

function initStartAddr() {
	if( markerStartLayer != undefined){
		map.removeLayer(markerStartLayer);
	}
	map.setCenter(new Tmap.LonLat(startX, startY).transform("EPSG:4326", "EPSG:3857"), 15);
	// 2. 시작
	markerStartLayer = new Tmap.Layer.Markers("start");
	map.addLayer(markerStartLayer);
	
	var size = new Tmap.Size(24, 38);
	var offset = new Tmap.Pixel(-(size.w / 2), -size.h);
	var icon = new Tmap.IconHtml("<img src='http://tmapapis.sktelecom.com/upload/tmap/marker/pin_r_m_s.png' />", size, offset);
	var marker_s = new Tmap.Marker(new Tmap.LonLat(startX, startY).transform("EPSG:4326", "EPSG:3857"), icon);
	markerStartLayer.addMarker(marker_s);
}




//daum api 주소
function daumPostCode() {
	new daum.Postcode(
	{
		oncomplete: function (data) {
            // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

            // 도로명 주소의 노출 규칙에 따라 주소를 조합한다.
            // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
            var fullRoadAddr = data.roadAddress; // 도로명 주소 변수
            var extraRoadAddr = ''; // 도로명 조합형 주소 변수

            // 법정동명이 있을 경우 추가한다. (법정리는 제외)
            // 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
            if (data.bname !== '' && /[동|로|가]$/g.test(data.bname)) {
            	extraRoadAddr += data.bname;
            }
            // 건물명이 있고, 공동주택일 경우 추가한다.
            if (data.buildingName !== '' && data.apartment === 'Y') {
            	extraRoadAddr += (extraRoadAddr !== '' ? ', '
            		+ data.buildingName : data.buildingName);
            }
            // 도로명, 지번 조합형 주소가 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
            if (extraRoadAddr !== '') {
            	extraRoadAddr = ' (' + extraRoadAddr + ')';
            }
            // 도로명, 지번 주소의 유무에 따라 해당 조합형 주소를 추가한다.
            if (fullRoadAddr !== '') {
            	fullRoadAddr += extraRoadAddr;
            }

            // 지번 주소 누락 이슈로 인하여 수정
            var jibun = data.jibunAddress == '' ? data.autoJibunAddress : data.jibunAddress;

            // 우편번호와 주소 정보를 해당 필드에 넣는다.
            document.getElementById('startAddr').value = fullRoadAddr;

            findStartXY();
            // daumGeo();
        }
    }).open();
}


function FindRoad(){
	if(document.getElementById('startAddr').value == null || document.getElementById('startAddr').value == ""){
		alert('출발지를 확인해주세요');
		return false;
	}
	
	if(startX.length==0 || startY.length==0 || endX.length==0||endY.length==0){
		alert('출발지를 확인해주세요');
		return false;
	}

//			if( kmlForm != undefined){
//				map.removeLayer(pointLayer);
//				routeLayer.removeFeatures(kmlForm);
//				document.getElementById('roadInfo').innerHTML = "";
//				document.getElementById('detailAddr').innerHTML = "";
//			}
	
	// 4. 경로 탐색 API 사용요청
	var prtcl;
	var headers = {}; 
	headers["appKey"]="12d4d445-9969-4c83-a53e-fc7c41f185b3";
	$.ajax({
		method:"POST",
		headers : headers,
		url:"https://api2.sktelecom.com/tmap/routes?version=1&format=xml",//
		async:false,
		data:{
			startX : startX,
			startY : startY,
			endX : endX,
			endY : endY,
			reqCoordType : "WGS84GEO",
			resCoordType : "EPSG3857",
			angle : "172",
			searchOption : 0
		},
		success:function(response){
			prtcl = response;
			console.log(prtcl);  

			// 5. 경로 탐색  결과 Line 그리기
			//경로 탐색  결과 POINT 찍기
			/* -------------- Geometry.Point -------------- */
			pointLayer = new Tmap.Layer.Vector("point");
			var prtclString = new XMLSerializer().serializeToString(prtcl);//xml to String	
			   xmlDoc = $.parseXML( prtclString ),
			   $xml = $( xmlDoc ),
			   $intRate = $xml.find("Placemark");
			   
			   var style_red = {
			           fillColor:"#FF0000",
			           fillOpacity:0.2,
			           strokeColor: "#FF0000",
			           strokeWidth: 3,
			           strokeDashstyle: "solid",
			           pointRadius: 2,
			           title: "this is a red line"
			      };
			   $intRate.each(function(index, element) {
			   	var nodeType = element.getElementsByTagName("tmap:nodeType")[0].childNodes[0].nodeValue;
				if(nodeType == "POINT"){
					var point = element.getElementsByTagName("coordinates")[0].childNodes[0].nodeValue.split(',');
					var geoPoint =new Tmap.Geometry.Point(point[0],point[1]);
					var pointFeature = new Tmap.Feature.Vector(geoPoint, null, style_red); 
					pointLayer.addFeatures([pointFeature]);
					
					var description = element.getElementsByTagName("description")[0].childNodes[0].nodeValue;
					var turnType = element.getElementsByTagName("tmap:turnType")[0].childNodes[0].nodeValue;
					document.getElementById('detailAddr').innerHTML += "<li> "+ description+"</li>";
					}
			   });
			map.addLayer(pointLayer);
			/* -------------- Geometry.Point -------------- */
			//경로 탐색  결과 Line 그리기
			routeLayer.style ={
					fillColor:"#FF0000",
			        fillOpacity:0.2,
			        strokeColor: "#FF0000",
			        strokeWidth: 3,
			        strokeDashstyle: "solid",
			        pointRadius: 2,
			        title: "this is a red line"	
			}
			kmlForm = new Tmap.Format.KML().read(prtcl);
			routeLayer.addFeatures(kmlForm);
			
			// 6. 경로탐색 결과 반경만큼 지도 레벨 조정
			map.zoomToExtent(routeLayer.getDataExtent());
			
			$totalDistance = xmlDoc.getElementsByTagName("tmap:totalDistance")[0].childNodes[0].nodeValue;
			$totalTime = xmlDoc.getElementsByTagName("tmap:totalTime")[0].childNodes[0].nodeValue;
			$totalFare = xmlDoc.getElementsByTagName("tmap:totalFare")[0].childNodes[0].nodeValue;
			
			// km 단위 환산
			km = mKmCalc($totalDistance);
			// 요금 , 환산
			fare = numberWithCommas($totalFare);
			// 소요시간 환산
			time  = humanReadable($totalTime);
			document.getElementById('roadInfo').innerHTML = "총 거리 : "+ km +"km  총 시간 : "+ time +"분  총 요금 : "+ fare +"원" + "<p id='hide'>접기</p>";
		},
		error:function(request,status,error){
			console.log("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
		}
	});
}

function mKmCalc(m){
	m = m.replace(/,|\s/g,''); 
	m = parseFloat(m) / 1000+"";
	return m.substring(0,6);
	
}

function numberWithCommas(x) {
    return x.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ",");
}

function humanReadable(seconds) {
	  var pad = function(x) { return (x < 10) ? "0"+x : x; }
	  return pad(parseInt(seconds / (60*60))) + "시간 " +
	         pad(parseInt(seconds / 60 % 60));
	}


$(document).on("click","#hide",function(){
	$('#detailAddr').toggle(function() {
		  $("#detailAddr").children().slideUp();
		}, function() {
		  $("#detailAddr").children().slideDown();
	});
	if( $(this).html() == '접기' ) {
	      $(this).html('펼치기');
	    }
	    else {
	      $(this).html('접기');
	    }
});


