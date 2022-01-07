<%-- 
    Document   : faculty_register
    Created on : 3 Jan, 2022, 10:33:21 PM
    Author     : maulik
--%>

<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Faculty Registration</title>

        <link rel="stylesheet" href="assets/css/bootstrap.min.css">
        <link rel="stylesheet" href="assets/css/owl.carousel.min.css">
        <link rel="stylesheet" href="assets/css/slicknav.css">
        <link rel="stylesheet" href="assets/css/flaticon.css">
        <link rel="stylesheet" href="assets/css/progressbar_barfiller.css">
        <link rel="stylesheet" href="assets/css/gijgo.css">
        <link rel="stylesheet" href="assets/css/animate.min.css">
        <link rel="stylesheet" href="assets/css/animated-headline.css">
        <link rel="stylesheet" href="assets/css/magnific-popup.css">
        <link rel="stylesheet" href="assets/css/fontawesome-all.min.css">
        <link rel="stylesheet" href="assets/css/themify-icons.css">
        <link rel="stylesheet" href="assets/css/slick.css">
        <link rel="stylesheet" href="assets/css/nice-select.css">
        <link rel="stylesheet" href="assets/css/style.css">

        <script>
            var check = function () {
                if (document.getElementById("password").value == document.getElementById("confirm_password").value) {
                    document.getElementById("message").style.color = "green";
                    document.getElementById("message").innerHTML = "Password matching";
                } else {
                    document.getElementById("message").style.color = "red";
                    document.getElementById("message").innerHTML = "Password not matching";
                }
            }
            
        </script>
    </head>
    <body>
        <div id="preloader-active">
            <div class="preloader d-flex align-items-center justify-content-center">
                <div class="preloader-inner position-relative">
                    <div class="preloader-circle"></div>
                    <div class="preloader-img pere-text">
                        <img src="assets/img/logo/loder.png" alt="">
                    </div>
                </div>
            </div>
        </div>



        <main class="login-body">
            <!-- Login Admin -->
            <form class="form-default" name="myform" action="faculty_register.jsp" method="POST">

                <div class="login-form reg">
                    <!-- logo-login -->
                    <div class="logo-login">
                        <a href="index.jsp"><img src="assets/img/logo/loder.png" alt=""></a>
                    </div>
                    <h2>Register Here</h2>
                    <p>*All fields are mandatory</p>

                    <div class="form-input">
                        <input type="text" name="name" placeholder="Full name" pattern="[A-Z a-z]{2,}\s{1}[A-Z a-z]{3,}" title="Enter First Name and Last Name" required>
                    </div>
                    <div class="form-input">
                        <input type="text" name="username" placeholder="Username" title="Enter First Username" required>
                    </div>
                    <div class="form-input">
                        <input name="email" placeholder="Email ID" pattern="[a-z0-9.!#$%&_]+@[a-z0-9]+\.[a-z]{2,4}$" title="Must be like : characters@characters.domain" required>
                    </div>
                    <div class="form-input">
                        <input type="password" id="password" name="password" placeholder="Password" pattern="(?=.*\d)(?=.*[a-z])(?=.*[A-Z]).{8,}" title="Must contain at least one  number and one uppercase and lowercase letter, and at least 8 or more characters" required>
                    </div>
                    <div class="form-input">
                        <input type="password" id="confirm_password" name="confirm_password" placeholder="Confirm Password" onkeyup="check();" required>
                        <span id="message"></span>
                    </div>
                    <%
                        try {
                            // register the driver
                            Class.forName("com.mysql.jdbc.Driver");
                            // establish the connection
                            Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/vc?zeroDateTimeBehavior=convertToNull", "root", "");
                            // create a SQL statement
                            Statement stmt = con.createStatement();
                    %>


                    <%
                        ResultSet r1 = stmt.executeQuery("select course_name from course");
                    %>
                    <div class="form-input">
                        <select name="course" required>
                            <option value="Select"> Select course </option>
                            <%
                                // fetch the values of 'courses' available in ResultSet
                                while (r1.next()) {
                            %>
                            <option value="<%= r1.getString(1)%>"> <%= r1.getString(1)%></option>
                            <%
                                }
                            %>
                        </select>
                    </div>


                    <%
                        } catch (Exception e) {
                            out.println(e);
                        }
                    %>
                    <div class="form-input pt-30">
                        <input type="submit" name="submit" value="Send Request">
                    </div>
                    <!-- Forget Password -->
                    <a href="faculty_login.jsp" class="registration">Already have an account?<b> Login here </b> </a>
                </div>

                <%
                    // getting all required fields of registration of student for validation
                    String name = request.getParameter("name");
                    String username = request.getParameter("username");
                    String email = request.getParameter("email");
                    String password = request.getParameter("password");
                    String course = request.getParameter("course");
                    try {
                        // register the driver
                        Class.forName("com.mysql.jdbc.Driver");
                        // establish the connection
                        Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/vc?zeroDateTimeBehavior=convertToNull", "root", "");
                        PreparedStatement ps = con.prepareStatement("insert into faculty (name,username,email_id,password,course) values(?,?,?,SHA(?),?)");
                        ps.setString(1,name);
                        ps.setString(2, username);
                        ps.setString(3, email);
                        ps.setString(4, password);
                        ps.setString(5, course);
                        
                        ps.executeUpdate();
                        
                        ps.close();
                        con.close();
                        // redirects to home page
                        response.sendRedirect("index.jsp");
                    } catch (Exception e) {
                        
                    }
                %>
            </form>
            <!-- /end login form -->
        </main>

        <script src="./assets/js/vendor/modernizr-3.5.0.min.js"></script>
        <!-- Jquery, Popper, Bootstrap -->
        <script src="./assets/js/vendor/jquery-1.12.4.min.js"></script>
        <script src="./assets/js/popper.min.js"></script>
        <script src="./assets/js/bootstrap.min.js"></script>
        <!-- Jquery Mobile Menu -->
        <script src="./assets/js/jquery.slicknav.min.js"></script>

        <!-- Video bg -->
        <script src="./assets/js/jquery.vide.js"></script>

        <!-- Jquery Slick , Owl-Carousel Plugins -->
        <script src="./assets/js/owl.carousel.min.js"></script>
        <script src="./assets/js/slick.min.js"></script>
        <!-- One Page, Animated-HeadLin -->
        <script src="./assets/js/wow.min.js"></script>
        <script src="./assets/js/animated.headline.js"></script>
        <script src="./assets/js/jquery.magnific-popup.js"></script>

        <!-- Date Picker -->
        <script src="./assets/js/gijgo.min.js"></script>
        <!-- Nice-select, sticky -->
        <script src="./assets/js/jquery.nice-select.min.js"></script>
        <script src="./assets/js/jquery.sticky.js"></script>
        <!-- Progress -->
        <script src="./assets/js/jquery.barfiller.js"></script>

        <!-- counter , waypoint,Hover Direction -->
        <script src="./assets/js/jquery.counterup.min.js"></script>
        <script src="./assets/js/waypoints.min.js"></script>
        <script src="./assets/js/jquery.countdown.min.js"></script>
        <script src="./assets/js/hover-direction-snake.min.js"></script>

        <!-- contact js -->
        <script src="./assets/js/contact.js"></script>
        <script src="./assets/js/jquery.form.js"></script>
        <script src="./assets/js/jquery.validate.min.js"></script>
        <script src="./assets/js/mail-script.js"></script>
        <script src="./assets/js/jquery.ajaxchimp.min.js"></script>

        <!-- Jquery Plugins, main Jquery -->
        <script src="./assets/js/plugins.js"></script>
        <script src="./assets/js/main.js"></script>
    </body>
</html>
