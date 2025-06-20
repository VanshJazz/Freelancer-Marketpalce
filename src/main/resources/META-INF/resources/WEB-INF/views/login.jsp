<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
    <title>Login</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/styles.css" />
</head>
<body>

<jsp:include page="header.jsp" />


<h2>Login</h2>

<c:if test="${not empty error}">
    <p style="color: red;">${error}</p>
</c:if>


<form method="post" action="${pageContext.request.contextPath}/login">
    <input type="email" name="email" placeholder="Email" required /><br><br>
    <input type="password" name="password" placeholder="Password" required /><br><br>
    <button type="submit">Login</button>
</form>

</body>

</html>
