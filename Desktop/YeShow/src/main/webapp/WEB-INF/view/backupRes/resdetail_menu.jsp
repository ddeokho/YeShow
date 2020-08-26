<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 
<jsp:include page="/WEB-INF/view/Top.jsp"/>
 

  
     <div class="section">
      <div class="container">
        <div class="row">
          <div class="col-md-6">
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
          
   <!-- 상세설명 div ---------- -->   
          <div class="col-md-6">
            <h2>${resinfo.uprestaurant }</h2>
            <br><br>
            
            <p>${resinfo.upmsg }</p>
            
            <br>
            	<a href="#"><i class="fa fa-3x fa-mobile fa-fw"></i></a>
          		<a href="http://map.daum.net/link/search/${resinfo.uplocation }"><i class="fa fa-3x fa-fw fa-map-marker"></i></a> 
            	<a href="#"><i class="fa fa-3x fa-fw fa-calendar"></i></a>
          </div>
        </div>
      </div>
    </div>
   
   
   <!-- ------------------ -->
   
   
    <!-- upnum을 가져가는 form -- -->
   <form id="goview" name="goview" method="POST">
   
   <input type="hidden" name="upresnum" id="upresnum" value="${detailRes.upnum }">
   
   </form>
   <!-- ------------------ -->
   
   <div class="container">
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
   
 
   
	   
	    
	        <div class="row">
		<!-- 메뉴 보여주기------------------ -->

	       	<c:forEach var="m" items="${menu }">
	          <div class="col-md-2">
	            <div class="thumbnail">
	              <img src="http://pingendo.github.io/pingendo-bootstrap/assets/placeholder.png"
	              class="img-responsive">
	              <div class="caption">
	                <h3>${m.menuname }</h3>
	                <p>${m.menuinfo }<br><br>
	                ${m.menuprice }원<br></p>
	              </div>
	            </div>
	         </div>
	         </c:forEach>
	  
	    <!-- ------------------------- -->       
	       </div>
	       <a class="btn btn-primary btn-sm">upload</a>
	    
	        
	        <br><br>
	        
	        <div class="row">
	          <div class="col-md-12">
	            <a class="btn btn-block btn-lg btn-primary">Reservation</a>
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
 
//업로드삭제
 
</script> 
 
 
 
  
    
<jsp:include page="/WEB-INF/view/Foot.jsp"/>