<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<c:import url="/Top.do"/>
<%-- <%
	MemberVO loginUser = (MemberVO) session.getAttribute("loginUser");
	AdminVO loginAdmin = (AdminVO) session.getAttribute("loginAdmin");
	if (loginAdmin == null && loginUser == null) {
%>
<script type="text/javascript">
	alert('로그인해야 이용 가능');
	location.href = "./index.mp";
</script>
<%
	return;
	}
%>
 --%>
<div class="container">
	<h2 align="center">공지사항 목록</h2>
	<table class="table table-hover text-center table-responsive">
		<thead>
			<tr>
				<th class="text-center">총 공지사항 : <span
					style="color: red; font-weight: blod;">${totalCount }</span> 개
				</th>

			</tr>
			<tr class="info">
				<th class="text-center" width="60%">제 목</th>
				<th class="text-center" width="20%">등록일</th>
				<th class="text-center" width="20%">조회수</th>
			</tr>
		</thead>
		<tbody>
			<c:if test="${list eq null || empty list}">
				<tr>
					<td colspan="4">문의하신 내용이 없습니다.</td>
				</tr>
			</c:if>
			<c:if test="${list ne null && not empty list}">
				<c:forEach var="i" items="${list }">
					<tr>
						<td><a href="noteView.mp?idx=${i.nnum}">
							<c:if test="${fn:length(i.ntitle) > 20 }">
								${fn:substring(i.ntitle, 0, 20)}...
							</c:if>
							<c:if test="${fn:length(i.ntitle) <= 20 }">
								${i.ntitle}
							</c:if></a>
						</td>
						<td>${i.ndate}</td>
						<td>${i.readcount}</td>
					</tr>
				</c:forEach>
			</c:if>
			<tr>
				<td colspan="5" class="text-center">
					<ul class="pagination pagination-sm">
						<c:if test="${prevBlock > 0}">
							<li><a href="/complain/complain.mp?cpage=${prevBlock}"> <i
									class="fa fa-angle-double-left fa-fw fa-lg"></i>
							</a></li>
						</c:if>
						<c:forEach var="i" begin="${prevBlock+1}" end="${nextBlock-1}">
							<c:if test="${i <= pageCount}">
								<c:if test="${i eq cpage}">
									<li class="active"><a href="#admin_NList">${i}</a></li>
								</c:if>
								<c:if test="${i ne cpage}">
									<li><a href="/myPro/complain/complain.mp?cpage=${i}">${i}</a></li>
								</c:if>
							</c:if>
						</c:forEach>
						<c:if test="${nextBlock <= pageCount}">
							<li><a href="/complain/complain.mp?cpage=${nextBlock}"> <i
									class="fa fa-angle-double-right fa-fw fa-lg"></i></a></li>
						</c:if>
					</ul>
				</td>

			</tr>
		</tbody>
	</table>
</div>
<c:import url="/Foot.do"/>