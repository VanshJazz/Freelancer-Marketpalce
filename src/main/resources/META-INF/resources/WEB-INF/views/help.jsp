<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
    <title>Help & Support</title>
    <style>
        /* Full page background image */
        body {
            font-family: Arial, sans-serif;
            margin: 0;
            padding: 40px 20px;
            color: #333;
            max-width: 800px;
            margin-left: auto;
            margin-right: auto;
            position: relative;
            min-height: 100vh;
            background: url('${pageContext.request.contextPath}/images/background.jpeg') no-repeat center center fixed;
            background-size: cover;
        }
        /* Overlay for better readability */
        body::before {
            content: "";
            position: fixed;
            top: 0; left: 0; right: 0; bottom: 0;
            background-color: rgba(255, 255, 255, 0.75);
            pointer-events: none;
            z-index: -1;
        }

        h1 {
            text-align: center;
            color: #2c3e50;
            margin-bottom: 40px;
        }
        .faq, .contact, form {
            background: white;
            padding: 25px 30px;
            border-radius: 10px;
            box-shadow: 0 4px 8px rgba(0,0,0,0.1);
            margin-bottom: 40px;
        }
        .faq h2 {
            color: #2980b9;
            margin-bottom: 15px;
        }
        .faq p {
            margin-bottom: 20px;
            line-height: 1.5;
        }
        .contact h2 {
            color: #27ae60;
            margin-bottom: 15px;
        }
        .contact p {
            margin-bottom: 10px;
            font-size: 1.1rem;
        }
        form h2 {
            margin-top: 0;
            margin-bottom: 20px;
            color: #2980b9;
        }
        form label {
            display: block;
            margin-bottom: 8px;
            font-weight: bold;
        }
        form input[type="text"],
        form input[type="email"],
        form textarea {
            width: 100%;
            padding: 10px 12px;
            margin-bottom: 15px;
            border-radius: 5px;
            border: 1px solid #ccc;
            font-size: 1rem;
            box-sizing: border-box;
            resize: vertical;
        }
        form textarea {
            height: 100px;
        }
        form button {
            background-color: #2980b9;
            color: white;
            padding: 12px 25px;
            border: none;
            border-radius: 5px;
            font-weight: bold;
            cursor: pointer;
            font-size: 1rem;
        }
        form button:hover {
            background-color: #1c5980;
        }
        .footer {
            text-align: center;
            color: #aaa;
            margin-top: 40px;
            font-size: 0.9rem;
        }
    </style>
</head>
<body>

<h1>Help & Support</h1>

<div class="faq">
    <h2>Frequently Asked Questions</h2>
    
    <p><strong>Q:</strong> How can I contact a freelancer?<br/>
       <strong>A:</strong> You can send messages or request work directly from their profile or conversation page.</p>

</div>

<div class="contact">
    <h2>Contact Us</h2>
    <p>Email: vanshjaiswal70@gmail.com.com</p>
    <p>Phone: +91 9120790908</p>
    <p>Address: Knowledge Park 2, Greater Noida</p>
</div>

<form action="${pageContext.request.contextPath}/help/submit" method="post">
    <h2>Submit a Support Request</h2>
    <label for="name">Your Name</label>
    <input type="text" id="name" name="name" required placeholder="Enter your full name" />

    <label for="email">Your Email</label>
    <input type="email" id="email" name="email" required placeholder="Enter your email address" />

    <label for="message">Your Message</label>
    <textarea id="message" name="message" required placeholder="Describe your issue or question"></textarea>

    <button type="submit">Submit</button>
</form>

<div class="footer">
    &copy; 2025. All rights reserved.
</div>

</body>
</html>
