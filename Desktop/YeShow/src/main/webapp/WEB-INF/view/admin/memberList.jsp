<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<c:import url="/Top.do" />

<br>
<br>
<div class="section text-center">
	<div class="container text-center">
		<div class="row text-center" id="memberL">
			<div class="col-md-12 text-center">
				<form name="staF">
				<select name="findSta" id="findSta" class="form-control" onchange="submit()">
					<option value='' selected>:: 회원유형 ::</option>
					<option value="-1">모든 회원</option>
					<option value="0">관리자</option>
					<option value="1">일반회원</option>
					<option value="2">업주회원</option>
				</select>
				</form>
				<table class="table table-hover table-responsive text-center">
					<thead>
						<tr>
							<th colspan="9" class="text-right">총 회원 : <span
								style="color: red; font-weight: blod;"> ${totalCount } 명</span>
							</th>
						</tr>
						<tr class="info">
							<th class="text-center" width="7%">번 호</th>
							<th class="text-center" width="9%">이 름</th>
							<th class="text-center" width="10%">아이디</th>
							<th class="text-center" width="10%">연락처</th>
							<th class="text-center" width="10%">이메일</th>
							<th class="text-center" width="30%">주 소</th>
							<th class="text-center" width="10%">가입일</th>
							<th class="text-center" width="7%">승 급</th>
							<th class="text-center" width="7%">삭 제</th>
						</tr>
					</thead>
					<tbody>
						<c:if test="${mList eq null || empty mList}">
							<tr>
								<td colspan="9">회원이 없습니다.</td>
							</tr>
						</c:if>
						<c:if test="${mList ne null && not empty mList }">
							<c:forEach var="member" items="${mList}">
								<tr>
									<td>${member.idx}</td>
									<td>${member.name}</td>
									<td>${member.userid1}</td>
									<td>${member.allHp}</td>
									<td>${member.email}</td>
									<td>${member.allAddr}</td>
									<td>${member.indate}</td>
									<td><a href="#" onclick="Edituser('${member.idx}')">승
											급</a></td>
									<td><a href="#" onclick="deluser('${member.idx}')">삭 제</a></td>
								</tr>
							</c:forEach>
						</c:if>
						<tr>
							<td colspan="9" align="center">${pageNavi}</td>
						</tr>
					</tbody>
				</table>
			</div>

			<form name="findf"
				action="${pageContext.request.contextPath}/admin/memberList.do"
				method="post">
				<div class="col-md-2 col-md-offset-3 text-right">
					<select name="findType" id="findType" class="form-control">
						<option value="5" SELECTED>:: 검색유형 ::</option>
						<option value="001">회원아이디</option>
						<option value="010">회원번호</option>
					</select>
				</div>
				<div class="col-md-3 text-left">
					<input type="text" name="findString" id="findString"
						class="form-control">
				</div>
				<div class="col-md-2  text-left">
					<button class="btn btn-primary">검 색</button>
				</div>
			</form>

			<form name="editF" id="editF" action="${pageContext.request.contextPath}/admin/memberEdit.do" method="post">
				<input type="hidden" name="idx" id="idx">
			</form>
		</div>
	</div>
</div>
<script type="text/javascript">
	var deluser = function(idx) {
		var yn = confirm(idx + '번 회원정보를 정말 삭제 합니까?');
		if (yn) {
			location.href = "memberDel.do?idx=" + idx;
		}
	}
	var Edituser = function(idx) {		
		$("#idx").val(idx);
		$("#editF").submit();
		//location.href="memberEdit.jsp?idx="+idx;
	}
</script>
<c:import url="/Foot.do" />











