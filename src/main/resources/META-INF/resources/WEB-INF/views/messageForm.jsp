<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
    <title>Send Message</title>
    <style>
        /* Reset and base styles */
        * {
            box-sizing: border-box;
        }
        body {
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
            /* Add background image with overlay */
            background: 
                linear-gradient(rgba(245, 247, 250, 0.85), rgba(245, 247, 250, 0.85)),
                url('${pageContext.request.contextPath}/images/background.jpeg') no-repeat center center fixed;
            background-size: cover;
            display: flex;
            justify-content: center;
            align-items: center;
            min-height: 100vh;
            margin: 0;
            padding: 20px;
        }

        .container {
            background: white;
            padding: 30px 40px;
            border-radius: 12px;
            box-shadow: 0 10px 25px rgba(0,0,0,0.1);
            width: 100%;
            max-width: 500px;
            text-align: center;
        }

        h2 {
            margin-bottom: 25px;
            color: #333;
            font-weight: 700;
            font-size: 1.8rem;
            letter-spacing: 1px;
        }

        textarea {
            width: 100%;
            padding: 15px 20px;
            font-size: 1rem;
            border: 2px solid #ccc;
            border-radius: 10px;
            resize: vertical;
            transition: border-color 0.3s ease;
            font-family: inherit;
        }
        textarea:focus {
            border-color: #2980b9;
            outline: none;
        }

        button {
            margin-top: 20px;
            width: 100%;
            padding: 12px 0;
            background-color: #1c5980;
            color: white;
            font-weight: 700;
            font-size: 1.1rem;
            border: none;
            border-radius: 10px;
            cursor: pointer;
            transition: background-color 0.3s ease;
            box-shadow: 0 3px 8px rgba(28,89,128,0.5);
        }
        button:hover {
            background-color: #2879c0;
        }

        .error-message {
            color: #e74c3c;
            font-weight: 600;
            margin-bottom: 15px;
        }

        /* Fancy back button */
        .back-link {
            display: inline-block;
            margin-top: 30px;
            padding: 12px 30px;
            background: linear-gradient(135deg, #2980b9, #1c5980);
            color: #fff;
            font-weight: 700;
            font-size: 1rem;
            border-radius: 30px;
            box-shadow: 0 6px 15px rgba(28,89,128,0.6);
            text-decoration: none;
            transition: background 0.3s ease, box-shadow 0.3s ease, transform 0.2s ease;
            user-select: none;
        }
        .back-link:hover {
            background: linear-gradient(135deg, #1c5980, #2980b9);
            box-shadow: 0 8px 20px rgba(28,89,128,0.8);
            transform: translateY(-3px);
            text-decoration: none;
        }
        .back-link:active {
            transform: translateY(-1px);
        }
    </style>
</head>
<body>
    <div class="container">
        <h2>Send Message to ${receiverEmail}</h2>
        <input type="hidden" name="receiverEmail" value="${receiverEmail}" />

        <c:if test="${not empty error}">
            <p class="error-message">${error}</p>
        </c:if>

		<form method="post" action="${pageContext.request.contextPath}/message/send">
		    <input type="hidden" name="receiverEmail" value="${param.receiverEmail}" />

		    <textarea name="workNeeded" rows="3" placeholder="What work is needed?" required></textarea><br><br>

		    <input type="date" name="dateRequired" required 
		           style="padding: 10px; width: 100%; border: 2px solid #ccc; border-radius: 10px; margin-bottom: 15px;" /><br>

		    <textarea name="otherDetails" rows="4" placeholder="Other relevant details..." required></textarea><br><br>

		    <button type="submit">Send</button>
		</form>


        <a href="${pageContext.request.contextPath}/freelancers" class="back-link">Back to Freelancers</a>
    </div>
</body>
</html>
