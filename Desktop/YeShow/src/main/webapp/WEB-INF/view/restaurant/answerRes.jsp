<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 
<jsp:include page="/WEB-INF/view/Top.jsp"/>

  <div class="section">
      <div class="container">
        <div class="row">
          <div class="col-md-12 ">
          <h2>���� Ȯ��</h2><br>
            <table class="table">
              <thead>
                <tr>
                  <th width="3%">#</th>
                  <th width="15%">���� �̸�</th>
                  <th width="15%">���� ��ȣ</th>
                  <th width="45%">���� ��ġ</th>
                  <th width="13%">���� ��¥</th>
                  <th width="10%">���� �ð�</th>
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
            <a class="btn btn- btn-default" href="fcal.do?upnum=${upnum2 }">�߰������ϱ�</a>
            <a class="btn btn- btn-default" href="checkRes.do?idx=${loginUser.idx }">�������� Ȯ���ϱ�</a>
            <a class="btn btn-default" href="main.do">main���� ����</a>
          </div>
        </div>
      </div>
    </div>


<jsp:include page="/WEB-INF/view/Foot.jsp"/>