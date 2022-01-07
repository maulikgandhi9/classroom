<%-- 
    Document   : answer_page
    Created on : 6 Jan, 2022, 4:29:45 PM
    Author     : maulik
--%>

<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
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
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta1/dist/js/bootstrap.bundle.min.js" integrity="sha384-ygbV9kiqUc6oa4msXn9868pTtWMgiQaeYH7/t7LECLbyPA2x65Kgf80OJFdroafW" crossorigin="anonymous"></script>
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
                                                    <li class="active"><a href="student_dashboard.jsp">Home</a></li>
                                                    <li><a href="#">Classroom</a>
                                                        <ul class="submenu">
                                                            <li><a href="">Video Lectures</a></li>
                                                            <li><a href="">Study Materials</a></li>
                                                        </ul>
                                                    </li>
                                                    <li><a href="">Q/A Forum</a></li>
                                                    <!-- Button -->
                                                    <li class="button-header"><a href="student_logout.jsp" class="btn btn3">Log Out</a></li>
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
            <div class="courses-area section-padding40 fix">
                <div class="container">
                    <div class="row justify-content-center">
                        <div class="col-xl-7 col-lg-8">
                            <div class="section-tittle text-center mb-55">
                                <h2>Question/Answer Forum</h2>
                            </div>
                        </div>
                    </div>
                    
                    <div class="courses-actives">
                        <%
                            try{
                            Class.forName("com.mysql.jdbc.Driver");
                            Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/vc?zeroDateTimeBehavior=convertToNull", "root", "");
                            int question_id = Integer.parseInt(request.getParameter("qid"));
                            PreparedStatement stmt = con.prepareStatement("select category,question,poser,answerer,answer from qna where question_id=?");
                            stmt.setInt(1, question_id);
                            ResultSet rs = stmt.executeQuery();

                            while (rs.next()) {

                        %>
                        
                        <div class="properties pb-20">
                            <div class="properties__card">
                                <div class="properties__img overlay1">
                                    <a href="#"><img src="assets/img/gallery/featured1.png" alt=""></a>
                                </div>
                                <div class="properties__caption">
                                    <p><%= rs.getString(1)%></p>
                                    <h3><a href="#"><%= rs.getString(2)%></a></h3>
                                    <div class="properties__footer d-flex justify-content-between align-items-center">
                                        <div class="restaurant-name">
                                            <p><span>Answered by <%= rs.getString(4)%></span></p>
                                        </div>
                                        <div class="price">
                                            <span>- <%= rs.getString(3)%></span>
                                        </div>
                                    </div>
                                    
                                    <div class="default">
                                        <span>
                                            <%= rs.getString(5) %>
                                        </span>
                                    </div>
                                    
                                </div>

                            </div>
                        </div>
                        <% } 
                                stmt.close();
                                con.close();
                            }catch(Exception e){
                                out.println(e);
                            }
                            
                        %> 
                    </div>
   
                    
        </main>
                    
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
