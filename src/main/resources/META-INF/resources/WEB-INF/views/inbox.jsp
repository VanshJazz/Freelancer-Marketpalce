<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html>
<head>
    <title>Inbox</title>
    <style>
        /* Your styles stay the same */
        body {
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
            background-image: url('${pageContext.request.contextPath}/images/background.jpeg');
            background-size: cover;
            background-repeat: no-repeat;
            background-position: center;
            background-attachment: fixed;
            margin: 0;
            padding: 20px;
            color: #333;
        }
        h2 {
            text-align: center;
            font-size: 36px;
            font-weight: 700;
            color: transparent;
            background: linear-gradient(90deg, #007bff, #00c6ff);
            -webkit-background-clip: text;
            background-clip: text;
            margin-bottom: 30px;
            text-shadow: 1px 1px 2px rgba(0,0,0,0.1);
            letter-spacing: 1px;
        }
        .inbox-container {
            display: grid;
            grid-template-columns: repeat(auto-fit, minmax(280px, 1fr));
            gap: 20px;
            max-width: 1200px;
            margin: 30px auto;
            padding: 10px;
        }
        .message-card {
            background-color: rgba(255, 255, 255, 0.95);
            border-radius: 12px;
            padding: 20px;
            box-shadow: 0 4px 10px rgba(0, 0, 0, 0.1);
            transition: transform 0.3s ease;
        }
        .message-card:hover {
            transform: translateY(-5px);
        }
        .message-card p {
            margin: 8px 0;
        }
        .message-card a {
            display: inline-block;
            margin-top: 10px;
            text-decoration: none;
            color: #007bff;
            font-weight: bold;
        }
        .no-messages {
            text-align: center;
            color: #777;
            font-style: italic;
        }
        .back-button {
            display: block;
            text-align: center;
            margin: 40px auto 0;
            padding: 12px 24px;
            background-color: #007bff;
            color: #fff;
            text-decoration: none;
            font-size: 16px;
            font-weight: 600;
            border-radius: 30px;
            box-shadow: 0 4px 12px rgba(0, 123, 255, 0.2);
            transition: all 0.3s ease;
            width: fit-content;
        }
        .back-button:hover {
            background-color: #0056b3;
            box-shadow: 0 6px 16px rgba(0, 86, 179, 0.4);
            transform: translateY(-2px);
        }
        .overlay {
            background-color: rgba(255, 255, 255, 0.85);
            padding: 20px;
            border-radius: 12px;
            position: relative;
            z-index: 1;
        }
        body::before {
            content: "";
            position: fixed;
            top: 0; left: 0; right: 0; bottom: 0;
            background-color: rgba(255, 255, 255, 0.5);
            pointer-events: none;
            z-index: 0;
        }
    </style>
</head>
<body>
    <div class="overlay">
        <h2>Inbox</h2>

        <div class="inbox-container">
            <c:if test="${empty conversations}">
                <p class="no-messages">No messages yet.</p>
            </c:if>

            <c:forEach var="conversation" items="${conversations}">
                <c:set var="firstMsg" value="${conversation.firstMessage}" />
                <c:set var="lastMsg" value="${conversation.lastMessage}" />
                <div class="message-card">
                    <p><strong>From:</strong> ${firstMsg.sender.email}</p>
                    <p><strong>Work Needed:</strong> ${firstMsg.workNeeded}</p>
                    <p><strong>Date Required:</strong> ${firstMsg.dateRequired}</p>
                    <p><strong>Last Message:</strong>
                        <c:choose>
                            <c:when test="${fn:length(lastMsg.content) > 80}">
                                ${fn:substring(lastMsg.content, 0, 80)}...
                            </c:when>
                            <c:otherwise>
                                ${lastMsg.content}
                            </c:otherwise>
                        </c:choose>
                    </p>

                    <a href="${pageContext.request.contextPath}/message/conversation?withEmail=${firstMsg.sender.email}">
                        View Conversation
                    </a>

                    <!-- Delete form (delete entire conversation by first message id) -->
                    <form method="post" action="${pageContext.request.contextPath}/message/delete" style="display:inline;">
                        <input type="hidden" name="messageId" value="${firstMsg.id}" />
                        <button type="submit" style="
                            background-color: #dc3545;
                            color: white;
                            padding: 6px 12px;
                            border: none;
                            border-radius: 5px;
                            cursor: pointer;">Delete</button>
                    </form>
                </div>
            </c:forEach>
        </div>

        <a class="back-button" href="${pageContext.request.contextPath}/">Back to Home</a>

        <form action="${pageContext.request.contextPath}/message/clearAll" method="post" onsubmit="return confirm('Are you sure you want to delete all messages?');">
            <button type="submit" class="back-button" style="background-color: #dc3545;">Clear All Messages</button>
        </form>
    </div>
</body>
</html>
