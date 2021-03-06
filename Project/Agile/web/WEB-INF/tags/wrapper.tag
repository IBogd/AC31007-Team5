<%-- 
    Document   : wrapper
    Created on : 22-Feb-2017, 12:08:22
    Author     : carimakeju
--%>

<%@tag description="Consistency Wrapper Tag" pageEncoding="UTF-8" import="Stores.*" %>
<%@attribute name="header" fragment="true" %>
<%@attribute name="footer" fragment="true" %>

<html>
    <head>
        <title>Quiz</title>
        
        <link rel="stylesheet" href="assets/css/skeleton.min.css" />
        <link rel="stylesheet" href="assets/css/style.css" />
        <link rel="stylesheet" href="assets/css/font-awesome.min.css">
    </head>
    <body>
        <header class="container">
            <div class="dynamic-row">
                <div class="dynamic-column">
                    <h1><a href="Home">Quiz Thing</a></h1>
                </div>
                <div class="dynamic-column grow">
                    <ul>
                        <%
                            User user = (User)(request.getSession().getAttribute("user"));
                            if (user == null) {
                        %>
                        <li><a href="Login">Login</a></li>
                        <li><a href="Register">Register</a></li>
                        <%
                            }
                            else {
                        %>
                        <li>Hello, ${user.getDisplayName()}</li>
                        <li><a href="Logout">Log Out</a></li>
                        <%
                            }
                        %>
                        <jsp:invoke fragment="header"/>
                    </ul>
                </div>
            </div>
        </header>
        <section class="container">
            <%
                String success = (String)session.getAttribute("success");
                if (!(success == null)) {
            %>
            <p id="success-message" class="success" onclick="this.parentElement.removeChild(document.getElementById('success-message'));"><i class="fa fa-rocket" aria-hidden="true"></i> ${success}</p>
            <%
                    session.setAttribute("success", null);
                }

                String error = (String)session.getAttribute("error");
                if (!(error == null)) {
            %>
            <p id="error-message" class="error" onclick="this.parentElement.removeChild(document.getElementById('error-message'));"><i class="fa fa-bug" aria-hidden="true"></i> ${error}<span>(Click anywhere on this error message to close it)</span></p>
            <%
                    session.setAttribute("error", null);
                }
            %>
            <jsp:doBody/>    
        </section>
        <footer class="container">
            Something should be here eventually
            <jsp:invoke fragment="footer"/>
        </footer>
    </body>
</html>