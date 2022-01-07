<%-- 
    Document   : qna
    Created on : 5 Jan, 2022, 4:29:48 PM
    Author     : maulik
--%>

<%@page import="java.sql.PreparedStatement"%>
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
            <!--? slider Area Start-->
            <section class="slider-area ">
                <div class="slider-active">
                    <!-- Single Slider -->
                    <div class="single-slider slider-height d-flex align-items-center">
                        <div class="container">
                            <div class="row">
                                <div class="col-xl-6 col-lg-7 col-md-12">
                                    <div class="hero__caption">
                                        <h1 data-animation="fadeInLeft" data-delay="0.2s">Welcome<br><%= session.getAttribute("faculty")%>
                                        </h1>
                                        <p data-animation="fadeInLeft" data-delay="0.4s">Attend video lectures, skim through study materials and ask doubts at one place.</p>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </section>
            <!-- ? services-area -->
            <!-- Courses area start -->
            <div class="courses-area section-padding40 fix">
                <div class="container">
                    <div class="row justify-content-center">
                        <div class="col-xl-7 col-lg-8">
                            <div class="section-tittle text-center mb-55">
                                <h2>Question/Answer Forum</h2>
                            </div>
                        </div>
                    </div>

                    <div class="row mt-5">
                        <div class="col-lg-12">
                            <div class="card" data-bs-toggle="modal" data-bs-target="#add-question">
                                <div class="card-body text-center">
                                    <div class="container">
                                        <img style="max-width: 200px; margin-left: -5px"class="img-fluid rounded-circle" src="assets/img/plus.jpg" alt="add">
                                    </div>
                                    <p class="mt-2">Click here to ask a question!</p>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="courses-actives">
                        <%
                            Class.forName("com.mysql.jdbc.Driver");
                            Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/vc?zeroDateTimeBehavior=convertToNull", "root", "");
                            Statement stmt = con.createStatement();

                            ResultSet rs = stmt.executeQuery("select category,question,poser,answerer,is_answered,answer from qna");

                            while (rs.next()) {

                        %>
                        <!-- Single -->
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
                                            <% if (rs.getInt(5) == 1) {%>
                                            <p><span>Answered by <%= rs.getString(4)%></span></p>
                                            <%} else {%>
                                            <p><span>Not yet Answered </span></p>
                                            <%}%>
                                        </div>
                                        <div class="price">
                                            <span>- <%= rs.getString(3)%></span>
                                        </div>
                                    </div>
                                    <% if(rs.getInt(5) ==1){
                                        out.println("<a href='answer_page.jsp?qid="+rs.getInt(6)+"' class='border-btn border-btn2'>Open</a>"); 
                                        }
                                    
                                        else{
                                    %>
                                    <button type="button" class="btn btn-primary" data-bs-toggle="modal" data-bs-target="#answer<%=rs.getInt(6)%>">
                                            Answer the Question !
                                    </button>
                                    <%
                                        }
                                    %>
                                </div>

                            </div>
                        </div>
                                
                    <div class="modal fade" id="answer<%=rs.getInt(6)%>" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
                        <div class="modal-dialog modal-lg">
                            <div class="modal-content">
                                <div class="modal-header">
                                    <h5 class="modal-title" id="exampleModalLabel">Enter answer!</h5>
                                    <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                                </div>
                                <div class="modal-body">
                                    <form action="answer" method="post">

                                        
                                        <input type="hidden" name="qid" value="<%=rs.getInt(6)%>">
                                        <div class="form-group">
                                            <textarea style="height: 300px;" class="form-control"placeholder="Write your answer" name="answer" required></textarea>     
                                        </div>


                                        <div class="container text-center">
                                            <button class="btn btn-outline-success" type="submit">Submit Answer</button>
                                            <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>

                                        </div>

                                    </form>

                                </div>
                            </div>
                        </div>
                    </div>
                        <% }
                            stmt.close();
                            con.close();
                        %>
                    </div>
                    <!-- Single -->
                    </main>


                    <div class="modal fade" id="add-question" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
                        <div class="modal-dialog modal-lg">
                            <div class="modal-content">
                                <div class="modal-header">
                                    <h5 class="modal-title" id="exampleModalLabel">Fill Question Details!</h5>
                                    <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                                </div>
                                <div class="modal-body">
                                    <form action="add_question" method="post">

                                        <div class="form-group">
                                            <input type="text" class="form-control" name="category" placeholder="Enter question category" required>

                                        </div>

                                        <div class="form-group">
                                            <textarea style="height: 300px;" class="form-control"placeholder="Enter Question" name="question" required></textarea>     
                                        </div>


                                        <div class="container text-center">
                                            <button class="btn btn-outline-success" type="submit">Submit Question</button>
                                            <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>

                                        </div>

                                        <%
                                            

                                        %>

                                    </form>

                                </div>
                            </div>
                        </div>
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
