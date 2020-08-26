<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 
<jsp:include page="/WEB-INF/view/Top.jsp"/>

<style>
	#detailImg {

   height: 400px;
   width: 700px;

}

	#th2 {
		height: 300px;
	}
</style> 

<div class="section">
     
<!-- 댓글 삭제 폼 -->           
 <form name="godelReview" id="godelReview" method="POST">
 <input type="hidden" id="delReview" name="delReview">
 <input type="hidden" name="upresnum" id="upresnum" value="${detailRes.upnum }">
 </form>           

<!-- 상세정보 및 수정 삭제 -->
<form id="main" name="main"  method="POST">
 	<input type="hidden" name="updel" id="updel" value="${detailRes.upnum }">
 	<input type="hidden" name="Rreupnum" id="Rreupnum" value="${detailRes.upnum }">
</form>
<!-- ----- --> 

<!-- 메뉴 삭제 -->
<form id="godelmenu" name="godelmenu" method="POST">
	<input type="hidden" name="menudel" id="menudel">
	<input type="hidden" name="upresnum2" id="upresnum2" value="${detailRes.upnum }">
</form>     
<!-- ----- -->

<!-- 테이블 삭제 -->
<form id="deltable" name="deltable" method="POST" action="deltable.do">
	<input type="hidden" name="TableDelnum" id="TableDelnum" value="${detailRes.upnum }">	
</form>

