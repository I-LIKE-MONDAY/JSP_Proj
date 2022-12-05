<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="UTF-8" %>
<%@ page import="java.sql.*" %>
<%@ page import="org.apache.ibatis.jdbc.Null" %>
<!DOCTYPE html>
<html>
<head>
    <title>리뷰 상세 페이지</title>

    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/css/bootstrap.min.css">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootswatch@4.5.2/dist/minty/bootstrap.min.css" integrity="sha384-H4X+4tKc7b8s4GoMrylmy2ssQYpDHoqzPa9aKXbDwPoPUA3Ra8PA5dGzijN+ePnH" crossorigin="anonymous">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.1/jquery.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/js/bootstrap.bundle.min.js"></script>
    <%
        request.setCharacterEncoding("utf-8");

        String rvIdx = request.getParameter("rvIdx");
        String rvStayName = "";
        String rvCustomerNickname = "";
        int rvStar = 0;
        String rvCreateDt = "";
        String rvTitle = "";
        String rvContents = "";
        int rvHitCnt = 0;

    %>
    <script>
        $(document).ready(function () {
            $('#btn-back').on('click', function () {
                history.back();
            });

            $('#btn-delete').on('click', function () {
                var del = confirm('게시글을 삭제하시겠습니까?');
                if(del) {
                    location.href="sBoardDelete_process.jsp?rvIdx=<%=rvIdx%>";
                }
                else {
                }
            });

            $('#btn-update').on('click', function () {
                var upt = confirm('게시글을 수정하시겠습니까?');
                if(upt) {
                    location.href="sBoardUpdate.jsp?rvIdx=<%=rvIdx%>&customerNickname=aaaaa";
                }
                else {

                }
            });
        });
    </script>
</head>
<body>


<%@ include file="sDbconn.jsp"%>
<%@ include file="header.jsp"%>




<%-- 헤더, 푸터 파일 가져와서 사용 --%>


<main class="container mt-5">
    <div class="row">
        <div class="col-sm">
            <%--  업체명  --%>
            <div class="row my-3">
                <div class="col-sm">
                    <%
                        Connection conn = null;
                        ResultSet rs = null;
                        PreparedStatement pstmt = null;

                        try {
                            conn = DriverManager.getConnection(url, uid, upw);

                            String sql = "UPDATE review SET rv_hit_cnt = rv_hit_cnt + 1 WHERE rv_idx = ? ";
                            pstmt = conn.prepareStatement(sql);
                            pstmt.setString(1, rvIdx);
                            pstmt.executeUpdate(); // 현재 sql문데이터 한번 날려주고

                            sql = "SELECT rv_idx, rv_stay_name, rv_customer_nickname, rv_star, rv_create_dt, rv_title, rv_contents, rv_hit_cnt FROM review WHERE rv_idx = ? ";

                            pstmt = conn.prepareStatement(sql);
                            pstmt.setString(1, rvIdx);
                            rs = pstmt.executeQuery();

                            if (rs.next()) {
                                rvIdx = rs.getString("rv_idx");
                                rvStayName = rs.getString("rv_stay_name");
                                rvCustomerNickname = rs.getString("rv_customer_nickname");
                                rvStar = rs.getInt("rv_star");
                                rvCreateDt = rs.getString("rv_create_dt");
                                rvTitle = rs.getString("rv_title");
                                rvContents = rs.getString("rv_contents");
                                rvHitCnt = rs.getInt("rv_hit_cnt");
                    %>
                    <label for="rvStayName" class="form-label">업체명 : </label>
                    <input type="text" class="form-control" id="rvStayName" name="rvStayName" value="<%=rvStayName%>" readonly placeholder="업체명">
                </div>
            </div>
            <div class="row my-3">
                <div class="col-sm">
                    <label for="rvCustomerNickname" class="form-label">예약자명 : </label>
                    <input type="text" class="form-control" id="rvCustomerNickname" name="rvCustomerNickname" value="<%=rvCustomerNickname%>" readonly placeholder="옵션">
                </div>
            </div>
            <div class="row my-3">
                <%--  1박 금액  --%>
                <div class="col-sm">
                    <label for="rvStarImg" class="form-label">별점 : </label>
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
                    <input type="text" class="form-control text-end" id="rvStarImg" name="rvStarImg" value="<%=star%>" readonly placeholder="별점">
                </div>
                <%--  조회수  --%>
                <div class="col-sm">
                    <label for="rvHitCnt" class="form-label">조회수 : </label>
                    <input type="text" class="form-control text-end" id="rvHitCnt" name="rvHitCnt" value="<%=rvHitCnt%>" readonly placeholder="조회수">
                </div>
                <%--   등록 날짜  --%>
                <div class="col-sm">
                    <label for="rvCreateDt" class="form-label">등록 날짜 : </label>
                    <input type="text" class="form-control text-end" id="rvCreateDt" name="rvCreateDt" value="<%=rvCreateDt%>" readonly placeholder="등록 날짜">
                </div>
            </div>
            <div class="row my-3">
                <%--  글 내용  --%>
                <div class="col-sm">
                    <label for="rvContents" class="form-label">글 내용 : </label>
                    <textarea class="form-control" name="rvContents" id="rvContents" rows="10" placeholder="내용을 입력하세요" readonly><%=rvContents%></textarea>
                </div>
            </div>
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
            <div class="row my-3">
                <div class="col-sm d-flex justify-content-end">
                    <%
                        if(customerNicknameSession != null && customerNicknameSession.equals(rvCustomerNickname)){
                    %>
                    <button type="button" class="btn btn-success me-2" id="btn-update">수정하기</button>
                    <button class="btn btn-danger" id="btn-delete" type="button">삭제하기</button>
                    <%
                    } else if (customerNicknameSession != null){
                    %>
                    <div class="col-sm">
                        <button class="btn btn-secondary" type="button" id="btn-back">목록으로</button>
                    </div>
                    <%
                        }
                    %>
                </div>
            </div>
        </div>
    </div>
</main>

<%@ include file="footer.jsp"%>
</body>
</html>
