<%--
  Created by IntelliJ IDEA.
  User: OS
  Date: 7/15/2023
  Time: 4:46 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
<%-- Kiểm tra và hiển thị thông báo thành công --%>
<% String successMessage = (String) request.getAttribute("successMessage");
    if (successMessage != null && !successMessage.isEmpty()) { %>
<div class="alert alert-success" role="alert">
    <%= successMessage %>
</div>
<% } %>

<%-- Kiểm tra và hiển thị thông báo lỗi --%>
<% String errorMessage = (String) request.getAttribute("errorMessage");
    if (errorMessage != null && !errorMessage.isEmpty()) { %>
<div class="alert alert-danger" role="alert">
    <%= errorMessage %>
</div>
<% } %>
</body>
</html>
