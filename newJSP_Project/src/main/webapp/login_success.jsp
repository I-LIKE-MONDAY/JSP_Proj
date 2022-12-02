<%--
  Created by IntelliJ IDEA.
  User: nmk02
  Date: 2022-12-01
  Time: 오후 10:01
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/css/bootstrap.min.css">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.1/jquery.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/js/bootstrap.bundle.min.js"></script>
</head>
<body>
<%
    String customerEmailSession = (String)session.getAttribute("customer_email");
    String customerNicknameSession = (String)session.getAttribute("customer_nickname");
%>
<h2>세션 설정이 성공했습니다</h2>
<h2><%=customerNicknameSession%>님, 환영합니다.</h2>
<h2><%=customerEmailSession%>님, 환영합니다.</h2>
</body>
</html>
