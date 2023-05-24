<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="Connection.SQLDataAccess"%>
<%@page import="java.sql.ResultSet"%>

<!DOCTYPE html>
<%
    String username ="";
    Cookie[] cookies = request.getCookies();
    HttpSession httpSession = request.getSession();
    Object obj = httpSession.getAttribute("username");
    if (obj!=null)
    {
        username = String.valueOf(obj);
    }
    else
    {
        response.sendRedirect("/Coffee_Shop/index.jsp");
    }
%>
<html>
<head>
    <meta charset="UTF-8">
    <title>Thông tin đặt bàn</title>

    <style>
        body {
            background-color: #f7f7f7;
            font-family: Arial, sans-serif;
        }

        h2 {
            text-align: center;
            color: #1a1a1a;
            margin-top: 50px;
            margin-bottom: 30px;
        }

        table {
            border-collapse: collapse;
            width: 100%;
            margin-bottom: 50px;
        }

        th {
            background-color: #f2f2f2;
            color: #333;
            font-weight: bold;
            padding: 12px;
            text-align: left;
            border-bottom: 1px solid #ccc;
            text-transform: uppercase;
            font-size: 12px;
        }

        td {
            background-color: #fff;
            color: #333;
            padding: 12px;
            border-bottom: 1px solid #ccc;
            text-align: left;
            font-size: 14px;
        }

        tr:nth-child(even) {
            background-color: #f9f9f9;
        }

        .container {
            max-width: 800px;
            margin: 0 auto;
            padding: 20px;
        }

        .btn {
            display: inline-block;
            padding: 12px 24px;
            background-color: #1a1a1a;
            color: #fff;
            text-decoration: none;
            border-radius: 4px;
            font-weight: bold;
            transition: background-color 0.3s;
        }

        .btn:hover {
            background-color: #333;
        }
    </style>

</head>
<body>
    <div class="container">
        <h2>Table reservation information</h2>
        <table>
            <tr>
                <th>Customer name</th>
                <th>Email</th>
                <th>Phone</th>
                <th>Date</th>
                <th>Time</th>
                <th>Guest number</th>
            </tr>
            <% 
                SQLDataAccess db = new SQLDataAccess();
                String sql = "SELECT * FROM customer";
                ResultSet rs = db.getResultSet(sql);
                
                while (rs.next()) { 
            %>
                <tr>
                    <td><%= rs.getString("name") %></td>
                    <td><%= rs.getString("email") %></td>
                    <td><%= rs.getString("phone") %></td>
                    <td><%= rs.getString("date") %></td>
                    <td><%= rs.getString("time") %></td>
                    <td><%= rs.getString("guests") %></td>
                </tr>
            <% 
                }
            %>
        </table>
        <a href="index.jsp#booking" class="btn">Book a Table</a>
        <a href="menuManager.jsp" class="btn">Visit MenuManager</a>
    </div>
</body>
</html>