<!-- ----- --> 

     
       <div class="container">
        <div class="row">
          <div class="col-md-8 col-md-offset-2">
            <div id="myfile" class="carousel slide" data-ride="carousel" data-interval="6000">
	
		<!-- Indicator : 사진 목록 표시자 -->
		<ol class="carousel-indicators">
		<c:forEach var="i" items="${image }" varStatus="st">
			<li data-target="#myfile" data-slide-to="${st.count}" class=" <c:if test="${st.index eq 0 }"> active</c:if> "></li>
		</c:forEach>
		</ol>
		<!-- 이미지들 전체를 감싸는 div요소에
			클래스로 .carousel-inner 지정
			role="listbox"로 지정
			이미지를 감싸는 div 요소에는 클래스 .item을 지정한다.
		 -->
		
		<div class="carousel-inner" role="listbox">
			<c:forEach var="i" items="${image}" varStatus="stt">
				<div class="item <c:if test="${stt.index eq 0 }"> active </c:if>"><img id="detailImg" src="${pageContext.request.contextPath}/restaurant/Upload/${i.upiname}" alt="${stt.count }"></div>
			</c:forEach>																								
		</div>
              <a class="left carousel-control" href="#myfile" data-slide="prev"><i class="icon-prev  fa fa-angle-left"></i></a>
              <a class="right carousel-control" href="#myfile" data-slide="next"><i class="icon-next fa fa-angle-right"></i></a>
            </div>
          </div>
        </div>
      </div>
    </div>
    <div class="section">
      <div class="container">
        <div class="row">
          <div class="col-md-3">
                

            <!-- 아이콘 보여주기 -->
            
            <c:if test="${loginUser.idx==detailRes.idx or loginUser.status==3 }">  
            	<a onclick="redetail()"><i class="fa fa-3x fa-fw fa-pencil-square-o"></i></a>&nbsp&nbsp
            </c:if>
            <c:if test="${loginUser.idx!=detailRes.idx and loginUser.status!=3 }">  
            	<a ><i class="fa fa-3x fa-fw fa-pencil-square-o"></i></a>&nbsp&nbsp
            </c:if>	
            	
            <a href="http://map.daum.net/link/search/${detailRes.uplocation }"><i class="fa fa-3x fa-fw fa-map-marker"></i></a>&nbsp&nbsp
           
            <a href="#"><i class="fa fa-3x fa-fw fa-share-alt"></i></a>&nbsp&nbsp
            
            <c:if test="${loginUser.idx==detailRes.idx or loginUser.status==3 }">  
            	<a onclick="del('${detailRes.upnum}')"><i class="fa fa-3x fa-fw -square fa-times"></i></a><br>
            </c:if>
            <c:if test="${loginUser.idx!=detailRes.idx and loginUser.status!=3 }">  
            	<a><i class="fa fa-3x fa-fw -square fa-times"></i></a><br>
            </c:if>
            
            <h2>${detailRes.uprestaurant }</h2> 
            
            <br><br>
            <p>${detailRes.upmsg }</p><br>
            <!-- 별점 및 별 보여주기 -->
           
          </div>
          
         <!-- 정보 상세설명 --> 
           <div class="col-md-6">
              <table class="table ">
              <thead>
                <tr>
                  <th width="18%">매장 번호 </th><th>${detailRes.upphon }</th>
                </tr>
                <tr>  
                  <th>영업 시간</th><th>${detailRes.upbusiness }</th>
                </tr>
                <tr>  
                  <th>휴 무 일</th><th>${detailRes.uprest }</th>
                </tr>
                <tr>  
                  <th>주 소</th><th>${detailRes.uplocation }</th>
                </tr>
                <tr>  
                  <th>수용 인원</th><th>${detailRes.upaccept } 명</th>
                </tr>
              </thead>
            </table> 
            
            <table class="table">
            <thead>
            	  <tr>  
                  <th>테 이 블</th>
                <!-- 테이블 정보를 보여준다. -->  
                  <c:forEach var="ta" items="${tableq }">
                  	<th >${ta.tableuser }인용: ${ta.tnumber }개 </th>
                  </c:forEach>
                  
                 <c:if test="${loginUser.idx==detailRes.idx or loginUser.status==3 }">    
                  	<th width="5%"><a onclick="delTable()"><i class="fa fa-1x fa-fw -square fa-times"></a></th>
                 </c:if>
                
                <!-- -------------- -->
                </tr>
            </thead>
            </table>
          
 
          </div>
          <!-- 지도 보여주는 폼 -->
          <div class="col-md-3 text-right">
          	
            <div id="map" style="width:250px; height:250px;"></div><br>
            
          </div>
          
        </div>
        
        
        <!-- 테이블 등록 -->
        
     <c:if test="${loginUser.idx==detailRes.idx}">   
         <div class="row">
          <div class="col-md-12">
            <form class="form-horizontal" role="form" name="tableup" id="tableup" method="POST" action="uptable.do">
              <div class="form-group">
                <div class="col-sm-1">
                  <label for="inputEmail3" class="control-label">테이블</label>
                </div>
                <div class="col-sm-1">
                  <input type="text" class="form-control" id="tableuser" name="tableuser">
                  <input type="hidden" class="form-control" id="idx" name="idx" value="${detailRes.idx }">
                  <input type="hidden" class="form-control" id="upnum" name="upnum" value="${detailRes.upnum }">
                  <input type="hidden" class="form-control" id="upresnum3" name="upresnum3" value="${detailRes.upnum }">
                </div>
                <div class="col-sm-1">
                  <label for="inputEmail3" class="control-label" >인용 ,</label>
                </div>
                <div class="col-sm-1">
                  <input type="text" class="form-control" id="quantity" name="quantity">
                </div>
                <div class="col-sm-1">
                  <label for="inputEmail3" class="control-label" >개</label>
                </div>
                <div class="col-sm-1 text-right">
                  <a class="btn btn-default" onclick="gotable()">Table upload</a>
                </div>
                <div class="col-sm-6 text-right">
                  <label for="inputEmail3" class="control-label" >(준비시간이 있을 경우에 따로 시간을 나누어 테이블를 등록하시면 됩니다.)</label>
                </div>
               </div> 
                
                <!-- 오픈1 -->
                <div class="form-group"> 
                 <div class="col-sm-1">
                  <label for="inputEmail3" class="control-label" >오픈1</label>
                </div>
                <div class="col-sm-2">
                  <input type="time" class="form-control" id="opentime1" name="opentime1">
                </div>
                
                 <div class="col-sm-1">
                  <label for="inputEmail3" class="control-label" >마감1</label>
                </div>
                <div class="col-sm-2">
                  <input type="time" class="form-control" id="closetime1" name="closetime1">
                </div>
                
                <!-- 오픈2 -->
                <!-- <div class="col-sm-1">
                  <label for="inputEmail3" class="control-label" >오픈2</label>
                </div> -->
                <div class="col-sm-2">
                  <input type="hidden" class="form-control" id="opentime2" name="opentime2">
                </div>
                
               <!--   <div class="col-sm-1">
                  <label for="inputEmail3" class="control-label" >마감2</label>
                </div> -->
                <div class="col-sm-2">
                  <input type="hidden" class="form-control" id="closetime2" name="closetime2">
                </div>
               

             </div>
            </form>
          </div>
        </div>
        </c:if>
        <!-- --------------- -->
      </div>
    </div>
    



 <!-- 예약 버튼 ---------------------------- -->  
    <div class="section">
      <div class="container">
        
         <c:if test="${loginUser!=null}">  
         <div class="row">
          <div class="col-md-12">
            <a class="btn btn-block btn-lg btn-primary" href="fcal.do?upnum=${detailRes.upnum }">Reservation</a>
          </div>
        </div>
        </c:if>
        <br><br>
        
  <!-- -------------------------------- -->      
        
        
        <div class="row">
          <div class="col-md-12">
	            <ul class="breadcrumb">
	              <li >
	                <a href="resdetail.do?upnum=${detailRes.upnum }#session1" >Menu</a>
	              </li>
	              <li>
	                <a href="resdetail.do?upnum=${detailRes.upnum }#session2">Review</a>
	              </li>
	            </ul>
          </div>
      </div> 
 
 
      
 <!-- 메뉴 보여주기------------------ -->     
      <div class="row" id="session1">
	       	<c:forEach var="m" items="${menu }">
	          <div class="col-md-3">
	            <div id="th2" class="thumbnail">
	              <img width="100" height="200" src="${pageContext.request.contextPath}/restaurant/Upload/${m.menuimage}" class="img-responsive">
	              <div class="caption">
	                <h3>${m.menuname }</h3>
	                <p>${m.menuinfo }<br><br>
	                <i class="fa fa-1x fa-fw fa-krw"></i>${m.menuprice }
	                
	                
	             <c:if test="${loginUser.idx==detailRes.idx or loginUser.status==3 }">   
	                <a onclick="delmenu('${m.menunum}')"><i class="fa fa-1x fa-fw -square fa-times"></i></a>
	             </c:if>   
	                
	                </p>
	                
	              </div>
	              
	            </div>
	            
	         </div>
	         </c:forEach>
	  <!--  -->
