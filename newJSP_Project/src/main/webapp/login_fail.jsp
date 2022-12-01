<%--
  Created by IntelliJ IDEA.
  User: nmk02
  Date: 2022-12-01
  Time: 오후 10:06
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/css/bootstrap.min.css">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.1/jquery.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/js/bootstrap.bundle.min.js"></script>
    <script>
        $(document).ready(function () {
            $('#btn-back').on('click', function () {
                history.back();
            });
        });
    </script>
</head>
<body>
<div class="d-grid">
    <h2>로그인에 실패했습니다.</h2>
    <button type="button" class="form-floating mt-2 btn btn-light" id="btn-back">돌아가기</button>
</div>
</body>
</html>
