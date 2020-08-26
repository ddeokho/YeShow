<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 
<jsp:include page="/WEB-INF/view/Top.jsp"/>

  <div class="section">
      <div class="container">
        <div class="row">
          <div class="col-md-12 ">
          <h2>예약 확인</h2><br>
            <table class="table">
              <thead>
                <tr>
                  <th width="3%">#</th>
                  <th width="15%">가게 이름</th>
                  <th width="15%">가게 번호</th>
                  <th width="45%">가게 위치</th>
                  <th width="13%">예약 날짜</th>
                  <th width="10%">예약 시간</th>
                </tr>
              </thead>
              <tbody>
                <tr>
                  <td></td>
                  <td>${resname }</td>
                  <td>${phon }</td>
                  <td>${location }</td>
                  <td>${resdate }</td>
                  <td>${restime }</td>
                 
                </tr>
              </tbody>
            </table>
            <a class="btn btn- btn-default" href="fcal.do?upnum=${upnum2 }">추가예약하기</a>
            <a class="btn btn- btn-default" href="checkRes.do?idx=${loginUser.idx }">예약정보 확인하기</a>
            <a class="btn btn-default" href="main.do">main으로 가기</a>
          </div>
        </div>
      </div>
    </div>


<jsp:include page="/WEB-INF/view/Foot.jsp"/>