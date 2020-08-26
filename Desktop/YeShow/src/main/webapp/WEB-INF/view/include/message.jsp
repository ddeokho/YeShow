<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%-- core 태그 라이브러리 : 핵심제어문(if, forEach...) 들이 있다--%>
<c:if test="${msg != null }">
<script type="text/javascript">
	alert('${msg}');
	location.href='${loc}';
</script>
</c:if>
<c:if test="${msg == null}">
<script type="text/javascript">
	location.href="${loc}";
</script>
</c:if>