<%-- Created by IntelliJ IDEA.
 User: _SaiNt
 Date: 05-May-23
 Time: 19:44
 To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="java.sql.*" %>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="css/style.css">
    <%--  <script src="js/scripts.js" defer></script>--%>
    <title>History</title>
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
            <h3>我的历史</h3>
        </div>
        <div class="card">
            <div class="card">
                <table id="hist_table">
                    <thead>
                    <tr>
                        <th>日期</th>
                        <th>用户名</th>
                        <th>查询类型</th>
                        <th>初始点</th>
                        <th>终点</th>
                        <th>最佳路线</th>
                        <th>总距离</th>
                        <th>修改（删除）</th>
                    </tr>
                    </thead>
                    <tbody>
                    <!-- Add rows with query information as needed -->
                    <%
                        // Fetch the user's query history from the database
                        String username = (String) session.getAttribute("username");
                        try {
                            Class.forName("com.mysql.cj.jdbc.Driver");
                            Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/mydb", "root", "mwendiabae");
                            PreparedStatement ps = con.prepareStatement("SELECT * FROM history WHERE username = ?");
                            ps.setString(1, username);
                            ResultSet rs = ps.executeQuery();
                            while (rs.next()) {
                    %>
                    <tr>
                        <td><%= rs.getTimestamp("query_date") %></td>
                        <td><%= rs.getString("username") %></td>
                        <td><%= rs.getString("query_type") %></td>
                        <td><%= rs.getString("start_point") %></td>
                        <td><%= rs.getString("end_point") %></td>
                        <td><%= rs.getString("best_route") %></td>
                        <td><%= rs.getInt("total_distance") %></td>
                        <td>
                            <a href="#">调整 </a>
                            <!-- Add delete functionality if needed -->
                        </td>
                    </tr>
                    <%
                            }
                        } catch (Exception e) {
                            e.printStackTrace();
                        }
                    %>
                    </tbody>
                </table>
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