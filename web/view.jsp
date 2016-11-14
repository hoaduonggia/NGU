<%-- 
    Document   : view
    Created on : Aug 10, 2016, 8:21:11 PM
    Author     : hoadgse61973
--%>

<%@page import="java.util.List"%>
<%@page import="samples.Member"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
        Member member = ((Member) session.getAttribute("member"));
        if(member==null){
                response.sendError(HttpServletResponse.SC_UNAUTHORIZED);
        }else{
        
%>
<!DOCTYPE html>
<html>
        <head>
                <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
                <title>Information Page</title>
        </head>
        <body>
                Welcome <b><%=((Member) session.getAttribute("member")).getUsername()%></b>
                <a href="LogoutServlet">Logout</a>
                <h1>Information Page</h1>
                <form action="SearchServlet" method="post">
                        Keyword: <input type="text" name="keyword"/>
                        <input type="submit" value="Search"/>
                </form>
                <%
                        List<Member> list = (List<Member>) request.getAttribute("list");
                        if (list != null) {
                                if (list.isEmpty()) {
                                        out.println("<h2>Member not found</h2>");
                                } else {
                %>
                <h2>Result of Searching</h2>
                <table border="1">
                        <thead>
                                <tr>
                                        <th>No</th>
                                        <th>Username</th>
                                        <th>Action</th>
                                </tr>
                        </thead>
                        <%
                                int i = 0;
                                for (Member m : list) {
                        %>
                        <tbody>
                                <tr>
                                        <td><%=(++i)%></td>
                                        <td><%=m.getUsername()%></td>
                                        <td><a href="DetailServlet?username=<%=m.getUsername()%>">View Detail</a></td>
                                </tr>
                                
                        </tbody>
                        <%
                                }
                        %>
                </table>
                <%
                                }
                        }
                %>


        </body>
</html>
<%
        }
%>
