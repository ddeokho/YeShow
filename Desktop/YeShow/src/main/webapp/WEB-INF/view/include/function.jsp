<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%-- 사용자 정의 메소드를 모아두는 페이지
	-> 메소드를 구성하려면 선언문(<%! %>)안에서 해야한다.
	   그런데 선언문 안에서는 내장 객체들을 사용할 수 없다.(내장객체들은 지역변수)
 --%>
<%!
	public void goUrl(String msg, String loc, JspWriter o)
			throws Exception{
		o.println("<script>");
		o.println("alert('"+ msg +"')");
		o.println("location.href='"+ loc +"'");
		o.println("</script>");
	}
	public void goBack(String msg, JspWriter o) throws Exception{
		o.println("<script>");
		o.println("alert('"+ msg +"')");
		o.println("history.back()");
		o.println("</script>");
	}

%>
