<%@ page import="java.sql.PreparedStatement" %>
<%@ page import="java.sql.ResultSet" %>
<%@ page import="java.sql.DriverManager" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<head>
    <%-- 헤더, 푸터 파일 가져와서 사용 --%>
    <%@include file="sDbconn.jsp"%>
    <%@ include file="header.jsp"%>
    <title>글쓰기 페이지</title>

    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/css/bootstrap.min.css">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.1/jquery.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/js/bootstrap.bundle.min.js"></script>

    <script>
        $(document).ready(function () {
            $('#btn-submit').on('click', function () {
                const frm = $('#frm');

                if ($('#stay-cost').val() == '') {
                    alert('금액을 입력하세요');
                }
                else if ($('#stay-option').val() == '') {
                    alert('옵션을 입력하세요');
                }
                else if ($('#stay-contents').val() == '') {
                    alert('글 내용을 입력하세요');
                }
                else {
                    frm.submit();
                }
            });

            $('#btn-back').on('click', function () {
                history.back();
            });
        });

    </script>

        <%
            String a1 = null;
            if (customerEmailSession == null) {
            response.sendRedirect("login.jsp");
            }
        %>
</head>
<body>






<main class="container mt-5">
    <div class="row">
        <div class="col-sm-6 mx-auto">
            <form action="sBoardWrite_process.jsp" method="post" id="frm">
                <div class="my-3">
                    <label class="form-label" for="customer-nickname">업체명 : </label>
                    <input type="text" class="form-control" id="customer-nickname" name="customerNickname" value="<%=customerNicknameSession%>" placeholder="업체명을 입력하세요">
                </div>
                <div class="my-3">
                    <label class="form-label" for="user-id">이메일 : </label>
                    <input type="text" class="form-control" id="user-id" name="userId" value="<%=customerEmailSession%>" placeholder="이메일을 입력하세요" readonly>
                </div>
                <div class="my-3">
                    <label class="form-label" for="stay-cost">1박 금액 : </label>
                    <input type="text" class="form-control" id="stay-cost" name="stayCost" placeholder="1박 금액을 입력하세요">
                </div>
                <div class="my-3">
                    <label class="form-label" for="stay-option">옵션 : </label>
                    <input type="text" class="form-control" id="stay-option" name="stayOption" placeholder="옵션을 입력하세요">
                </div>
                <div class="my-3">
                    <label class="form-label" for="stay-contents">글 내용 : </label>
                    <textarea class="form-control" name="stayContents" id="stay-contents" rows="10" placeholder="내용을 입력하세요"></textarea>
                </div>
                <div class="d-grid gap-2 my-3">
                    <button class="btn btn-primary" type="button" id="btn-submit">글쓰기</button>
                    <button class="btn btn-secondary" type="button" id="btn-back">돌아가기</button>
                </div>
            </form>
        </div>
    </div>
</main>

<%@ include file="footer.jsp"%>
</body>
</html>
