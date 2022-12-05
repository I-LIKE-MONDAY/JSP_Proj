<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="UTF-8" %>
<%@ page import="java.sql.*" %>
<%@ page import="com.mysql.cj.xdevapi.Statement" %>
<%@page import="java.net.URLEncoder"%>
<%@page import="java.net.URLDecoder"%>
<%@page import="java.util.*"%>
<!DOCTYPE html>
<html>
<head>
    <title>리뷰내역 페이지</title>

    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/css/bootstrap.min.css">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootswatch@4.5.2/dist/minty/bootstrap.min.css" integrity="sha384-H4X+4tKc7b8s4GoMrylmy2ssQYpDHoqzPa9aKXbDwPoPUA3Ra8PA5dGzijN+ePnH" crossorigin="anonymous">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.1/jquery.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/js/bootstrap.bundle.min.js"></script>
    <%@include file="sDbconn.jsp"%>
    <%-- 헤더, 푸터 파일 가져와서 사용 --%>
    <%@ include file="header.jsp"%>
    <script>
        $(document).ready(function () {
            $('#btn-back').on('click', function () {
                history.back();
            });
        });
    </script>
</head>

<body class="bg-light">
<%
    String logMsg ="";
    if (customerEmailSession == null) {
        logMsg = "로그인 하세요.";
    } else {
        logMsg = customerNicknameSession + "님, 환영합니다!";
    }
%>
<%
    int rvIdx = 0;
    String rvStayName = "";
    String rvCustomerNickname = "";
    int rvStar = 0;
    String rvCreateDt = "";

    Connection conn = null;
    ResultSet rs = null;
    PreparedStatement pstmt = null;
    try {
    conn = DriverManager.getConnection(url, uid, upw);

    String query = "SELECT rv_idx, rv_stay_name, rv_customer_nickname, rv_star, rv_create_dt FROM review ";
    query += "WHERE rv_deleted_yn = 'N' AND rv_customer_nickname = ? ";
    query += "ORDER BY rv_idx DESC ";

        pstmt = conn.prepareStatement(query);
        pstmt.setString(1, customerNicknameSession);
        rs = pstmt.executeQuery();

%>

<main class="container mt-5">
    <div class="row">
        <div class="col-sm">
            <table class="table table-hover table-striped">
                <thead>
                <tr>
                    <th>NO</th>
                    <th>업체명</th>
                    <th>예약자닉네임</th>
                    <th>별점</th>
                    <th>등록일</th>
                </tr>
                </thead>
                <tbody>

                <%

                    if (rs.next()) {
                        rvIdx = rs.getInt("rv_idx");
                        rvStayName = rs.getString("rv_stay_name");
                        rvCustomerNickname = rs.getString("rv_customer_nickname");
                        rvStar = rs.getInt("rv_star");
                        rvCreateDt = rs.getString("rv_create_dt");
                %>

                <tr>
                    <td><%=rvIdx%></td>
                    <td><a class="text-decoreation-none" href="reviewDetail.jsp?rvIdx=<%=rvIdx%>"><%=rvStayName%></a></td>
                    <td><%=rvCustomerNickname%></td>
                    <%
                        String star = "";
                        if (rvStar == 1) {
                            star = "★☆☆☆☆";
                        } else if (rvStar == 2) {
                            star = "★★☆☆☆";
                        }
                        else if (rvStar == 3) {
                            star = "★★★☆☆";
                        }
                        else if (rvStar == 4) {
                            star = "★★★★☆";
                        }
                        else if (rvStar == 5) {
                            star = "★★★★★";
                        }
                    %>
                    <td><%=star%></td>
                    <td><%=rvCreateDt%></td>
                </tr>

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
                            if (pstmt != null) {
                                pstmt.close();
                            }
                            if (conn != null) {
                                conn.close();
                            }
                        }
                %>
                </tbody>
            </table>
            <br>
            <div class="d-flex justify-content-center">
                <button class="btn btn-primary btn-lg" id="btn-back" type="button">돌아가기</button>
            </div>
        </div>
    </div>
</main>
<br><br><br><br><br><br><br><br><br><br><br><br><br>
<%@ include file="footer.jsp"%>


</body>
</html>
