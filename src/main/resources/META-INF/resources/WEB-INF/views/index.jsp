<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
    <jsp:include page="header.jsp" />
    <title>Home</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/styles.css" />
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #f7f9fc;
            margin: 0;
        }

        .center-content {
            display: flex;
            flex-direction: column;
            align-items: center;
            justify-content: center;
            height: 100vh;
            text-align: center;
        }

        h1 {
            color: #2c3e50;
            margin-bottom: 20px;
        }

        .links {
            margin-top: 15px;
        }

        .links a {
            margin: 0 15px;
            font-size: 18px;
            color: #3498db;
            text-decoration: none;
            font-weight: bold;
        }

        .links a:hover {
            text-decoration: underline;
        }
    </style>
</head>
<body>
	

<div class="center-content">
    <h1>Welcome to Freelancer Marketplace</h1>
    <div class="links">
        <a href="${pageContext.request.contextPath}/registerFreelancer">Register your freelancer services</a> |
        <a href="${pageContext.request.contextPath}/freelancers">View Freelancers</a>
    </div>
</div>
<jsp:include page="footer.jsp" />
</body>
</html>
