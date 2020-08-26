<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<% 
	String Ctx=request.getContextPath();
%> 
<c:import url="/Top.do"/>
<div align="center" class="container">
<script src="<%=Ctx%>/js/jquery-1.12.3.min.js" ></script>
<script type="text/javascript">

$(function() {
    $('#mb_select').change(function(){
        if($('#mb_select').val() == '리뷰글') {
            $('#show').hide();
        
        }else{
        	$('#show').show(); 
        	
        }
    });
});  


</script>
<hr width="500" color="#efefef">
<h3>자유게시판 글목록 </h3>
<c:if test="${paging.findString!=null 
			and paging.findString !=''}">
	<h3>검색어: ${paging.findString}</h3>
</c:if>
<br>
<a href="write.do">글쓰기</a>|
<a href="main.do">HOME</a>|
<select name="mb_select" id="mb_select">
 	<optgroup label="::말머리 선택::">
	 	<option value="자유글">자유글</option>
	 	<option value="리뷰글">리뷰글</option>
 	</optgroup>
</select>
<hr width="500" color="#efefef">
 <%-- ${boardList}  --%>
<p></p>
<!-- pageSize관련 form시작==== -->
<form name="listF">
	<input type="hidden" name="cpage"
	 value="${paging.cpage}">
	<input type="hidden" name="findType"
	 value="${paging.findType}"> 
	<input type="hidden" name="findString"
	 value="${paging.findString}"> 
	 
	<select name="pageSize" onchange="submit()">
	<option value="5" SELECTED>
		::페이지 SIZE 선택::
	</option>
	<c:forEach  var="ps"  begin="5" end="20" step="5">
		<option value="${ps}"
		<c:if test="${pageSize==ps}">selected</c:if> >
		페이지 사이즈 ${ps}</option>
	</c:forEach>	
	</select>
</form>
<!-- form end =========== -->
<p></p>

<table id="show" class="table table-striped table-condensed">
	<tr>
		<th width="5%">번호</th>
		<th width="10%">말머리</th>
		<th width="35%">제목</th>
		<th width="15%">글쓴이</th>
		<th width="15%">날짜</th>
		<th width="5%">조회</th>
		<th width="5%">추천</th>
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
		<td>${board.mb_num}</td>
		<td>${board.mb_select}</td>
		<td align="left" style="padding-right:10px">
		<a href="view.do?mb_num=${board.mb_num}">		
		${board.mb_title}  
		</a>
		</td>
		<td>
		${board.mb_userid}
		</td>
		<td>
		<fmt:formatDate value="${board.mb_indate}"
		pattern="yyyy-MM-dd"/>
			
		</td>
		<td>${board.mb_hits}</td>
		<td>${board.mb_recommand}</td>
	</tr>
	</c:forEach>
	</c:if>
	
	<!-- ---------------------------- -->
	<tr>
		<td colspan="7" align="center">
		<hr width="500" color="#efefef">
		</td>
	</tr>
	<tr>
		<td colspan="3" align="center">
			${pageNavi}
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
<form name="bbsFind" action="NewboardList.do">
	<select name="findType">
		<option value="1" selected>제목</option>
		<option value="2">글쓴이</option>
		<option value="3">글내용</option>
	</select>
	<input type="text" size="20" 
	 placeholder="${paging.findString}"
	 name="findString" class="box">
	 <input type="button" onclick="findSearch()"
	  value="검색">
</form>
<!-- ------------------------------------------ -->
</div>

<script type="text/javascript">
var findSearch=function(){
	if(!bbsFind.findString.value){
		alert("검색어를 입력하세요");
		bbsFind.findString.focus();
		return;
	}
	bbsFind.submit();
}
</script>

<c:import url="/Foot.do"/>





