<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="UTF-8" %>
<%@ page import="java.sql.*" %>
<%@ page import="com.mysql.cj.xdevapi.Statement" %>
<%@page import="java.net.URLEncoder"%>
<%@page import="java.net.URLDecoder"%>
<%@page import="java.util.*"%>
<!DOCTYPE html>
<html>
<head>
    <title>랭킹 페이지</title>

    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/css/bootstrap.min.css">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootswatch@4.5.2/dist/minty/bootstrap.min.css" integrity="sha384-H4X+4tKc7b8s4GoMrylmy2ssQYpDHoqzPa9aKXbDwPoPUA3Ra8PA5dGzijN+ePnH" crossorigin="anonymous">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.1/jquery.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/js/bootstrap.bundle.min.js"></script>
    <%@include file="sDbconn.jsp"%>
    <%-- 헤더, 푸터 파일 가져와서 사용 --%>
    <%@ include file="header.jsp"%>
    <style>
        /*th, td, h2 {*/
        /*    vertical-align : middle;*/
        /*}*/
    </style>
</head>

<body class="bg-light">
<%int rank = 0; %>
<%
    Connection conn = null;
    java.sql.Statement stmt = null;
    ResultSet rs = null;

    String query = "SELECT board_idx, customer_nickname, stay_cost, stay_option, board_create_dt, hit_cnt FROM board ";
    query += "WHERE deleted_yn = 'N' ";
    query += "ORDER BY hit_cnt DESC ";
%>
<%
    String logMsg ="";
    if (customerEmailSession == null) {
        logMsg = "로그인 하세요.";
    } else {
        logMsg = customerNicknameSession + "님, 환영합니다!";
    }
%>
<main class="container mt-5">
    <div class="d-flex justify-content-end">
        <h4 class="text-muted me-5" id="welcome"><%=logMsg%></h4>
        <button class="btn btn-secondary mb-3" type="button" id = "write-page">글쓰기</button>
    </div>
    <div class="row">
        <div class="col-sm">
            <table class="table">
                <colgroup>
                    <col style="width: 30px" class="mb-5">
                    <col style="width: 130px">
                    <col style="width: 60px">
                    <col style="width: 150px">
                </colgroup>
                <%
                    try {
                        conn = DriverManager.getConnection(url, uid, upw);
                        stmt = conn.createStatement();
                        rs = stmt.executeQuery(query);

                        while (rs.next()) {
                            int boardIdx = rs.getInt("board_idx");
                            String customerNickname = rs.getString("customer_nickname");
                            int stayCost = rs.getInt("stay_cost");
                            String stayOption = rs.getString("stay_option");
                            String boardCreateDt = rs.getString("board_create_dt");
                            int hitCnt = rs.getInt("hit_cnt");
                            rank++;
                %>
                <thead>

                <tr class="text-center" >
                    <%
                        if(rank < 4){
                    %>
                    <td rowspan="4" style = 'vertical-align : middle; background-size:110px; background-image: url("images/minirank2.png");background-repeat: no-repeat; background-position-x: center; background-position-y: center'><h2><%=rank%>위</h2></td>
                    <%
                    }
                    else {
                    %>
                    <td rowspan="4" style="vertical-align : middle"><h2><%=rank%>위</h2></td>
                    <%
                        }
                    %>
                    <td rowspan="4"><a href="sBoardDetail.jsp?boardIdx=<%=boardIdx%>"><img src="images/logo.png" width="220" height="220"></a></td>
                    <td colspan="2"><a class="text-decoration-none text-black" href="sBoardDetail.jsp?boardIdx=<%=boardIdx%>"><h2><%=customerNickname%></h2></a></td>
                </tr>
                <tr>
                    <td colspan="2">1박 : <%=stayCost%>원</td>
                </tr>
                <tr>
                    <td colspan="2">제공 옵션 : <%=stayOption%></td>
                </tr>
                <tr>
                    <td>조회수 : <%=hitCnt%></td>
                    <td class="text-end"><%=boardCreateDt%></td>
                </tr>
                </thead>
                <%
                        }
                    }
                    catch (SQLException e) {
                        out.println("SQLException : " + e.getMessage());
                    }
                    finally {
                        if (rs != null) {
                            rs.close();
                        }
                        if (stmt != null) {
                            stmt.close();
                        }
                        if (conn != null) {
                            conn.close();
                        }
                    }
                %>
            </table>
        </div>
        <div>
            <ul class="pagination pagination-lg justify-content-center">
                <li class="page-item disabled">
                    <a class="page-link" href="#">&laquo;</a>
                </li>
                <li class="page-item active">
                    <a class="page-link" href="#">1</a>
                </li>
                <li class="page-item">
                    <a class="page-link" href="#">2</a>
                </li>
                <li class="page-item">
                    <a class="page-link" href="#">3</a>
                </li>
                <li class="page-item">
                    <a class="page-link" href="#">4</a>
                </li>
                <li class="page-item">
                    <a class="page-link" href="#">5</a>
                </li>
                <li class="page-item">
                    <a class="page-link" href="#">&raquo;</a>
                </li>
            </ul>
        </div>



    </div>
</main>

<%@ include file="footer.jsp"%>


</body>
</html>
