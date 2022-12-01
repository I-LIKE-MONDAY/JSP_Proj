<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="UTF-8" %>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@ include file="sDbconn.jsp"%>
<%@ page import="java.sql.*" %>

<%
    request.setCharacterEncoding("UTF-8");

    String customerEmail = request.getParameter("customerEmail");
    String customerPw = request.getParameter("customerPw");
    String comYn = request.getParameter("comYn");
    String customerNickname = request.getParameter("customerNickname");

    Connection conn = null;
    PreparedStatement pstmt = null;
    ResultSet rs = null;

    String sql = "select * from customers where customer_email = ? and customer_pw = ? and com_yn = ? ";

    try{

        conn = DriverManager.getConnection(url, uid, upw);

        pstmt = conn.prepareStatement(sql);
        pstmt.setString(1, customerEmail);
        pstmt.setString(2, customerPw);
        pstmt.setString(3, comYn);

        // sql실행
        rs = pstmt.executeQuery();

        if(rs.next()){ // 로그인 성공(인증의 수단 session)
            customerEmail = rs.getString("customer_email");
            customerNickname = rs.getString("customer_nickname");

            session.setAttribute("customer_email", customerEmail);
            session.setAttribute("customer_nickname", customerNickname);


            response.sendRedirect("login_success.jsp"); // 페이지이동

        } else{ // 로그인 실패
            response.sendRedirect("login_fail.jsp"); // 실패 페이지
        }
    } catch(Exception e){
        e.printStackTrace();
        response.sendRedirect("login.jsp"); // 에러가 난 경우도 리다이렉트
    } finally{
        try{
            if(conn != null) conn.close();
            if(pstmt != null) pstmt.close();
            if(rs != null) rs.close();
        } catch(Exception e){
            e.printStackTrace();
        }
    }
%>