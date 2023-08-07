<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<nav class="navbar navbar-expand-md custom-navbar">
  <!-- Brand -->
  <a class="navbar-brand" href="${pageContext.request.contextPath}/home">Cashbook</a>

  <!-- Toggler/collapsibe Button -->
  <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#collapsibleNavbar">
    <span class="navbar-toggler-icon">버튼</span>
  </button>

  <!-- Navbar links -->
  <div class="collapse navbar-collapse" id="collapsibleNavbar">
    <ul class="navbar-nav">
      
      <%
        if (session.getAttribute("loginMember") != null) {
      %>
      	<li class="nav-item">
        <a class="nav-link" href="${pageContext.request.contextPath}/calendar">calendar</a>
     	</li>
        <li class="nav-item">
          <a class="nav-link" href="${pageContext.request.contextPath}/logout">로그아웃</a>
        </li>
        <li class="nav-item">
          <a class="nav-link" href="${pageContext.request.contextPath}/memberOne">회원정보</a>
        </li>
      <%
        } else {
      %>
        <li class="nav-item">
          <a class="nav-link" href="${pageContext.request.contextPath}/login">로그인</a>
        </li>
      <%
        }
      %>
    </ul>
  </div>
</nav>