<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<head>
    <title>회원가입</title>

    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/css/bootstrap.min.css">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.1/jquery.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/js/bootstrap.bundle.min.js"></script>
</head>
<body>
<main class="container mt-5 border border-info border-3 rounded-3">
    <div class="row">
        <form action="join_process.jsp" method="post">
            <div class="col-sm-6 mx-auto">
                <div class="form-floating my-3">
                    <input type="text" class="form-control" id="user-id" name="userId" placeholder="아이디를 입력하세요">
                    <label for="user-id">ID</label>
                </div>
                <div class="form-floating my-3">
                    <input type="text" class="form-control" id="user-pw" name="userPw" placeholder="아이디를 입력하세요">
                    <label for="user-pw">PASSWORD</label>
                </div>
                <div class="form-floating my-3">
                    <input type="text" class="form-control" id="user-name" name="userPw" placeholder="이름을 입력하세요">
                    <label for="user-name">NAME</label>
                </div>
                <div class="d-grid gap-2">
                <button type="submit" class="form-floating my-3 btn btn-info btn-lg">회원가입</button>
                </div>
            </div>
        </form>
    </div>
</main>
</body>
</html>
