<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/route/css/style.css">
    <%-- <script src="${pageContext.request.contextPath}/js/scripts.js" defer></script> --%>
    <title>登录</title>
</head>
<body>
<div class="login-container">
    <div class="card">
        <div class="card-log">
            <h2 style="color: blue; text-align: center;">登录</h2>
        </div>
        <form action="${pageContext.request.contextPath}/login-servlet" method="post">
            <label for="username">用户名：</label>
            <input type="text" id="username" name="username" required>
            <br>
            <label for="password">密码：</label>
            <input type="password" id="password" name="password" required>
            <br>
            <button type="submit">登录</button>
            <br>
        </form>
        <p>没有帐户？<a href="${pageContext.request.contextPath}/route/register.jsp">在这里注册</a></p>
        <div class="message"></div>
    </div>
</div>
</body>
</html>
