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
  
   <!-- ------------------- -->
   
   
   <!-- 정보를 을 가져가는 form -- -->
   <form id="goview" name="goview" method="POST">
   
   <input type="hidden" name="upresnum" id="upresnum" value="${resinfo.upnum }">
  
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
       
        
  
      <div class="container">
        <div class="row">
          <div class="col-md-12">
            <table class="table">
              <thead>
                <tr>
                  <th width="3%" >#</th>
                  <th width="15%">작성자</th>
                  <th width="60%">내용</th>
                  <th width="22%">시간</th>
                  
                </tr>
              </thead>
              <tbody>
              
              
        <!-- 리뷰 반복문 ----------------------------- -->      
            <c:forEach var="re" items="${review }" varStatus="i">  
                <tr>
                  <td>${i.count }</td>
                  <td>${re.res_reviewWriter }</td>
                  <td>${re.res_reviewMsg }</td>
                  <td>${re.res_reviewDate}
                   
                   <!-- 포럼 삭제 관련 => 로그인 하지 않았거나 댓글이 달려있다면 지울 수 없다. -->       
                  <%--  <c:if test="${loginUser.idx eq listfo.idx || loginUser.m_state==3}"> --%>
           				<a href="javascript:delResReview('${re.res_reviewNum}')"><i class="fa fa-1x fa-fw fa-close"></i></a>
       			   <%-- </c:if> --%>
       			   <!-- ======================================= -->
                  
                  </td>   
                </tr>
           </c:forEach>    
        <!-- ------------------------------------ -->   
              </tbody>
            </table>
 
 <!-- 댓글 삭제 폼 -->           
 <form name="godelReview" id="godelReview" method="POST">
 <input type="hidden" id="delReview" name="delReview">
 <input type="hidden" name="upresnum" id="upresnum" value="${resinfo.upnum }">
 </form>           
          
           
            
            
            <form class="form-horizontal" role="form" name="goresReview" id="goresReview" method="POST">
              <div class="form-group">
                <div class="col-sm-2">
                  <label for="inputEmail3" class="control-label">review</label>
                </div>
                <div class="col-sm-10">
                  <input type="text" class="form-control" id="res_reviewMsg" name="res_reviewMsg" placeholder="review">
                </div>
              </div>
              <div class="form-group">
                <div class="col-sm-10 col-sm-offset-2 text-right">
                  <button type="button" class="btn btn-default" onclick="upResReview()">Sign in</button>
                </div>
              </div>
              <!-- 업로드 정보  -->
               <input type="hidden" class="form-control" id="upnum" name="upnum" value="${resinfo.upnum }" >
                <input type="hidden" class="form-control" id="idx" name="idx" value="1" >
                 <input type="hidden" class="form-control" id="res_reviewWriter" name="res_reviewWriter" value="loginuser">
            </form>
            
          </div>
        </div>
      </div>
   
        
        
        
        
        <br><br>
       
        <div class="row">
          <div class="col-md-12">
            <a class="btn btn-block btn-lg btn-primary">Reservation</a>
          </div>
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
 
</script> 
 
 
 
  
    
<jsp:include page="/WEB-INF/view/Foot.jsp"/>