<%--
  Created by IntelliJ IDEA.
  User: _SaiNt
  Date: 05-May-23
  Time: 19:45
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="css/style.css">
    <%--  <script src="js/scripts.js" defer></script>--%>
    <title>仪表板</title>
</head>

<body>
<header>
    <nav class="nav">
        <ul>
            <li><a href="dashboard.jsp">仪表板</a></li>
            <li><a href="results.jsp">结果</a></li>
            <li><a href="history.jsp">历史</a></li>
            <li><a href="contact.jsp">联系我们</a></li>
            <li class="login-register"><a href="../index.jsp">登出</a></li>
            <!-- <li class="login-register"><a href="register.html">Register</a></li> -->
        </ul>
    </nav>
</header>
    <main>
        <div class="card">
            <div class="card">
                <h2>欢迎</h2>
            </div>
            <div class="card">
                <h2>图信息</h2>
                <div class="graph-info">
                    <%= session.getAttribute("graphInfo") %>
                </div>
            </div>
            <div class="login-container">
                <div class="card">
                    <form action="../bestroute-servlet" method="post">
                        <label for="start">起点</label>
                        <input type="text" id="start" name="start" required>
                        <br>
                        <label for="end">终点</label>
                        <input type="text" id="end" name="end" required>
                        <br>
                        <button type="submit">寻找最佳路线</button>
                        <br>
                    </form>
                </div>
            </div>
        </div>
    </main>
</div>
<footer>
    <div class="footer-container">
        <div class="footer-col">
            <h4>信息</h4>
            <ul>
                <li><a href="#">关于我们</a></li>
                <li><a href="#">隐私政策</a></li>
                <li><a href="#">条款和条件</a></li>
            </ul>
        </div>
        <div class="footer-col">
            <h4>我的账户</h4>
            <ul>
                <li><a href="#">登录</a></li>
                <li><a href="#">登记</a></li>
                <li><a href="#">我的历史</a></li>
            </ul>
        </div>
        <div class="footer-col">
            <h4>联系我们</h4>
            <ul>
                <li>电话：<a href="#">+1-234-567-8901</a></li>
                <li>电子邮件： <a href="mailto:info@gamers.com">info@gamers.com</a></li>
                <li>地址：<a href="#">1234 美国得克萨斯州大街</a></li>
            </ul>
        </div>
    </div>
</footer>
</body>

</html>
