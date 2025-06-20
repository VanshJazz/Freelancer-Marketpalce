<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
    <title>Freelancers</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/styles.css" />
    <style>
        * {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
        }

        body {
            font-family: Arial, sans-serif;
            background: url('${pageContext.request.contextPath}/images/background.jpeg') no-repeat center center fixed;
            background-size: cover;
            min-height: 100vh;
            padding: 40px;
        }

        h2 {
            text-align: center;
            color: #2c3e50;
            margin-bottom: 30px;
        }

        .freelancer-grid {
            display: grid;
            grid-template-columns: repeat(3, 1fr);
            gap: 30px;
            width: 100%;
        }

        .freelancer-card {
            background: rgba(255, 255, 255, 0.95);
            padding: 20px;
            border-radius: 10px;
            box-shadow: 0 4px 12px rgba(0, 0, 0, 0.15);
            display: flex;
            flex-direction: column;
            justify-content: space-between;
        }

        .freelancer-card p {
            margin: 8px 0;
        }

        .freelancer-card a {
            color: #3498db;
            text-decoration: none;
        }

        .freelancer-card a:hover {
            text-decoration: underline;
        }

        /* Updated contact button style */
        .contact-btn {
            margin-top: 15px;
            padding: 10px 0;
            background-color: #1c5980; /* darker blue */
            color: #fff !important; /* force white text */
            font-weight: 700;
            border: none;
            border-radius: 8px;
            font-size: 16px;
            cursor: pointer;
            text-align: center;
            text-decoration: none;
            display: inline-block;
            transition: background-color 0.3s ease;
            box-shadow: 0 2px 5px rgba(0,0,0,0.2); /* subtle shadow */
            text-shadow: 0 1px 1px rgba(0,0,0,0.3); /* for text pop */
            width: 100%; /* full width */
        }

        .contact-btn:hover {
            background-color: #2879c0; /* lighter blue on hover */
        }

        /* Go to home button - matching contact button blue */
        .home-btn {
            display: inline-block;
            margin: 40px auto 0;
            padding: 12px 30px;
            background-color: #1c5980; /* same darker blue as contact button */
            color: white !important;
            font-weight: 700;
            border-radius: 8px;
            text-decoration: none;
            font-size: 16px;
            cursor: pointer;
            text-align: center;
            transition: background-color 0.3s ease;
            box-shadow: 0 2px 5px rgba(0,0,0,0.2);
        }

        .home-btn:hover {
            background-color: #2879c0; /* lighter blue on hover */
        }

        @media screen and (max-width: 992px) {
            .freelancer-grid {
                grid-template-columns: repeat(2, 1fr);
            }
        }

        @media screen and (max-width: 600px) {
            .freelancer-grid {
                grid-template-columns: 1fr;
            }
        }
    </style>
</head>
<body>

    <h2>Available Freelancers</h2>

    <c:if test="${empty freelancers}">
        <p style="text-align:center;">No freelancers available.</p>
    </c:if>

    <div class="freelancer-grid">
        <c:forEach var="freelancer" items="${freelancers}">
            <div class="freelancer-card">
                <p><strong>Name:</strong> ${freelancer.name}</p>
                <p><strong>Email:</strong> ${freelancer.email}</p>
                <p><strong>Skill:</strong> ${freelancer.skill}</p>
                <p><strong>Portfolio:</strong>
                    <a href="${freelancer.portfolioUrl}" target="_blank">${freelancer.portfolioUrl}</a>
                </p>

                <!-- Contact button as a link sending GET request -->
                <a class="contact-btn" href="${pageContext.request.contextPath}/message/send?receiverEmail=${freelancer.email}">
                    Contact
                </a>
            </div>
        </c:forEach>
    </div>

    <div style="text-align: center;">
        <a href="${pageContext.request.contextPath}/" class="home-btn">Go to Home</a>
    </div>

</body>
</html>
