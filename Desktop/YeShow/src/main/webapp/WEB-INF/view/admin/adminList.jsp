<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<c:import url="/Top.do"/>
<%-- <%
	AdminVO loginAdmin = (AdminVO) session.getAttribute("loginAdmin");

	if (loginAdmin == null) {
%>
<script type="text/javascript">
	alert('로그인해야 이용 가능');
	location.href = "./index.mp";
</script>
<%
	return;
	}
%> --%>
<div class="section">
	<div class="container">
		<div class="row">
			<div class="col-md-12 text-center">
				<table class="table">
				<thead>
					<tr>
						<th colspan="4" class="text-right">총 관리자 : <span
							style="color: red; font-weight: blod;"> ${totalCount } 명</span>
						</th>
					</tr>
					
						<tr class="info">
							<th class="text-center" width="10%">번호</th>
							<th class="text-center" width="30%">이름</th>
							<th class="text-center" width="30%">아이디</th>
							<th class="text-center" width="10%">삭제</th>
						</tr>
					</thead>
					<tbody>
						<!-- 반복문 -->
						<c:if test="${Admin eq null || empty Admin}">
							<td colspan="4">관리자가 없습니다. 생성해주세요</td>
						</c:if>
						<c:if test="${Admin ne null && not empty Admin}">
							<c:forEach var="i" items="${Admin}">
								<tr>
									<td>${i.anum}</td>
									<td>${i.aname}</td>
									<td>${i.aid}</td>
									<td><a href="#" onclick="deluser(${i.anum})">삭제</a></td>
								</tr>
							</c:forEach>
						</c:if>
						<tr>
							<td colspan="4" class="text-center">
								<ul class="pagination pagination-sm">
									<c:if test="${prevBlock > 0}">
										<li><a href="memberList.mp?cpage=${prevBlock}"> <i
												class="fa fa-angle-double-left fa-fw fa-lg"></i>
										</a></li>
									</c:if>
									<c:forEach var="i" begin="${prevBlock+1}" end="${nextBlock-1}">
										<c:if test="${i <= pageCount}">
											<c:if test="${i eq cpage}">
												<li class="active"><a href="#memberL">${i}</a></li>
											</c:if>
											<c:if test="${i ne cpage}">
												<li><a href="adminList.mp?cpage=${i}#memberL">${i}</a></li>
											</c:if>
										</c:if>
									</c:forEach>
									<c:if test="${nextBlock <= pageCount}">
										<li><a href="adminList.mp?cpage=${nextBlock}"> <i
												class="fa fa-angle-double-right fa-fw fa-lg"></i></a></li>
									</c:if>
								</ul>
							</td>
						</tr>
					</tbody>
				</table>
			</div>
		</div>
	</div>
</div>
<script type="text/javascript">
	var deluser=function(adminNo){
		var yn=confirm(adminNo+'번 관리자를 정말 삭제 합니까?');
		if(yn){
			location.href="memberDel.jsp?adminNo="+adminNo;
		}
	}
</script>
<c:import url="/Foot.do"/>











