<%--
  Created by IntelliJ IDEA.
  User: _SaiNt
  Date: 05-May-23
  Time: 19:42
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="css/style.css">
    <!--    <script src="../js/register.js" defer></script>-->
    <title>登记</title>
</head>

<body>
<div class="register-container">
    <div class="card">
        <div class="card-log">
            <h2 style="color: blue; text-align: center;">注册我们</h2>
        </div>
        <form action="../register-servlet" method="post">
            <label for="username">用户名：</label>
            <input type="text" id="username" name="username" required>
            <br>
            <label for="password">密码：</label>
            <input type="password" id="password" name="password" required>
            <label for="email">电子邮件：</label>
            <input type="email" id="email" name="email" required>
            <br>
            <label for="phone">电话号码：</label>
            <input type="tel" id="phone" name="phone" required>
            <br>
            <button type="submit">提交</button>
            <button type="reset">清除</button>
        </form>
        <p style="text-align: right;">已有帐户？<a href="../index.jsp">在此登录</a></p>
        <div class="message"></div>
    </div>
</div>
</body>

</html>
