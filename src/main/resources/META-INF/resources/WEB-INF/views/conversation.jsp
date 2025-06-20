<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<!DOCTYPE html>
<html>
<head>
    <title>Conversation with ${withEmail}</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            background: url('${pageContext.request.contextPath}/images/background.jpeg') no-repeat center center fixed;
            background-size: cover;
            padding: 20px;
            position: relative;
            color: #333;
            margin: 0;
            min-height: 100vh;
        }

        /* Overlay to dim background for readability */
        body::before {
            content: "";
            position: fixed;
            top: 0; left: 0; right: 0; bottom: 0;
            background-color: rgba(255, 255, 255, 0.6);
            pointer-events: none;
            z-index: -1;
        }

        h2 {
            text-align: center;
            margin-bottom: 30px;
        }
        .conversation-container {
            max-width: 600px;
            margin: 0 auto;
            background: white;
            padding: 20px;
            border-radius: 12px;
            box-shadow: 0 3px 10px rgba(0,0,0,0.1);
            height: 70vh;
            overflow-y: auto;
            display: flex;
            flex-direction: column;
            gap: 10px;
        }
        .first-message-card {
            background: #f0f0f0;
            border-radius: 12px;
            padding: 15px 20px;
            box-shadow: 0 2px 5px rgba(0,0,0,0.1);
        }
        .chat-message {
            max-width: 75%;
            padding: 10px 15px;
            border-radius: 20px;
            clear: both;
            word-wrap: break-word;
            font-size: 1rem;
            line-height: 1.3;
            box-sizing: border-box;
        }
        .sent {
            background-color: #dcf8c6;
            align-self: flex-end;
            text-align: right;
            border-bottom-right-radius: 5px;
        }
        .received {
            background-color: #fff;
            border: 1px solid #ccc;
            align-self: flex-start;
            text-align: left;
            border-bottom-left-radius: 5px;
        }
        .sender-email {
            font-size: 0.75rem;
            color: #555;
            font-weight: bold;
            margin-bottom: 4px;
            word-break: break-all;
        }
        .timestamp {
            font-size: 0.7rem;
            color: #999;
            margin-top: 3px;
        }
        .back-link {
            display: block;
            text-align: center;
            margin-top: 30px;
            text-decoration: none;
            color: #2980b9;
            font-weight: bold;
        }
        .back-link:hover {
            text-decoration: underline;
        }

        /* Reply form styling */
        .reply-form {
            max-width: 600px;
            margin: 20px auto 0;
            display: flex;
            gap: 10px;
            align-items: center;
        }
        .reply-form input[type="text"] {
            flex: 1;
            padding: 10px 15px;
            border-radius: 20px;
            border: 1px solid #ccc;
            font-size: 1rem;
            box-sizing: border-box;
        }

        /* Hide default file input */
        .reply-form input[type="file"] {
            display: none;
        }

        /* Custom file upload label as a "+" button */
        .file-upload-label {
            display: inline-flex;
            justify-content: center;
            align-items: center;
            width: 36px;
            height: 36px;
            background-color: #28a745;
            color: white;
            font-size: 28px;
            font-weight: bold;
            border-radius: 50%;
            cursor: pointer;
            user-select: none;
            transition: background-color 0.3s ease;
        }
        .file-upload-label:hover {
            background-color: #218838;
        }

        /* Send button */
        .reply-form button {
            background-color: #28a745;
            color: white;
            border: none;
            padding: 10px 20px;
            border-radius: 20px;
            cursor: pointer;
            font-weight: bold;
            white-space: nowrap;
        }

        /* Media queries for smaller screens */
        @media (max-width: 640px) {
            .conversation-container, .reply-form {
                max-width: 100%;
            }
            .chat-message {
                max-width: 90%;
            }
        }
    </style>
</head>
<body>

<h2>Conversation with ${withEmail}</h2>

<div class="conversation-container" id="conversationContainer">
    <c:forEach var="msg" items="${conversation}" varStatus="status">
        <c:choose>
            <c:when test="${status.first}">
                <!-- First message card with full details -->
                <div class="first-message-card">
                    <p class="sender-email">${msg.sender.email}</p>
                    <p><strong>Work Needed:</strong> ${msg.workNeeded}</p>
                    <p><strong>Date Required:</strong> ${msg.dateRequired}</p>
                    <p><strong>Details:</strong> ${msg.otherDetails}</p>
                    <p class="timestamp">${msg.timestamp}</p>
                </div>
            </c:when>
            <c:otherwise>
                <c:set var="alignmentClass" value="${msg.sender.email == sessionScope.loggedInUser.email ? 'sent' : 'received'}"/>
                <div class="chat-message ${alignmentClass}">
                    <div class="sender-email">${msg.sender.email}</div>

                    <c:if test="${not empty msg.content}">
                        <p>${msg.content}</p>
                    </c:if>

                    <c:if test="${not empty msg.filePath}">
                        <c:choose>
                            <c:when test="${fn:endsWith(msg.fileName, '.jpg') 
                                          || fn:endsWith(msg.fileName, '.png') 
                                          || fn:endsWith(msg.fileName, '.jpeg') 
                                          || fn:endsWith(msg.fileName, '.gif')}">
                                <img src="${pageContext.request.contextPath}${msg.filePath}" alt="Image" style="max-width:100%; border-radius:8px;"/>
                            </c:when>
                            <c:when test="${fn:endsWith(msg.fileName, '.mp4')}">
                                <video controls style="max-width:100%; border-radius:8px;">
                                    <source src="${pageContext.request.contextPath}${msg.filePath}" type="video/mp4"/>
                                    Your browser does not support the video tag.
                                </video>
                            </c:when>
                            <c:when test="${fn:endsWith(msg.fileName, '.pdf')}">
                                <a href="${pageContext.request.contextPath}${msg.filePath}" target="_blank" style="color:#2980b9; font-weight:bold;">View PDF</a>
                            </c:when>
                            <c:otherwise>
                                <a href="${pageContext.request.contextPath}${msg.filePath}" download style="color:#2980b9; font-weight:bold;">${msg.fileName}</a>
                            </c:otherwise>
                        </c:choose>
                    </c:if>

                    <div class="timestamp">${msg.timestamp}</div>
                </div>
            </c:otherwise>
        </c:choose>
    </c:forEach>
</div>

<!-- Reply Form -->
<form action="${pageContext.request.contextPath}/message/sendConversationReply" method="post" class="reply-form" enctype="multipart/form-data">
    <input type="hidden" name="receiverEmail" value="${withEmail}" />
    
    <input type="text" name="content" placeholder="Type your message..." autocomplete="off" />
    
    <!-- Hidden file input -->
    <input type="file" name="file" id="fileUpload" accept="image/*,video/*,application/pdf" />
    
    <!-- Label styled as "+" to trigger file dialog -->
    <label for="fileUpload" class="file-upload-label" title="Attach file">+</label>
    
    <button type="submit">Send</button>
</form>

<a href="${pageContext.request.contextPath}/message/inbox" class="back-link">Back to Inbox</a>

<script>
    // Scroll conversation container to bottom on page load
    window.onload = function() {
        var container = document.getElementById('conversationContainer');
        container.scrollTop = container.scrollHeight;
    };
</script>

</body>
</html>