<!-- ------------------------- -->       
	   </div>
<!-- 메뉴 등록 폼 -->	   
	<c:if test="${loginUser.idx==detailRes.idx}">   
	 <div class="col-md-12">
          <form class="form-horizontal" role="form"  method="POST" enctype="multipart/form-data"  id="upmenus" name="upmenus" action="resupmenu.do">

            <div class="form-group">
              <div class="col-sm-2">
                <label for="inputEmail3" class="control-label">음식
                  <br>
                </label>
              </div>
              <div class="col-sm-10">
                <input type="text" class="form-control" id="menuname" name="menuname" placeholder="메뉴 이름">
              </div>
            </div>
            <div class="form-group">
              <div class="col-sm-2">
                <label for="inputPassword3" class="control-label">음식 정보</label>
              </div>
              <div class="col-sm-10">
                <input type="text" class="form-control" id="menuinfo" name="menuinfo" placeholder="메뉴소개">
              </div>
            </div>
            <div class="form-group">
              <div class="col-sm-2">
                <label class="control-label">가격</label>
              </div>
              <div class="col-sm-10">
                <input type="text" class="form-control" id="menuprice" name="menuprice" placeholder="메뉴가격">
              </div>
            </div>
            <div class="form-group">
              <div class="col-sm-2">
                <label class="control-label">메뉴사진</label>
              </div>
              <div class="col-sm-10">
                <input type="file" id="menuimg" name="menuimg">
              </div>
            </div>
            <div class="form-group">
              <div class="col-sm-10 col-sm-offset-2 text-right">
                <button type="submit" class="btn btn-default" onclick="upmenu()">menu upload</button>
              </div>
            </div>
            
            
                    
               <!-- 나머지 정보- -->
              <div class="col-sm-10">
                <input type="hidden" class="form-control" id="upnum" name="upnum" value="${detailRes.upnum }">
                <input type="hidden" class="form-control" id="idx" name="idx" value="${detailRes.idx }">
              </div>
              <!-- ---- -->
              
              
          </form>
        </div>
        </c:if>
 	</div>
 	
 	<br>
 	
