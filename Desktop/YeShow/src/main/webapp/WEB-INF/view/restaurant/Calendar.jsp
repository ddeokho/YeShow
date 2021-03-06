<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 
<jsp:include page="/WEB-INF/view/Top.jsp"/>
<%
	String adminctx=request.getContextPath();
%>
		 <div class="section">
		 
		      <div class="container">
		      <form class="form-horizontal" role="form" id="goreservation" name="goreservation"  method="POST" >
				 
				 <div class="row">
					<h2>예 약</h2>
					<h5>(버튼은 예약가능 시작 시간입니다. 1시간 단위로 테이블을 선택해 예약하실 수 있습니다. ex) 10:00 => 10:00~11:00)</h5>
					<br><br>
					<h4>예약 날짜</h4>
					<div class="form-group">  
						 <div class="col-md-3 text-left">
							<input type="date" class="form-control" id="resdate" name="resdate" value="${fresdate }"  readonly>
						 </div>
						 <div class="col-md-4 text-left">
                  		 <a class="btn btn-default" href="fcal.do?upnum=${backupnum}">되돌아가기</a>
         			 	 </div>
         			 	 
						 <div class="col-md-1">
						 <a class="btn btn-default ">예약 O</a>
						 </div>
						 <div class="col-md-1">
						 <a class="btn btn-danger ">예약 X</a>
						 </div>
						 
					 </div>
				 
				</div>	 
				<!-- 테이블 보여주기 -->
				 <div class="row">
					
				
					<!-- 테이블 정보 보여주는 for -->
					 <c:forEach var="ta" items="${table }" varStatus="i">
						<div class="col-md-12">
									<img src="<%=adminctx%>/restaurant/table/${ta.tableuser}.jpg" height="100" width="100"><h4>${ta.tableuser }인용 테이블  &nbsp ${i.count }</h4> <%-- //${ta.tablenum} --%>
									<br><%-- height="100" width="100"  src="<%=adminctx %>/restaurant/table/${ta.tableuser }.jsp" --%>
							<!-- 시간을 보여주는 for -->
							
							<c:forEach var="t" items="${tarr }" varStatus="k"> 			
								<!-- 등록된 테이블과 각 시간을 표현하는 테이블의 넘버가 같을 떄-->
										<c:if test="${ta.tablenum eq t.restablenum }"> 	
	
									
										<!-- 분이 없을때 -->
			              				<c:if test="${t.resmin==0 }">
			              		  		<!-- 날짜, 테이블번호, 예약 시간 -->
			              				
			              						<a id="a${k.index}" class="btn btn-default" onclick="reservation('${t.restime }:${t.resmin }0','${t.restablenum }')">${t.restime }:${t.resmin }0 </a>

										</c:if>
										<!-- 분이 있을때 -->
										<c:if test="${t.resmin!=0 }">
			              		  		<!-- 날짜, 테이블번호, 예약 시간 -->
			              				
			              						<a id="a${k.index}" class="btn btn-default" onclick="reservation('${t.restime }:${t.resmin }','${t.restablenum }')">${t.restime }:${t.resmin } </a>

										</c:if>		
										
										<c:forEach var="ta2" items="${table2 }">
												
											<!-- 예약된 시간 -->
											
											<c:if test="${ta2.resdate eq fresdate and ta2.tablenum eq ta.tablenum and ta2.restime eq t.restime}"> 
												<script>
												$('#a${k.index}').addClass('btn btn-danger').attr('onclick','').unbind('click');
												
												</script>
											</c:if>
												
																
										</c:forEach>
			              					
								</c:if>	
							</c:forEach>
						</div>
					 </c:forEach>
					 
				</div>
				<!-- ------- -->
				
				<!-- 예약 등록시 적용해야하는 변수들 -->
       			<input type="hidden" name="idx" id="idx" value="${loginUser.idx }">
       			<input type="hidden" id="re_resuser" name="re_resuser" value="${loginUser.name }">
       			<input type="hidden" id="re_resname" name="re_resname" value="${resta.uprestaurant }">
       			<input type="hidden" name="upnum" id="upnum" value="${backupnum }" >
       			<input type="hidden" name="backupnum2" id="backupnum2" value="${backupnum }" >
       			<input type="hidden" name="tablenum" id="tablenum">
				<input type="hidden" name="re_restime" id="restime">
				<!-- ----- -->
				
				<!-- 다음 예약 내역 보여줄 폼 ->가게번호, 가게 위치 -->
      			<input type="hidden" id="phon" name="phon" value="${resta.upphon }">
       			<input type="hidden" id="location" name="location" value="${resta.uplocation }">
				<input type="hidden" id="resname" name="resname" value="${resta.uprestaurant }">
				<!-- ------------ -->
				<br>
				<br>
				<%-- <div class="row">
         			 <div class="col-md-12 text-left">
                  		<a class="btn btn-default" href="fcal.do?upnum=${backupnum}">되돌아가기</a>
         			 </div>
       			</div> --%>
       			<!-- ----- -->
       			
			 </form>
			 
			 </div>
			  
		</div>

<script type="text/javascript">
	
var reservation=function(vtime,vtable ){
	
	if(!goreservation.resdate.value)
	{
		alert("날짜를 입력하세요.");
		goreservation.resdate.focus();
		return;
	}
	
	var yn=window.confirm(vtable+"번 테이블 "+vtime+"에 예약하십니까?");
	if(yn){
		goreservation.tablenum.value=vtable;
		goreservation.restime.value=vtime;
		goreservation.action="reservation.do";
		goreservation.submit();
	}
	
}

	
</script>

<jsp:include page="/WEB-INF/view/Foot.jsp"/>