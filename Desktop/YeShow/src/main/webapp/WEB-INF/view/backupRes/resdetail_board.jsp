<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 
<jsp:include page="/WEB-INF/view/Top.jsp"/>
 

  
     <div class="section">
      <div class="container">
        <div class="row">
          <div class="col-md-6">
            <div id="fullcarousel-example" data-interval="false" class="carousel slide"
            data-ride="carousel">
              <div class="carousel-inner">
                <div class="item active">
                  <img src="http://pingendo.github.io/pingendo-bootstrap/assets/placeholder.png">
                  <div class="carousel-caption">
                    <h2>Title</h2>
                    <p>Description</p>
                  </div>
                </div>
              </div>
              <a class="left carousel-control" href="#fullcarousel-example" data-slide="prev"><i class="icon-prev fa fa-angle-left"></i></a>
              <a class="right carousel-control" href="#fullcarousel-example" data-slide="next"><i class="icon-next fa fa-angle-right"></i></a>
            </div>
          </div>
          <div class="col-md-6">
            <h2>$</h2>
            <input type="text" name="upresnum" id="upresnum" value="${detailRes.upnum }">
            <p>Lorem ipsum dolor sit amet, consectetur adipisici elit,
              <br>sed eiusmod tempor incidunt ut labore et dolore magna aliqua.
              <br>Ut enim ad minim veniam, quis nostrud</p>
            <img class="img-responsive" src="http://maps.googleapis.com/maps/api/staticmap?center=Tombouctou,Mali&amp;zoom=12&amp;size=200x200&amp;sensor=false">
            <br>
          </div>
        </div>
      </div>
    </div>
   <br>
   
    <div class="section">
      <div class="container">
        <div class="row">
          <div class="col-md-12">
            <ul class="breadcrumb">
              <li class="active">
                <a href="#" >Menu</a>
              </li>
              <li>
                <a href="#">review</a>
              </li>
              <li>
              	<a href="#">member board</a>
              </li>
            </ul>
          </div>
        </div>
      </div>
    </div>   
   
   <c:if test="">
   	
   </c:if>
   <c:if test="">
   </c:if>
   
    <div class="section">
      <div class="container">
        <div class="row">
          <div class="col-md-2">
            <div class="thumbnail">
              <img src="http://pingendo.github.io/pingendo-bootstrap/assets/placeholder.png"
              class="img-responsive">
              <div class="caption">
                <h3>Thumbnail</h3>
                <p>Cras justo odio, dapibus ac facilisis in, egestas eget quam.</p>
              </div>
            </div>
            <a class="btn btn-primary btn-sm">Click me</a>
          </div>
          <div class="col-md-2">
            <div class="thumbnail">
              <img src="http://pingendo.github.io/pingendo-bootstrap/assets/placeholder.png"
              class="img-responsive">
              <div class="caption">
                <h3>Thumbnail</h3>
                <p>Cras justo odio, dapibus ac facilisis in, egestas eget quam.</p>
              </div>
            </div>
          </div>
          <div class="col-md-2">
            <div class="thumbnail">
              <img src="http://pingendo.github.io/pingendo-bootstrap/assets/placeholder.png"
              class="img-responsive">
              <div class="caption">
                <h3>Thumbnail</h3>
                <p>Cras justo odio, dapibus ac facilisis in, egestas eget quam.</p>
              </div>
            </div>
          </div>
       
        
        <br><br>
        
        <div class="row">
          <div class="col-md-12">
            <a class="btn btn-block btn-lg btn-primary">Reservation</a>
          </div>
        </div>
        
        
      </div>
    </div> 
 </div>
 
 
 
 
 
 
  
    
<jsp:include page="/WEB-INF/view/Foot.jsp"/>