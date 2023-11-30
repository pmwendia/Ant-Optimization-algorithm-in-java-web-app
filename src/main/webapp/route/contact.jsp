<%--
  Created by IntelliJ IDEA.
  User: _SaiNt
  Date: 05-May-23
  Time: 19:46
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="css/style.css">
    <!-- Include Font Awesome CSS in your HTML file -->
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/css/all.min.css" />
<%--    <script src="../js/scripts.js" defer></script>--%>
    <title>联系我们</title>
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
    <div class="container-con">
        <div class="card">
            <h2 style="color: rgb(43, 255, 0); font-size: xx-large;"><b>联系我们</b></h2>
            <p style="font-size: large;">如果您有任何问题、意见或疑虑，请填写表格
                下面，我们会回来
                尽快给你。
            </p>
            <br>
            <br>
        </div>
        <div class="contact-container">
            <div class="card">
                <form action="#" method="POST">
                    <h2 style="color: blue;">给我们留言</h2>
                    <label for="name">姓名：</label>
                    <input type="text" id="name" name="name" required>

                    <label for="email">电子邮件：</label>
                    <input type="email" id="email" name="email" required>

                    <label for="message">信息：</label>
                    <textarea id="message" name="message" rows="5" required></textarea>

                    <button type="submit">发送</button>
                </form>
            </div>
        </div>
        <br>
        <div class="card">
            <h2 style="color: red;">经常问的问题</h2>
            <div class="faq">
                <div class="card">
                    <ul>
                        <div class="card">
                            <li>
                                <h4 style="color: blue;">运输需要多长时间？</h4>
                                <p>运送通常需要 3-5 个工作日，具体取决于您所在的位置。</p>
                            </li>
                        </div>
                        <div class="card">
                            <li>
                                <h4 style="color: blue;">如果我不满意可以退货吗？</h4>
                                <p>是的，如果您对产品不满意，我们会在购买后 30 天内接受退货
                                    你的
                                    命令。</p>
                            </li>
                        </div>
                        <div class="card">
                            <li>
                                <h4 style="color: blue;">你们提供国际航运服务吗？</h4>
                                <p>是的，我们提供到特定国家/地区的国际运输服务。 请联系我们
                                    更多的
                                    国际航运信息。</p>
                            </li>
                        </div>
                    </ul>
                </div>
            </div>
        </div>
        <div class="card">
            <div class="social-media">
                <h3 style="color: rgb(255, 136, 0);">在社交媒体上关注我们</h3>
                <ul>
                    <li><a href="#"><i class="fab fa-facebook"></i></a></li>
                    <li><a href="#"><i class="fab fa-instagram"></i></a></li>
                    <li><a href="#"><i class="fab fa-twitter"></i></a></li>
                    <li><a href="#"><i class="fab fa-linkedin"></i></a></li>
                </ul>
            </div>
        </div>
    </div>
</main>

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