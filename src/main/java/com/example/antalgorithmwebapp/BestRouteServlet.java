package com.example.antalgorithmwebapp;

import java.io.*;
import java.sql.*;
import java.util.Date;
import java.util.stream.Collectors;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;

@WebServlet(name = "bestRouteServlet", value = "/bestroute-servlet")
public class BestRouteServlet extends HttpServlet {
    public void doPost(HttpServletRequest request, HttpServletResponse response) throws IOException {
        response.setContentType("text/html");

        String start = request.getParameter("start");
        String end = request.getParameter("end");

        Graph grp = new Graph();
        grp.buildGraph(getServletContext());
        grp.setStart(start);
        grp.setEnd(end);

        ShortestACO aco = new ShortestACO(grp);
        aco.start();

        // Get the results from the ShortestACO instance
        ShortestACO.Results results = aco.getResults();

        // Store the results in the session for the JSP to access
        HttpSession session = request.getSession();
        session.setAttribute("acoResults", results);

        // Store the user's query in the session for the JSP to access
        session.setAttribute("queryStart", start);
        session.setAttribute("queryEnd", end);
        session.setAttribute("queryDate", new Date());

        try {
            // Insert the query information into the history table
            Class.forName("com.mysql.cj.jdbc.Driver");
            Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/mydb", "root", "mwendiabae");
            String username = (String) session.getAttribute("username");
            int totalDistance = results.getTotalDistance();
            String bestRoute = String.join(" -> ", results.getBestPath().stream().map(GraphNode::getName).collect(Collectors.toList()));

            PreparedStatement ps = con.prepareStatement("INSERT INTO history (username, query_date, query_type, start_point, end_point, best_route, total_distance) VALUES (?, ?, ?, ?, ?, ?, ?)");
            ps.setString(1, username);
            ps.setTimestamp(2, new Timestamp(System.currentTimeMillis()));
            ps.setString(3, "Route Search");
            ps.setString(4, start);
            ps.setString(5, end);
            ps.setString(6, bestRoute);
            ps.setInt(7, totalDistance);
            ps.executeUpdate();

            con.close();
        } catch (ClassNotFoundException | SQLException e) {
            e.printStackTrace();
        }

        // Now redirect to the results page
        response.sendRedirect("route/results.jsp");
    }
}
