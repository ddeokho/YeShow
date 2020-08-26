<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 
<jsp:include page="/WEB-INF/view/Top.jsp"/>
 

      <div class="section">
      <div class="container">
        <div class="row">
          <div class="col-md-12">
            <div id="fullcarousel-example" data-interval="false" class="carousel slide"
            data-ride="carousel">
              <div class="carousel-inner">
                <div class="item active">
                  <img src="http://pingendo.github.io/pingendo-bootstrap/assets/placeholder.png">
                  <div class="carousel-caption">
                    
                  </div>
                </div>
              </div>
              <a class="left carousel-control" href="#fullcarousel-example" data-slide="prev"><i class="icon-prev fa fa-angle-left"></i></a>
              <a class="right carousel-control" href="#fullcarousel-example" data-slide="next"><i class="icon-next fa fa-angle-right"></i></a>
            </div>
          </div>
        </div>
      </div>
    </div>
    <div class="section">
      <div class="container">
        <div class="row">
          <div class="col-md-6">
                <h2>${resinfo.uprestaurant }</h2> 
            <br><br>
                  
            <p>${resinfo.upmsg }</p><br>
            <a href="${resinfo.upphon}"><i class="fa fa-3x fa-mobile fa-fw"></i></a>
            <a href="http://map.daum.net/link/search/${resinfo.uplocation }"><i class="fa fa-3x fa-fw fa-map-marker"></i></a> 
            <a href="#"><i class="fa fa-3x fa-fw fa-calendar"></i></a>
          </div>
          <!-- 지도 보여주는 폼 -->
          <div class="col-md-6 text-right">
            <div id="map" style="width:200px; height:200px;"></div>
          </div>
          <!-- -------- -->
        </div>
      </div>
    </div>
    
    
  
  
  
  
    
  
   <!-- ------------------- -->
   
   
   <!-- 정보를 을 가져가는 form -- -->
   <form id="goview" name="goview" method="POST">
   
   <input type="hidden" name="upresnum" id="upresnum" value="${resinfo.upnum }">
  
   </form>
   <!-- ------------------ -->
   
   
      <div class="container">
        
           <div class="row">
          <div class="col-md-12">
            <a class="btn btn-block btn-lg btn-primary">Reservation</a>
          </div>
        </div>
        <br><br>
        
        <div class="row">
          <div class="col-md-12">
            <ul class="breadcrumb">
              <li class="active">
                <a onclick="gomenu()" >Menu</a>
              </li>
              <li>
                <a onclick="goreview()">review</a>
              </li>
              <li>
              	<a onclick="goboard()">board</a>
              </li>
              <li>
              	<a onclick="golocation()">location</a>
              </li>
            </ul>
          </div>
      </div> 
  	 
 </div>
 
<script type="text/javascript">
//메뉴 이동 스크립트
 var gomenu=function(){
	 
	 goview.action="resmenu.do";
	 goview.submit();
 }
 
 var goreview=function(){
	 
	 goview.action="resreview.do";
	 goview.submit();
 }
 
 var goboard=function(){
	 
	 goview.action="resboard.do";
	 //goview.submit();
 }

 var golocation=function(){
	 
	 goview.action="resloc.do";
	 goview.submit();
 }
 

 
</script> 
 
<!-- 다음 지도 -->
<script type="text/javascript" src="//apis.daum.net/maps/maps3.js?apikey=1869823f855a028e850ee238641d80ac&libraries=services"></script>
<script>
var mapContainer = document.getElementById('map'), // 지도를 표시할 div 
    mapOption = {
        center: new daum.maps.LatLng(33.450701, 126.570667), // 지도의 중심좌표
        level: 3 // 지도의 확대 레벨
    };  

// 지도를 생성합니다    
var map = new daum.maps.Map(mapContainer, mapOption); 

// 주소-좌표 변환 객체를 생성합니다
var geocoder = new daum.maps.services.Geocoder();

// 주소로 좌표를 검색합니다
geocoder.addr2coord('${resinfo.uplocation }', function(status, result) {

    // 정상적으로 검색이 완료됐으면 
     if (status === daum.maps.services.Status.OK) {

        var coords = new daum.maps.LatLng(result.addr[0].lat, result.addr[0].lng);

        // 결과값으로 받은 위치를 마커로 표시합니다
        var marker = new daum.maps.Marker({
            map: map,
            position: coords
        });

        // 인포윈도우로 장소에 대한 설명을 표시합니다
        var infowindow = new daum.maps.InfoWindow({
            content: '<div style="width:150px;text-align:center;padding:6px 0;">${resinfo.uprestaurant}</div>'
        });
        infowindow.open(map, marker);

        // 지도의 중심을 결과값으로 받은 위치로 이동시킵니다
        map.setCenter(coords);
    } 
});    
</script>


  
<jsp:include page="/WEB-INF/view/Foot.jsp"/>