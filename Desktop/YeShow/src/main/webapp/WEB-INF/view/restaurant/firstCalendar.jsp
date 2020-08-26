<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 
<jsp:include page="/WEB-INF/view/Top.jsp"/>
<%
	String adminctx=request.getContextPath();
%>
		 <div class="section">
		 
		      <div class="container">
		      <form class="form-horizontal" role="form" id="fgoreservation" name="fgoreservation"  method="POST" >
				 
				 <div class="row">
					<h2>예 약</h2>
					<h5>(예약 날짜를 선택해서 테이블보기를 눌러 주세요.)</h5>
					<br><br>
					<h4>예약 날짜 설정</h4>
					<div class="form-group">  
					
						 <div class="col-md-5 text-left">
							
							<input type="date" class="form-control" id="fresdate" name="fresdate">
							     
							<br>
						 	<a class="btn btn-default" onclick="freservation()">테이블 보기</a>
						 </div>
						 <div class="col-md-5 text-left">
						 영업시간 : ${detailRes2.upbusiness }, 휴무일 : ${detailRes2.uprest }
						 </div>
					 </div>
				</div>	 			
				<!-- 예약 등록시 적용해야하는 변수들 -->
       			<input type="hidden" name="upnum2" id="upnum2" value="${Resd }">
			 </form> 
			 </div>  
		</div>

<script type="text/javascript">
	
var freservation=function(){
	
	if(!fgoreservation.fresdate.value)
	{
		alert("날짜를 입력하세요.");
		fgoreservation.fresdate.focus();
		return;
	}
	
	
		fgoreservation.action="cal.do?upnum=${Resd }";
		fgoreservation.submit();
	
	
}
	
</script>

<jsp:include page="/WEB-INF/view/Foot.jsp"/>