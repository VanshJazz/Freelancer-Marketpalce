<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
    <title>Sign Up</title>
	<link rel="stylesheet" href="${pageContext.request.contextPath}/css/styles.css" />

    <script>
        function toggleInterestField() {
            const isFreelancer = document.getElementById("freelancerYes").checked;
            document.getElementById("interestFieldDiv").style.display = isFreelancer ? "block" : "none";
        }
    </script>
</head>
<body>

<jsp:include page="header.jsp" />


<h2>Create an Account</h2>

<form action="${pageContext.request.contextPath}/signup" method="post">
    <input type="text" name="name" placeholder="Full Name" required />
    <input type="email" name="email" placeholder="Email" required />
    <input type="password" name="password" placeholder="Password" required />
    <input type="text" name="contactNumber" placeholder="Contact Number" required />

    <p>Are you a Freelancer?</p>
    <label><input type="radio" name="freelancer" id="freelancerYes" value="true" onclick="toggleInterestField()" /> Yes</label>
    <label><input type="radio" name="freelancer" value="false" onclick="toggleInterestField()" checked /> No</label>

    <div id="interestFieldDiv" style="display: none;">
        <input type="text" name="interestField" placeholder="Field of Interest (e.g. Web Dev, Design)" />
    </div>

    <button type="submit">Sign Up</button>
</form>

<c:if test="${not empty error}">
    <p style="color:red;">${error}</p>
</c:if>
<jsp:include page="footer.jsp" />
</body>
<style>
    body {
        font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
        background: linear-gradient(to right, #e0ecf8, #f8f9fc);
        margin: 0;
        padding: 0;
    }

    h2 {
        text-align: center;
        color: #2c3e50;
        margin-top: 30px;
    }

    form {
        background: white;
        max-width: 450px;
        margin: 30px auto;
        padding: 30px 40px;
        border-radius: 12px;
        box-shadow: 0 4px 12px rgba(0, 0, 0, 0.1);
    }

    input[type="text"],
    input[type="email"],
    input[type="password"] {
        width: 100%;
        padding: 12px 15px;
        margin: 10px 0 20px 0;
        border: 1px solid #ccc;
        border-radius: 6px;
        font-size: 15px;
    }

    input[type="radio"] {
        margin-right: 5px;
    }

    label {
        font-size: 14px;
        margin-right: 15px;
    }

    #interestFieldDiv {
        margin-top: 10px;
    }

    button {
        width: 100%;
        background-color: #3498db;
        border: none;
        color: white;
        padding: 12px;
        font-size: 16px;
        border-radius: 6px;
        cursor: pointer;
        transition: background-color 0.3s ease;
    }

    button:hover {
        background-color: #2980b9;
    }

    p {
        font-size: 14px;
    }

    .error-message {
        color: red;
        text-align: center;
        margin-top: 10px;
    }
</style>

</html>
