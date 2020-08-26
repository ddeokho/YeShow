<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 
<jsp:include page="/WEB-INF/view/Top.jsp"/>

  <div class="section">
      <div class="container">
        <div class="row">
          <div class="col-md-12 ">
          <h2>내가 예약한 정보 확인</h2><br>
          <h4>예약취소는 2일 전에만 가능합니다. 사정이 있을 경우 전화를 꼭 해주세요.</h4>
            <table class="table">
              <thead>
                <tr>
                  <th width="3%">#</th>
                  <th width="13%">가게 이름</th>
                  <th width="13%">가게 번호</th>
                  <th width="43%">가게 위치</th>
                  <th width="13%">예약 날짜</th>
                  <th width="10%">예약 시간</th>
                  <th width="3"></th>
                  <th width="3"></th>
                </tr>
              </thead>
              <tbody>
             <!-- 예약을 보여주는 for -->
             <c:forEach var="r" items="${res }" varStatus="i">
                <tr>
                  <td>${i.count }</td>
                  <td>${r.uprestaurant }</td>
                  <td>${r.upphon }</td>
                  <td>${r.uplocation }</td>
                  <td>${r.resdate }</td>
                  <td>${r.re_restime }</td>
                  <td><a class="btn btn- btn-info" href="resdetail.do?upnum=${r.upnum }">업장보기</a></td>
                  <td><a class="btn btn- btn-danger" href="javascript:goresdel('${r.num }')">취소하기</a></td>
                </tr>
             </c:forEach>   
              </tbody>
            </table>

          </div>
        </div>
      </div>
    </div>

<!-- 삭제폼 -->
<form id="godelres" name="godelres" method="POST">
	<input type="hidden" id="resvnum" name="resvnum">
	<input type="hidden" id="residx" name="residx" value="${loginUser.idx }">
</form>

<script type="text/javascript">
	
	var goresdel=function(vnum){
		
		var yn=window.confirm("정말 취소하십니까?");
		if(yn){
		godelres.resvnum.value=vnum;
		godelres.action="delResve.do";
		godelres.submit();
		
		}
	}
	
</script>

<jsp:include page="/WEB-INF/view/Foot.jsp"/>