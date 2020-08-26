<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 
<jsp:include page="/WEB-INF/view/Top.jsp"/>

  <div class="section">
      <div class="container">
        <div class="row">
          <div class="col-md-12 ">
          
          <!-- 패널티주기 -->
          <form id="gopres" name="gopres" method="POST">
	          <h2>우리가게 예약 내역 확인</h2><br>
	          <h4>회원이 노쇼를 했을 때, 예약 시간이 지난 후 1일 내에 등록하셔야 처리됩니다.</h4>
	            <table class="table">
	              <thead>
	                <tr>
	                  <th width="3%">#</th>
	                  <th width="10%">예약 번호</th>
	                  <th width="15%">업장 이름</th>
	                  <th width="13%">회원 이름</th>
	                  <th width="15%">연락처</th>
	                  <th width="13%">예약 날짜</th>
	                  <th width="10%">예약 시간</th>
	                  <th width="10%">노쇼 횟수</th>
	                  <th width="3"></th>
	                  <th width="3"></th>
	                </tr>
	              </thead>
	              <tbody>
	             <!-- 예약을 보여주는 for -->
	             <c:forEach var="o" items="${owner }" varStatus="i">
	                <tr>
	                  <td>${i.count }</td>
	                  <td>${o.num }</td>
	                  <td>${o.re_resname }</td>
	                  <td>${o.re_resuser }</td>
	                  <td>${o.hp1 }-${o.hp2 }-${o.hp3 }</td>
	                  <td>${o.resdate }</td>
	                  <td>${o.re_restime }</td>
	                  
	              <!-- 패널티 -->    
	                  <c:if test="${o.penalty==null}">
	                  <td>0</td>
					  </c:if>
					  <c:if test="${o.penalty!=null}">
	                  <td>${o.penalty }</td>
					  </c:if>		
	              <!--  -->   
	              
	              <!-- 패널티 1	번만 주기 -->
	              <!-- 노쇼체크를 하지 않은 경우 -->
	              <c:if test="${nullflag==1}">
	                  		<td><a class="btn btn- btn-info" onclick="gopenalty('${o.memb }','${o.owner }','${o.num }')">노쇼체크</a></td>
	              </c:if>
	              
	               <!-- 노쇼 체크를 한 경우 -->
	              <c:if test="${nullflag==0}">
	              
	              	<td><a id="b${i.index}" class="btn btn- btn-info" href="javascript:gopenalty('${o.memb }','${o.owner }','${o.num }')">노쇼체크</a></td>
	              
	               <!-- flag 테이블에서 찾기 --> 
	              <c:forEach var="f" items="${flag }"> 
	                  <c:if test="${f.num==o.num}">
								<script>
									$('#b${i.index}').addClass('btn btn- btn-info disabled').attr('onclick','').unbind('click');
												
								</script>
	             	  </c:if>	
	              </c:forEach>
	              </c:if>
	                  
	                  <td><a class="btn btn- btn-danger" href="javascript:goOwnerdel('${o.num }')">취소하기</a></td>
	                </tr>
	             </c:forEach>   
	              </tbody>
	            </table>
	            
	            <!-- 예약회원 넘버 -->
				<input type="hidden" id="presvnum" name="presvnum">
				<!-- 업주 넘버 -->
				<input type="hidden" id="oesvnum" name="oresvnum">
				<!-- num -->
				<input type="hidden" id="num" name="num">
				<!-- idx -->
				<input type="hidden" id="idx" name="idx" value="${loginUser.idx }">
	            
			</form>
          </div>
        </div>
      </div>
    </div>

<!-- 삭제폼 -->
<form id="godelores" name="godelores" method="POST">
	<!-- 예약 번호 -->
	<input type="hidden" id="oresvnum" name="oresvnum">
	<!-- 업주 번호 -->
	<input type="hidden" id="oresidx" name="oresidx" value="${loginUser.idx }">
</form>


<script type="text/javascript">
	
	var goOwnerdel=function(vnum){
		
		var yn=window.confirm("정말 취소하십니까?");
		if(yn){
			godelores.oresvnum.value=vnum;
			godelores.action="deloResve.do";
			godelores.submit();
		
		}
	}
	
	var gopenalty=function(pnum,onum,vnum){
		

		var yn=window.confirm("노쇼인가요?");
		
		if(yn){
			gopres.oresvnum.value=onum;
			gopres.presvnum.value=pnum;
			gopres.num.value=vnum;
			gopres.action="uppResve.do";
			gopres.submit();
		
		}
	}
	
	
	
</script>

<jsp:include page="/WEB-INF/view/Foot.jsp"/>