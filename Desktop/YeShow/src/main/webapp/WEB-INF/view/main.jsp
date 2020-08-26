<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 
<%
	String adminctx=request.getContextPath();
%>
<style>
	#mainImg {

   height: 210px;

}

	#th {
		height: 380px;
	}
</style>

<c:import url="/Top.do"/>
    <!-- Page Content -->
    
    <div class="container">

        <div class="row">
      <c:if test="${loginUser.status==2 or loginUser.status==3 }">  
			   <div class="section">
			      <div class="container">
			        <div class="row">
			          <a class="btn btn-block btn-lg btn-primary" href="resup.do">Upload</a>
			        </div>
			      </div>
			    </div>
      </c:if>
      
	<br><br>
    		 <div class="col-md-offset-3 col-md-6">
            <form role="form" id="mainsearch" name="mainsearch" method="POST">
              <div class="form-group" >
                <div class="input-group">
                  <input type="text" class="form-control" id="search" name="search" placeholder="검색">
                  <span class="input-group-btn">
                    <button class="btn btn-default"  type="button" onclick="ssearch()">Search</button>
                  </span>
                </div>
              </div>
            </form>
          </div>       

            <div class="col-md-12">

                <div class="row carousel-holder">

                    <div class="col-md-12">
                        <div id="carousel-example-generic" class="carousel slide" data-ride="carousel">
                            <ol class="carousel-indicators">
                                <li data-target="#carousel-example-generic" data-slide-to="0" class="active"></li>
                                <li data-target="#carousel-example-generic" data-slide-to="1"></li>
                                <li data-target="#carousel-example-generic" data-slide-to="2"></li>
                            </ol>
                            <div class="carousel-inner">
                                <div class="item active">
                                    <img class="slide-image" src="http://placehold.it/800x300" alt="">
                                </div>
                                <div class="item">
                                    <img class="slide-image" src="http://placehold.it/800x300" alt="">
                                </div>
                                <div class="item">
                                    <img class="slide-image" src="http://placehold.it/800x300" alt="">
                                </div>
                            </div>
                            <a class="left carousel-control" href="#carousel-example-generic" data-slide="prev">
                                <span class="glyphicon glyphicon-chevron-left"></span>
                            </a>
                            <a class="right carousel-control" href="#carousel-example-generic" data-slide="next">
                                <span class="glyphicon glyphicon-chevron-right"></span>
                            </a>
                        </div>
                    </div>

                </div>

			<!-- for 문  =================================== -->
            
                <div class="row">
                <!-- 업로드 상태에 따라 null일 경우 보여주고 삭제를 하면 상태를 1로 만들어 보여주지 않게한다. -->
                 <c:forEach var="res" items="${resArr}" varStatus="i">
                 	<!-- 활성화 되어있는 상태의 가게만  표시 -->
                 	<c:if test="${res.upstate != 1 }">
                 	
					
	                    <div class="col-sm-4 col-lg-4 col-md-4"  <c:if test="${i.last }">id="session"</c:if>> 
	                        <div id="th" class="thumbnail">
	                        
	
	                            <a onclick="godetail('${res.upnum}')"><img id="mainImg" src="${pageContext.request.contextPath}/restaurant/Upload/${res.upiname }" alt="로딩중.."></a>
	             
	                            <div class="caption">
	                            	<c:forEach var="p" items="${price }">
	                            		<c:if test="${res.upnum==p.upnum }">
	                                		
	                                		<h4 class="pull-right"> <i class="fa fa-1x fa-fw fa-krw"></i> ${p.leastprice }</h4>
	                                	</c:if>
	                                </c:forEach>
	                                
	                                <h4>${res.uprestaurant}
	                                </h4>
	                                <p>${res.uptitle}
	                  
	                                </p>
	                            	
	                            </div>
	                            <div class="ratings">
	                                <p class="pull-right">
	                                <!-- 업로드 번호와 리뷰번호가 일치할때 리뷰 갯수 표시 -->
	                               
		                                <c:forEach var="r" items="${star}">	
		                                		
		                                	 <c:if test="${res.upnum==r.upnum }"> 
		                                		${r.review }
		                                 	 </c:if>
		                                </c:forEach>
		                                reviews
	                                </p>
	                                <p>
	                                	
	                                <!-- 업로드 번호가 리뷰번호와 같을때 별을 표시 -->
	                                	 <c:forEach var="s" items="${star}" >
	                                <%-- 	 	<c:if test="${s.star==null}">
	                                			not yet..
	                                     	</c:if> --%>
	                                		<c:if test="${res.upnum==s.upnum && 0<=s.star and s.star<0.5 }">
	                                			<span class="glyphicon glyphicon-star"></span>
	                                     	</c:if>
	                                     	<c:if test="${res.upnum==s.upnum && 0.5<=s.star and s.star<1.5}">
	                                			 <c:forEach begin="1" end="1" step="1">
	                                    			<span class="glyphicon glyphicon-star"></span>
	                                    		</c:forEach>
	                                     	</c:if> 
	                                     	<c:if test="${res.upnum==s.upnum && 1.5<=s.star and s.star<2.5}">
	                                			 <c:forEach begin="1" end="2" step="1">
	                                    			<span class="glyphicon glyphicon-star"></span>
	                                    		</c:forEach>
	                                     	</c:if>
	                                     	<c:if test="${res.upnum==s.upnum && 2.5<=s.star and s.star<3.5}">
	                                			 <c:forEach begin="1" end="3" step="1">
	                                    			<span class="glyphicon glyphicon-star"></span>
	                                    		</c:forEach>
	                                     	</c:if> 
	                                     	<c:if test="${res.upnum==s.upnum && 3.5<=s.star and s.star<4.5}">
	                                			 <c:forEach begin="1" end="4">
	                                    			<span class="glyphicon glyphicon-star"></span>
	                                    		</c:forEach>
	                                     	</c:if>
	                                     	<c:if test="${res.upnum==s.upnum && 4.5<=s.star and s.star<=5}">
	                                			 <c:forEach begin="1" end="5">
	                                    			<span class="glyphicon glyphicon-star"></span>
	                                    		</c:forEach>
	                                     	</c:if> 
	                                    </c:forEach>  
	                                
	                                    
	                                </p>
	                           
	                          
	                            </div>
	                         
	                        </div>
	                    </div>
	                    
	                    
                    </c:if>
               </c:forEach>
                </div>
          
		<!-- ============================================== -->
		<div class="col-sm4 col-lg-4 col-md-4">
			<h4>더 많은 레스토랑의 정보를 원하신다면?</h4>
			<a class="btn btn-primary large" href="javascript=gonext()">Click</a>
		</div>
		
            </div>

        </div>
<form id="main" name="main"  method="POST">
 	<input type="hidden" name="upnum" id="upnum" >
</form>

<!--  -->
    </div>
    <!-- /.container -->


<script type="text/javascript">

 //검색
 var ssearch=function(){
	 
	
	 mainsearch.action="mainsearch.do";
	 mainsearch.submit();
	 
 }
 
 //뷰관련
 var godetail=function(vupnum){
	 
	 main.upnum.value=vupnum;
	 main.action="resdetail.do";
	 main.submit();
 }
 

 var gonext=function(){
	 
	 page.submit();
 }


</script>


<c:import url="/Foot.do"/>