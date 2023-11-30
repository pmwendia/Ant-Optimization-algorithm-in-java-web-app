package com.example.antalgorithmwebapp;

import java.io.*;
import java.sql.*;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;

@WebServlet(name = "loginServlet", value = "/login-servlet")
public class LoginServlet extends HttpServlet {

    public void doPost(HttpServletRequest request, HttpServletResponse response) throws IOException {
        response.setContentType("text/html");

        String username = request.getParameter("username");
        String password = request.getParameter("password");

        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/mydb", "root", "mwendiabae");

            PreparedStatement ps = con.prepareStatement("SELECT * FROM users WHERE username = ? and password = ?");

            ps.setString(1, username);
            ps.setString(2, password);

            ResultSet rs = ps.executeQuery();
            if (rs.next()) {
                // User exists, redirect to dashboard

                // Store the username in the session
                HttpSession session = request.getSession();
                session.setAttribute("username", username);

                // Create the graph and store the information in the session
                Graph graph = new Graph();
                graph.buildGraph(getServletContext());
                String graphInfo = graph.getGraphInfo();
                session.setAttribute("graphInfo", graphInfo);

                response.sendRedirect("route/dashboard.jsp");
            } else {
                // User does not exist, redirect to register page
                response.sendRedirect("route/register.jsp");
            }

        } catch (Exception e2) {
            System.out.println(e2);
        }
    }
}
