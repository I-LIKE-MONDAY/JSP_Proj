<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="UTF-8" %>
<%@ page import="java.sql.*" %>
<!DOCTYPE html>
<html>
<head>
    <title>글 목록</title>

    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/css/bootstrap.min.css">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.1/jquery.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/js/bootstrap.bundle.min.js"></script>

</head>
<body>
<%@ include file="dbconn.jsp"%>
<header class="container mt-3">
    <div class="p-5 mb-4 bg-light rounded-3">
        <div class="container-fluid py-4">
            <h1 class="text-center">게시물 리스트 페이지</h1>
        </div>
    </div>
</header>

<main class="container mt-4">
    <div class="row">
        <div class="col-sm">
            <table class="table table-hover table striped">
                <thead>
                <tr>
                    <th>글번호</th>
                    <th>글제목</th>
                    <th>글쓴이</th>
                    <th>등록시간</th>
                    <th>조회수</th>
                </tr>
                </thead>
                <tbody>
                <%
                    PreparedStatement pstmt = null;
                    ResultSet rs = null;

                    try {
                        String sql = "SELECT idx, title, user_id, create_dt, hit_cnt FROM t_board WHERE deleted_yn = 'N' order by idx DESC";
                        pstmt = conn.prepareStatement(sql);
                        rs = pstmt.executeQuery();

                        while (rs.next()) {
                            int idx = rs.getInt("idx");
                            String title = rs.getString("title");
                            String userId = rs.getString("user_id");
                            String createDt = rs.getString("create_dt");
                            int cnt = rs.getInt("hit_cnt");
                %>

                    <tr>
                        <td><%=idx%></td>
                        <td><a href="tBoardDetail.jsp?idx=<%=idx%>"><%=title%></a></td>
                        <td><%=userId%></td>
                        <td><%=createDt%></td>
                        <td><%=cnt%></td>
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
            <div class="d-flex justify-content-end">
                <a href="write.jsp" class="btn btn-info">글쓰기</a>
            </div>
        </div>
    </div>
</main>


<footer class="container-fluid mt-5 p-5 border-top">
    <p class="lead text-muted text-center">made by bitc java505</p>
</footer>
</body>
</html>
