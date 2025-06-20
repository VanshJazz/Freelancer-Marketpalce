<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
    <title>About Us</title>
    <style>
        body {
            margin: 0;
            padding: 40px 20px;
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
            color: #333;
            min-height: 100vh;
            background: url('${pageContext.request.contextPath}/images/background.jpeg') no-repeat center center fixed;
            background-size: cover;
            position: relative;
        }
        body::before {
            content: "";
            position: fixed;
            top: 0; left: 0; right: 0; bottom: 0;
            background-color: rgba(255, 255, 255, 0.85);
            pointer-events: none;
            z-index: -1;
        }
        .container {
            max-width: 900px;
            margin: 0 auto;
            background: white;
            padding: 30px 40px;
            border-radius: 12px;
            box-shadow: 0 4px 15px rgba(0,0,0,0.1);
        }
        h1 {
            text-align: center;
            color: #2c3e50;
            margin-bottom: 30px;
        }
        p {
            font-size: 1.1rem;
            line-height: 1.6;
            margin-bottom: 20px;
            color: #444;
        }
        .team {
            margin-top: 40px;
        }
        .team h2 {
            color: #2980b9;
            margin-bottom: 20px;
        }
        .team-members {
            display: flex;
            flex-wrap: wrap;
            gap: 30px;
            justify-content: center;
        }
        .member {
            background: #f7f9fc;
            border-radius: 10px;
            padding: 15px 20px;
            width: 220px;
            text-align: center;
            box-shadow: 0 2px 8px rgba(0,0,0,0.05);
        }
        .member img {
            width: 100px;
            height: 100px;
            border-radius: 50%;
            object-fit: cover;
            margin-bottom: 12px;
            border: 3px solid #2980b9;
        }
        .member h3 {
            margin: 0 0 6px 0;
            font-size: 1.1rem;
            color: #2c3e50;
        }
        .member p {
            margin: 0;
            font-size: 0.95rem;
            color: #666;
        }
        .footer {
            text-align: center;
            margin-top: 50px;
            color: #aaa;
            font-size: 0.9rem;
        }
    </style>
</head>
<body>
<div class="container">
    <h1>About Our Project</h1>
    <p>
        Welcome to our platform — a dedicated marketplace that connects freelancers with clients seamlessly and securely.
        Our goal is to empower talented individuals by providing them with a reliable platform to showcase their skills, 
        communicate effectively, and grow their freelance business.
    </p>
    <p>
        We understand the challenges freelancers face in finding meaningful projects and the difficulties clients encounter when searching 
        for trusted professionals. That’s why our platform is designed with features like secure messaging, work detail sharing, 
        and integrated payment solutions to ensure smooth collaboration.
    </p>
    <p>
        Whether you are a freelancer looking to showcase your portfolio or a client in need of professional services, our platform 
        is built to support your success.
    </p>

    <div class="team">
        <h2>Meet Our Team</h2>
        <div class="team-members">
            <div class="member">
                <img src="${pageContext.request.contextPath}/images/Vansh.jpg" alt="Vansh Jaiswal" />
                <h3>Vansh Jaiswal</h3>
                <p></p>
            </div>
            <div class="member">
                <img src="${pageContext.request.contextPath}/images/Aditya.jpg" alt="Aditya Singh" />
                <h3>Aditya Singh</h3>
                <p></p>
            </div>
            <div class="member">
                <img src="${pageContext.request.contextPath}/images/Amit.jpg" alt="Amit Kumar" />
                <h3>Amit Kumar</h3>
                <p>UI</p>
            </div>
        </div>
    </div>

    <div class="footer">
        &copy; 2025. All rights reserved.
    </div>
</div>
</body>
</html>
