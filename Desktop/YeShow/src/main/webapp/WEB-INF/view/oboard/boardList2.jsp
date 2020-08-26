<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!--  -->
<c:import url="/Top.do"/>
<div align="center" class="container">
<hr width="500" color="#efefef">
<h3>자유게시판 글목록</h3>
<br>
<a href="write.do">글쓰기</a>|
<a href="../index.do">HOME</a>|
<hr width="500" color="#efefef">
 <%-- ${boardList}  --%>
<p></p>
<!-- pageSize관련 form시작==== -->
<form name="listF">
	<input type="hidden" name="cpage"
	 value="${paging.cpage}">
	<select name="pageSize" onchange="submit()">
	<option value="5" SELECTED>
		::페이지 SIZE 선택::
	</option>
	<c:forEach  var="ps"  begin="5" end="20" step="5">
		<option value="${ps}">페이지 사이즈 ${ps}</option>
	</c:forEach>	
	</select>
</form>
<!-- form end =========== -->
<p></p>

<table class="table table-striped table-condensed">
	<tr>
		<th width="10%">순번</th>
		<th width="40%">제목</th>
		<th width="20%">글쓴이</th>
		<th width="20%">날짜</th>
		<th width="10%">조회수</th>
	</tr>
	<!-- ---------------------------- -->
	<c:if test="${boardList eq null or empty boardList }">
		<tr>
			<td colspan="5">게시글이 없습니다.</td>
		</tr>
	</c:if>
	<c:if test="${boardList ne null and not empty boardList }">
	<c:forEach var="board" items="${boardList}">
	<tr onmouseover
	="this.style.backgroundColor='#EEFFFF'"
	 onmouseout="this.style.backgroundColor='white'">
		<td>${board.idx}</td>
		<td align="left" style="padding-right:10px">
		<a href="view.do?idx=${board.idx}">		
		${board.subject}  
		</a>
		<c:if test="${board.newImg <1}">
	<span class="label label-warning pull-right">New</span>
		</c:if>
		 
		</td>
		<td>
		<a href="mailto:${board.email}">
		${board.name}
		</a>
		</td>
		<td>
		<fmt:formatDate value="${board.wdate}"
		pattern="yyyy-MM-dd"/>
			
		</td>
		<td>${board.readnum}</td>
	</tr>
	</c:forEach>
	</c:if>
	<!-- ---------------------------- -->
	<tr>
		<td colspan="5" align="center">
		<hr width="500" color="#efefef">
		</td>
	</tr>
	<!-- m06-441-278 -->
	<tr>
		<td colspan="3" align="center">
			<ul class="pagination pagination-sm">
<c:if test="${paging.prevBlock>0}">
<li><a href="list.do?cpage=${paging.prevBlock}">
 이전${paging.pagingBlock}개 </a></li>
</c:if>	
				
<c:forEach var="i" 
begin="${paging.prevBlock+1}" end="${paging.nextBlock-1}">
  <c:if test="${i <= paging.pageCount }">
			<c:if test="${i eq paging.cpage}">
				<li class="active"><a>${i}</a></li>
			</c:if>
			<c:if test="${i ne paging.cpage}">
			<li><a href="list.do?cpage=${i}&pageSize=${pageSize}">${i}</a></li>
			</c:if>
   </c:if>
</c:forEach>
<c:if test="${paging.nextBlock<=paging.pageCount}">
<li><a href="list.do?cpage=${paging.nextBlock}">
 이후${paging.pagingBlock}개 </a></li>
</c:if>	
			</ul>
		</td>
		<td colspan="2" align="center">
		<font color=red><b>
		${paging.cpage}
		</b></font>
		/
		${paging.pageCount}
		<br>
		총게시물수: <font color=blue><b>
		${paging.totalCount}개
		</b></font>
		</td>
	</tr>
</table>
<br>
<!-- 검색 form시작------------------------------- -->
<form name="bbsFind" action="list.do">
	<select name="findType">
		<option value="subject" selected>제목</option>
		<option value="name">글쓴이</option>
		<option value="content">글내용</option>
	</select>
	<input type="text" size="20"
	 name="findString" class="box">
	 <input type="button" onclick="findSearch()"
	  value="검색">
</form>
<!-- ------------------------------------------ -->
</div>
<c:import url="/Foot.do"/>