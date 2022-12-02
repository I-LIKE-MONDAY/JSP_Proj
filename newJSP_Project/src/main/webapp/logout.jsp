<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<script>
  alert('로그아웃 되었습니다.');
  location.href='sBoardList.jsp';
</script>
<%
  //인증정보(세션삭제)
  //리다이렉트

  session.invalidate();
  response.sendRedirect("sBoardList.jsp");
%>