<!-- 리뷰 보여주는 폼 ------------------------------------------  --> 	
  	 
 	 <div class="container">
        <div class="row" id="session2">
          <div class="col-md-12">
          <h3>Review</h3>
            <table class="table">
              <thead>
                <tr>
                  <th width="6%" >#</th>
                  <th width="10%">작성자</th>
                  <th width="10%">평점</th>
                  <th width="60%">내용</th>
                  <th width="14%">시간</th>
                  
                </tr>
              </thead>
              <tbody>
              
              
        <!-- 리뷰 반복문 ----------------------------- -->      
            <c:forEach var="re" items="${review }" varStatus="i">  
                <tr>
                  <td>${i.count }</td>
                  <td>${re.res_reviewWriter }</td>
                  <td>${re.res_star }</td>
                  <td>${re.res_reviewMsg }</td>
                  <td>${re.res_reviewDate}
                   
                   <!-- 포럼 삭제 관련 => 로그인 하지 않았거나 댓글이 달려있다면 지울 수 없다. -->       
                <c:if test="${loginUser.idx==detailRes.idx or loginUser.status==3}">
           				<a href="javascript:delResReview('${re.res_reviewNum}')"><i class="fa fa-1x fa-fw fa-close"></i></a>
       			</c:if> 
       			   <!-- ======================================= -->
                  
                  </td>   
                </tr>
           </c:forEach>    
        <!-- ------------------------------------ -->   
              </tbody>
            </table>

 <br>
       
           
            
          <!-- 리뷰 업로드 ------------------- -->  
      <c:if test="${loginUser!=null and loginUser.idx!=detailRes.idx}">      
            <form class="form-horizontal" role="form" name="goresReview" id="goresReview" method="POST">
              <div class="form-group">
                <div class="col-sm-1">
                  <label for="inputEmail3" class="control-label">review</label>
                </div>
                   <div class="col-sm-1">
                   <select class="form-control" id="res_star" name="res_star">
                    <option>0</option>
                    <option>1</option>
                    <option>2</option>
                    <option>3</option>
                    <option>4</option>
                    <option>5</option>
                  </select>
                </div>
                
                <div class="col-sm-10">
                  <input type="text" class="form-control" id="res_reviewMsg" name="res_reviewMsg" placeholder="review">
                </div>
              </div>

              <div class="form-group">
                <div class="col-sm-10 col-sm-offset-2 text-right">
                  <button type="button" class="btn btn-default" onclick="upResReview()">Review upload</button>
                </div>
              </div>
              
              <!-- 업로드 정보  -->
               <input type="hidden" class="form-control" id="upnum" name="upnum" value="${detailRes.upnum }" >
                <input type="hidden" class="form-control" id="idx" name="idx" value="${loginUser.idx }" >
                 <input type="hidden" class="form-control" id="res_reviewWriter" name="res_reviewWriter" value="${loginUser.name }">
            </form>
          </c:if>  
		<!-- --------------------------- -->
          </div>
        </div>
      </div>
      
      <!-- 게시글 -->
      
      
      
      <!-- --- -->
         <div class="col-md-12 text-center">
            <a href="resdetail.do?upnum=${detailRes.upnum }#session0"><i class="fa fa-3x fa-fw fa-arrow-circle-up"></i></a>
          </div>
      <br><br><br>

</div>




<script type="text/javascript">


//nav 이동 폼
 var gomenu=function(){
	 
	 goview.action="resmenu.do";
	 //goview.submit();
 }
 
 var goreview=function(){
	 
	 goview.action="resreview.do";
	 //goview.submit();
 }
 
 
 /////////////////////////////////////////////////
 //리뷰 업로드
 var upResReview=function(){
	 
	 goresReview.action="resupreview.do";
	 goresReview.submit();
	 
 }
 
 //리뷰 삭제
 var delResReview=function(vdelnum){
	 godelReview.delReview.value=vdelnum;
	 godelReview.action="resdelreview.do";
	 godelReview.submit();
	 
 }
 
 ///////////////////////////////////////
 //음식점 삭제 폼
  var del=function(){
	 main.action="resdel.do";
	 main.submit();
 }
 
 //음식점 수정 폼
 var redetail=function(){
	 main.action="reRes.do?upnum=${detailRes.upnum }";
	 main.submit();
 }
 
 
 ////////////////////////////////////////////
 //메뉴업로드
 var upmenu=function(){
	 
	 upmenus.submit();
	 
 }
 //메뉴삭제
 var delmenu=function(vdelmenu){
	 
	 godelmenu.menudel.value=vdelmenu;
	 godelmenu.action="delmenu.do";
	 godelmenu.submit();
 }
 
 
 /////////////////////////////////////////////////
 //테이블 업로드
 var gotable=function(){
	 
	 if(!tableup.tableuser.value)
		{
			alert("테이블 인원수를 등록하세요.");
			tableup.tableuser.focus();
			return;
		}	
	 
	 if(!tableup.quantity.value)
		{
			alert("테이블 개수를 등록하세요.");
			tableup.quantity.focus();
			return;
		}
		
		if(!tableup.opentime1.value)
		{
			alert("오픈 시간를 등록하세요.");
			tableup.opentime1.focus();
			return;
		}
		
		if(!tableup.closetime1.value)
		{
			alert("마감 시간를 등록하세요.");
			tableup.closetime1.focus();
			return;
		}
		
	 
	 
	 tableup.submit();
 }
 //테이블 삭제
 
 var delTable=function(){
	 
	 deltable.submit();
	 
 }
 
</script> 
 
 
 
 
 
 
<!-- 다음 지도 -->
<!-- <script type="text/javascript" src="//apis.daum.net/maps/maps3.js?apikey=1869823f855a028e850ee238641d80ac&libraries=services"></script> -->
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
geocoder.addr2coord('${detailRes.uplocation }', function(status, result) {

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
            content: '<div style="width:150px;text-align:center;padding:6px 0;">${detailRes.uprestaurant}</div>'
        });
        infowindow.open(map, marker);

        // 지도의 중심을 결과값으로 받은 위치로 이동시킵니다
        map.setCenter(coords);
    } 
});    
</script> 
 
  
    
<jsp:include page="/WEB-INF/view/Foot.jsp"/>