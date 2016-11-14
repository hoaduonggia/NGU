<%-- 
    Document   : index
    Created on : Aug 10, 2016, 7:54:24 PM
    Author     : hoadgse61973
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
        <head>
                <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
                <title>Login</title>
        </head>
        <body>
                <h1>Login</h1>
                <form action="LoginServlet" method="post">
                <table>
                        <tr>
                                <td>User name:</td>
                                <td><input type="text" name="username"/></td>
                        </tr>
                        <tr>
                                <td>Password:</td>
                                <td><input type="password" name="password"/></td>
                        </tr>
                        <tr>
                                <td colspan="2" style="text-align: center">
                                        <input type="submit" name="Login"/>
                                        <input type="reset" name="Reset"/>
                                </td>                                
                        </tr>
                </table>
                        </form>
        </body>
</html>
