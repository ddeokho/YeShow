<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:import url="/Top.do"/>
<!-- <script type="text/javascript">
var find_pwd1=function(){
	findpwd2.submit();
}
</script> -->
<br>
<br>
<br>
<c:if test="${pwd1==null}">
<div class="container">
	<div class="page-header text-center" >
		<h1>아이디와 Email이 일치하는 회원이 없습니다.</h1>
	</div>
</div>
</c:if>

<c:if test="${pwd1 !=null}">
	<div class="page-header text-center">
		<h1>회원님의 비밀번호<br><br>
			<b style='color:red;font-size:40pt;'>${pwd1}</b>
		</h1>
	</div>
</c:if>


<c:import url="/Foot.do"/>
