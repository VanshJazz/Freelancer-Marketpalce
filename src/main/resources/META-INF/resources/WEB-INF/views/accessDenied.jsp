<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
    <title>Access Denied</title>
    <style>
        body {
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
            background-color: #f8f9fa;
            margin: 0;
            padding: 0;
            display: flex;
            justify-content: center;
            align-items: center;
            height: 100vh;
            text-align: center;
        }

        .container {
            background: #ffffff;
            padding: 40px 60px;
            border-radius: 12px;
            box-shadow: 0 10px 20px rgba(0,0,0,0.1);
            max-width: 500px;
        }

        h2 {
            color: #e74c3c;
            margin-bottom: 20px;
            font-size: 28px;
        }

        p {
            color: #333;
            font-size: 18px;
            font-weight: 500;
            margin-bottom: 30px;
        }

        a {
            display: inline-block;
            padding: 12px 24px;
            background-color: #3498db;
            color: white;
            text-decoration: none;
            font-weight: bold;
            border-radius: 8px;
            transition: background-color 0.3s ease;
        }

        a:hover {
            background-color: #2980b9;
        }
    </style>
</head>

<body>
	

    <div class="container">
        <h2>Access Denied</h2>
        <p>${error}</p>
        <a href="${pageContext.request.contextPath}/">Go to Home</a>
    </div>
	
</body>
</html>
