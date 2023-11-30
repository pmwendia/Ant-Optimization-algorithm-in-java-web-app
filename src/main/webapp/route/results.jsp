<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="com.example.antalgorithmwebapp.ShortestACO" %>
<%@ page import="com.example.antalgorithmwebapp.GraphNode" %>
<%@ page import="java.util.Vector" %>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="css/style.css">
    <%--    <script src="../js/scripts.js" defer></script>--%>
    <title>结果</title>
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
            <h3>结果</h3>
        </div>
        <div class="card">
            <table>
                <thead>
                <tr>
                    <th>日期</th>
                    <th>用户名</th>
                    <th>查询类型</th>
                    <th>初始点</th>
                    <th>终点</th>
                    <th>最佳路线</th>
                    <th>总距离</th>
                </tr>
                </thead>
                <tbody>
                <%
                    ShortestACO.Results results = (ShortestACO.Results) session.getAttribute("acoResults");
                    if (results != null) {
                        Vector<GraphNode> bestPath = results.getBestPath();
                        int totalDistance = results.getTotalDistance();
                        String username = (String) session.getAttribute("username");
                %>
                <tr>
                    <td><%= new java.util.Date() %>
                    </td>
                    <td><%= username %>
                    </td> <!-- Display the username -->
                    <td>路线搜索</td>
                    <td><%= session.getAttribute("queryStart") %></td> <!-- Display the starting point -->
                    <td><%= session.getAttribute("queryEnd") %></td> <!-- Display the end point -->
                    <td>
                        <% for (GraphNode node : bestPath) { %>
                        <span><%= node.getName() %> -> </span>
                        <% } %>
                    </td>
                    <td><%= totalDistance %>

                </tr>
                <% } else { %>
                <tr>
                    <td colspan="6">找不到路径。 可能节点没有连接。</td>
                </tr>
                <% } %>
                </tbody>
            </table>
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