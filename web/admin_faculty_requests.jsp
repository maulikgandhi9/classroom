<%-- 
    Document   : admin_faculty_requests
    Created on : 4 Jan, 2022, 11:08:57 PM
    Author     : maulik
--%>

<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Virtual Classroom</title>

        <link rel="manifest" href="site.webmanifest">
        <link rel="shortcut icon" type="image/x-icon" href="assets/img/favicon.ico">

        <!-- CSS here -->
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

        <header>
            <!-- Header Start -->
            <div class="header-area header-transparent">
                <div class="main-header ">
                    <div class="header-bottom  header-sticky">
                        <div class="container-fluid">
                            <div class="row align-items-center">


                                <div class="col-xl-10 col-lg-10">
                                    <div class="menu-wrapper d-flex align-items-center justify-content-end">
                                        <!-- Main-menu -->
                                        <div class="main-menu d-none d-lg-block">
                                            <nav>
                                                <ul id="navigation">
                                                    <li class="active"><a href="admin_dashboard.jsp"> Home </a></li>
                                                    <li><a href="#">Student</a>
                                                        <ul class="submenu">
                                                            <li><a href="admin_student_requests.jsp">Manage Requests </a></li>
                                                        </ul>
                                                    </li>
                                                    <li><a href="#">Faculty</a>
                                                        <ul class="submenu">
                                                            <li><a href="admin_faculty_requests.jsp">Manage Requests </a></li>
                                                        </ul>
                                                    </li>
                                                    <!-- Button -->
                                                    <li class="button-header"><a href="admin_logout.jsp" class="btn btn3"> Log Out </a></li>
                                                </ul>
                                            </nav>
                                        </div>
                                    </div>
                                </div>
                                <!-- Mobile Menu -->
                                <div class="col-12">
                                    <div class="mobile_menu d-block d-lg-none"></div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <!-- Header End -->
        </header>


        <main>
            <!--? slider Area Start-->
            <section class="slider-area ">
                <div class="slider-active">
                    <!-- Single Slider -->
                    <div class="single-slider slider-height d-flex align-items-center">
                        <div class="container">
                            <div class="row">
                                <div class="col-xl-6 col-lg-7 col-md-12">
                                    <div class="hero__caption">
                                        <h1 data-animation="fadeInLeft" data-delay="0.2s">Faculty<br>Requests</h1>
                                        <p data-animation="fadeInLeft" data-delay="0.4s">Accept or Decline Faculty Registration Requets.</p>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </section>
        </main>

        <div class="section-top-border">
            <h3 class="mb-30 request">Requests:</h3>
            <div class="progress-table-wrap">
                <div class="progress-table">
                    <form class="form-default" action="admin_faculty_requests_action.jsp" method="POST">
                        <table class="table">
                            <tr>
                                <th scope="row" class="name">Name</th>
                                <th class="name">Username</th>
                                <th class="name">Email</th>
                                <th class="name">Course</th>
                                <th class="accept">Accept / Decline</th>
                            </tr>

                            <%
                                try {
                                    // register the driver
                                    Class.forName("com.mysql.jdbc.Driver");

                                    // establish the connection with the database
                                    Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/vc?zeroDateTimeBehavior=convertToNull", "root", "");

                                    // create a SQL statement
                                    Statement stmt = con.createStatement();
                                    String sql = "select name,username, email_id,course from faculty where is_approved = 0";

                                    // execute the statement
                                    ResultSet rs = stmt.executeQuery(sql);

                                    // for no requests pending 
                                    if (rs == null) {
                            %>
                            <tr>
                                <td>
                                    <div class="table-row">
                                        <div class="name">
                                            <%
                                                out.println("No Pending request");
                                            %>
                                        </div>
                                    </div>
                                </td>
                                <%
                                    }

                                    while (rs.next() && rs.getString(1) != null) {
                                %>
                            <div class="table-row">
                                <td>
                                    <div class="name">
                                        <%= rs.getString(1)%>
                                    </div>
                                </td>
                                <td>
                                    <div class="username" >
                                        <%= rs.getString(2)%>
                                    </div>
                                </td>
                                <td>
                                    <div class="email" >
                                        <%= rs.getString(3)%>

                                    </div>
                                </td>
                                <td>
                                    <div class="course" >
                                        <%= rs.getString(4)%>

                                    </div>
                                </td>
                                <td>
                                    <div class="accept"><input type="checkbox" name="ad" value="<%= rs.getString(3)%>"></div>
                                </td>

                            </div>
                            </tr>
                            <%
                                    }

                                    // close the connection
                                    stmt.close();
                                    con.close();
                                } catch (Exception e) {
                                    out.println(e);
                                }
                            %>
                        </table>
                        <table>
                            <tr>
                                <td>
                                    <div class="form-input pt-30 request">
                                        <input class="genric-btn primary-border" type="submit" name="accept" value="Accept Request">
                                    </div>
                                </td>
                                <td>
                                    <div class="form-input pt-30 request">
                                        <input class="genric-btn primary-border" type="submit" name="reject" value="Delete Requests">
                                    </div>
                                </td>
                            </tr>
                        </table>

                    </form>
                </div>
            </div>
        </div>
    </div>

    <script src="./assets/js/vendor/modernizr-3.5.0.min.js"></script>
    <!-- Jquery, Popper, Bootstrap -->
    <script src="./assets/js/vendor/jquery-1.12.4.min.js"></script>
    <script src="./assets/js/popper.min.js"></script>
    <script src="./assets/js/bootstrap.min.js"></script>
    <!-- Jquery Mobile Menu -->
    <script src="./assets/js/jquery.slicknav.min.js"></script>

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
