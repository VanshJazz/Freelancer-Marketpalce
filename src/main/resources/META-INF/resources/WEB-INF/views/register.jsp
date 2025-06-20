<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
    <title>Register your services</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/styles.css" />
    <style>
        body {
            font-family: Arial, sans-serif;
            text-align: center;
            padding: 30px;
            margin: 0;
            background-color: #f7f9fc;
        }

        form {
            max-width: 400px;
            margin: 40px auto 0 auto;
            padding: 20px;
            border: 1px solid #ccc;
            border-radius: 10px;
            background-color: #fff;
            box-shadow: 0 2px 8px rgba(0,0,0,0.1);
        }

        input, textarea {
            width: 100%;
            padding: 8px;
            margin: 8px 0;
            box-sizing: border-box;
            border: 1px solid #ccc;
            border-radius: 4px;
            font-size: 14px;
        }

        button {
            padding: 10px 20px;
            background-color: #3498db;
            border: none;
            color: white;
            font-weight: bold;
            cursor: pointer;
            border-radius: 5px;
            font-size: 16px;
            margin-top: 10px;
            transition: background-color 0.3s ease;
        }

        button:hover {
            background-color: #2980b9;
        }
    </style>
</head>

<body>
	

    <h2>Register as Freelancer</h2>

    <form action="${pageContext.request.contextPath}/register" method="post">
        <input type="text" name="name" placeholder="Full Name" required />
        <input type="email" name="email" placeholder="Email" required />
        <input type="text" name="skill" placeholder="Skills (e.g. Web Dev, Graphic Design)" required />
        <input type="url" name="portfolioUrl" placeholder="Portfolio URL" />
        <button type="submit">Register</button>
    </form>
	
</body>
</html>
