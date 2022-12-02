<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="UTF-8" %>



<!DOCTYPE html>
<html>
<head>
  <%@ include file="header.jsp"%>
  <title>마이페이지</title>
  <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.1/jquery.min.js"></script>
  <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/js/bootstrap.bundle.min.js"></script>

  <%
    String a1 = null;
    if (customerEmailSession == null) {
      response.sendRedirect("login.jsp");

    }
    else {
      a1 = customerEmailSession + "님의 마이페이지";
    }
  %>
</head>
<body>


<h2 class="text-center"><%=a1%></h2>
<h2 class="text-center"><%=customerEmailSession%></h2>
<h2 class="text-center"><%=customerNicknameSession%></h2>
<%@ include file="footer.jsp"%>
</body>
</html>
