<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
    <title>Reply to ${receiverEmail}</title>
    <style>
        /* Simple styling for form */
        body {
            font-family: Arial, sans-serif;
            background: #f7f7f7;
            padding: 50px;
            display: flex;
            justify-content: center;
        }
        .container {
            background: white;
            padding: 25px 30px;
            border-radius: 10px;
            box-shadow: 0 5px 15px rgba(0,0,0,0.1);
            width: 400px;
            text-align: center;
        }
        textarea {
            width: 100%;
            height: 120px;
            padding: 10px;
            border-radius: 6px;
            border: 1px solid #ccc;
            resize: vertical;
            font-size: 14px;
        }
        button {
            margin-top: 15px;
            padding: 10px 20px;
            background-color: #007bff;
            border: none;
            color: white;
            font-weight: bold;
            border-radius: 6px;
            cursor: pointer;
        }
        button:hover {
            background-color: #0056b3;
        }
    </style>
</head>
<body>
    <div class="container">
        <h2>Reply to ${receiverEmail}</h2>
        <form action="${pageContext.request.contextPath}/message/reply" method="post">
            <input type="hidden" name="receiverEmail" value="${receiverEmail}" />
            <textarea name="messageText" placeholder="Your message" required></textarea>
            <br />
            <button type="submit">Send Reply</button>
        </form>
    </div>
</body>
</html>
