<%-- 
    Document   : viewDetail
    Created on : Aug 10, 2016, 9:24:25 PM
    Author     : hoadgse61973
--%>

<%@page import="samples.Member"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
        Member member = ((Member) session.getAttribute("member"));
        if (member == null) {
                response.sendError(HttpServletResponse.SC_UNAUTHORIZED);
        } else {
                Member member_detail = (Member) request.getAttribute("member_detail");
                if (member_detail == null) {
                        response.sendError(HttpServletResponse.SC_FORBIDDEN);
                } else {


%>
<!DOCTYPE html>
<html>
        <head>
                <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
                <title>Information Details</title>
        </head>
        <body>
                Welcome <b><%=member.getUsername()%></b>

                <%

                        if (member_detail != null) {
                %>
                <h1>Information Details</h1>
                User name: <b><%=member_detail.getUsername()%></b><br/>
                Full name: <b><%=member_detail.getFullname()%></b><br/>
                Role: <b><%=member_detail.isAdmin() ? "Admin" : "User"%></b><br/>
                <%}%>
                <a href="view.jsp">Search Page</a>
        </body>
</html>
<%
                }
        }
%>