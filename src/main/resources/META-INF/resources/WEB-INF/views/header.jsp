<!-- /WEB-INF/views/header.jsp -->
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<%
response.setHeader("Cache-Control", "no-cache, no-store, must-revalidate"); // HTTP 1.1
response.setHeader("Pragma", "no-cache"); // HTTP 1.0
response.setDateHeader("Expires", 0); // Proxies
%>

<div class="header">
    <div class="nav">
        <div class="nav-links">
            <a href="${pageContext.request.contextPath}/">Home</a>
            <a href="${pageContext.request.contextPath}/register">Register your freelancer services</a>
            <a href="${pageContext.request.contextPath}/freelancers">Freelancers</a>
            <a href="${pageContext.request.contextPath}/about">About</a>
            <a href="${pageContext.request.contextPath}/help">Help</a>

            <c:choose>
                <c:when test="${sessionScope.isLoggedIn == true}">
					<a href="${pageContext.request.contextPath}/message/inbox">Inbox</a>

                    <a href="${pageContext.request.contextPath}/logout">Logout (${sessionScope.userEmail})</a>
                </c:when>
                <c:otherwise>
                    <a href="${pageContext.request.contextPath}/login">Login</a>
                    <a href="${pageContext.request.contextPath}/signup">Sign Up</a>
                </c:otherwise>
            </c:choose>
        </div>

        <div class="logo">
            <img src="${pageContext.request.contextPath}/images/logo.jpg" alt="Logo" />
        </div>
    </div>
</div>
