<%@page import="java.util.List"%>
<%@ page import="CapheClass.*" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="utf-8">
    <title>KOPPEE - Coffee Shop HTML Template</title>
    <meta content="width=device-width, initial-scale=1.0" name="viewport">
    <meta content="Free Website Template" name="keywords">
    <meta content="Free Website Template" name="description">

    <!-- Favicon -->
    <link href="img/favicon.ico" rel="icon">

    <!-- Google Font -->
    <link rel="preconnect" href="https://fonts.gstatic.com">
    <link href="https://fonts.googleapis.com/css2?family=Montserrat:wght@200;400&family=Roboto:wght@400;500;700&display=swap" rel="stylesheet"> 

    <!-- Font Awesome -->
    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.10.0/css/all.min.css" rel="stylesheet">

    <!-- Libraries Stylesheet -->
    <link href="lib/owlcarousel/assets/owl.carousel.min.css" rel="stylesheet">
    <link href="lib/tempusdominus/css/tempusdominus-bootstrap-4.min.css" rel="stylesheet" />

    <!-- Customized Bootstrap Stylesheet -->
    <link href="css/style.min.css" rel="stylesheet">
    <script src="https://kit.fontawesome.com/f518232926.js" crossorigin="anonymous"></script>
    <link rel="stylesheet" type="text/css" href="css/cartIcon.css">
    <link rel="stylesheet" type="text/css" href="css/CartItem_style.css">
</head>

<body>
    <!-- Navbar Start -->
    <div class="container-fluid p-0 nav-bar">
        <nav class="navbar navbar-expand-lg bg-none navbar-dark py-3">
            <a href="index.jsp" class="navbar-brand px-lg-4 m-0">
                <h1 class="m-0 display-4 text-uppercase text-white">KOPPEE</h1>
            </a>
            <button type="button" class="navbar-toggler" data-toggle="collapse" data-target="#navbarCollapse">
                <span class="navbar-toggler-icon"></span>
            </button>
        <div class="collapse navbar-collapse justify-content-between" id="navbarCollapse">
                <div class="navbar-nav ml-auto p-4">
                        <a href="index.jsp" class="nav-item nav-link active">Home</a>
                        <a href="index.jsp#about" class="nav-item nav-link">About</a>
                        <a href="index.jsp#service" class="nav-item nav-link">Service</a>
                        <a href="index.jsp#menu.jsp" class="nav-item nav-link">Menu</a>
                        <a href="index.jsp#booking" class="nav-item nav-link">Booking</a>
                        <a href="index.jsp#contact" class="nav-item nav-link">Contact</a>
                    </div>
        </div>  
        </nav>
    </div>
    <!-- Navbar End -->


    <!-- Page Header Start -->
    <div class="container-fluid page-header mb-5 position-relative overlay-bottom">
        <div class="d-flex flex-column align-items-center justify-content-center pt-0 pt-lg-5" style="min-height: 400px">
            <h1 class="display-4 mb-3 mt-0 mt-lg-5 text-white text-uppercase">Menu</h1>
            <div class="d-inline-flex mb-lg-5">
                <p class="m-0 text-white"><a class="text-white" href="index.jsp">Home</a></p>
                <p class="m-0 text-white px-2">/</p>
                <p class="m-0 text-white">Order Page</p>
            </div>
        </div>
    </div>
    <!-- Page Header End -->
    <!-- Cart Start -->
    <div id="cart-icon">
        <i class="fa fa-shopping-cart"></i>
        <%
            try{
            List<item> cart=(List<item>)session.getAttribute("cart");
            if (cart==null) {
        %>
        <span id="cart-count">0</span>
        <%
            }
            else{  
        %>
        <span id="cart-count"><%=cart.size()%></span>
        <%
            }
        %>
    </div>
    <div id="cart-box" style="display:none">
       <div id="cart-header">
        <h2><i class="fa fa-shopping-cart"></i> YOUR CART</h2>
       </div>
       <div id="cart-items">
        <% 
            if (cart==null || cart.isEmpty()) {
        %>
        -- Giỏ hàng trống --
        <%
        } else {
        %>
        <table>
                <thead>
                    <tr>
                        <th style="padding:20px">Product Name</th>
                        <th style="padding:10px">Price</th>
                        <th style="padding:5px">Quantity</th>
                        <th>Total Price</th>
                    </tr>
                </thead>
                <%
                    for (item i : cart) {
                %>
                <tbody>
                        <tr>
                            <td><%=i.getSanpham().getTen()%></td>
                            <td><%=i.getSanpham().getGia()%></td>
                            <td>
                                <form method="post" action="/Coffe_Shop/CartUpdateServlet">
                                    <input type="hidden" name="id" value="<%= i.getSanpham().getId()%>">
                                    <div class="cart-quantity">
                                        <button type="submit" class="cart-quantity-button" name="action" value="decrease">
                                            &#8722;
                                        </button>
                                        <span class="cart-quantity-input"><%= i.getSoluong()%></span>
                                        <button type="submit" class="cart-quantity-button" name="action" value="increase">
                                            &#43;
                                        </button>
                                    </div>
                                </form>
                            </td>
                            <td><%=i.getTotalprice()%></td> 
                            <td>
                                <form method="post" action="/Coffe_Shop/CartRemoveServlet">
                                    <input type="hidden" name="id" value="<%= i.getSanpham().getId()%>">
                                    <button type="submit" class="cart-remove-button" onclick="removeFromCart(<%= i.getSanpham().getId()%>)">
                                        <i class="fa fa-trash"></i>
                                    </button>
                                </form>
                            </td>
                        </tr>
                <%
                    }
              
                        
                    }
                        }catch (Exception ex){
                            out.println("Loi " + ex.getMessage());
                    }
                
                %>    
                </tbody>
            </table>
 
       </div>
       <button id="cart-checkout-button" style="margin-left:27%">Checkout</button>
    </div>
    <!-- Cart End-->
    <!-- Menu Start -->
    <div class="container-fluid pt-5">
        <div class="container">
            <div class="section-title">
                <h4 class="text-primary text-uppercase" style="letter-spacing: 5px;">Menu & Pricing</h4>
                <h1 class="display-4">Competitive Pricing</h1>
            </div>
            <div class="row">
                <div class="col-lg-6">
                    <h1 class="mb-5">Hot Coffee</h1>
                    <%@include file = "SQLDataAccess.jsp"%>
                        <%
                        try {
                            SQLDataAccess con = new SQLDataAccess();
                            ResultSet rs = con.getResultSet("Select * From tbMenu");
                            while (rs.next()) {
                            if (rs.getInt("maLoai")==1 || rs.getInt("maLoai")==3)
                            {
                        %>
                        <div class="row align-items-center mb-5">
                            <div class="col-4 col-sm-3">
                                <img class="w-100 rounded-circle mb-3 mb-sm-0" src="img/<%=rs.getString("hinhAnh")%>" alt="">
                                <h5 class="menu-price">$<%=rs.getInt("donGia")%></h5>
                            </div>
                            <div class="col-8 col-sm-9">
                                <h4><%=rs.getString("tenSP")%></h4>
                                <p class="m-0"><%=rs.getString("moTa")%></p>
                                <!-- Thêm form để thêm sản phẩm vào giỏ hàng -->
                            <form action="/Coffe_Shop/AddCart" method="post">
                                <input type="hidden" name="masp" value="<%=rs.getInt("maSP")%>">
                                <input type="hidden" name="productName" value="<%=rs.getString("tenSP")%>">
                                <input type="hidden" name="price" value="<%=rs.getInt("donGia")%>">
                                <input type="hidden" name="image" value="<%=rs.getString("hinhAnh")%>">
                                <input type="hidden" name="mota" value="<%=rs.getString("moTa")%>">
                                <input type="hidden" name="maloai" value="<%=rs.getInt("maLoai")%>">
                                <button 
                                    style="background-color: #491217;
                                        color: #fff;
                                        border: none;
                                        padding: 10px 20px;
                                        font-size: 16px;
                                        border-radius: 1px;
                                        cursor: pointer;
                                        text-shadow: 0 1px 0 #fff, 0 -1px 0 #fff, 1px 0 0 #fff, -1px 0 0 #fff; /* tạo bóng chữ */
                                        box-shadow: 2px 2px 5px rgba(0, 0, 0, 0.1); /* tạo bóng nút */"  
                                type="submit">Add to cart</button>
                            </form>
                            </div>
                        </div>
                        <%
                            }
                            }
                        } catch (SQLException e) {
                            out.println("Loi connect" + e.getMessage());
                        }
                        %>
                </div>
                <div class="col-lg-6">
                    <h1 class="mb-5">Cold Coffee</h1>
                    <%
                        try {
                            SQLDataAccess con = new SQLDataAccess();
                            ResultSet rs = con.getResultSet("Select * From tbMenu");
                            while (rs.next()) {
                            if (rs.getInt("maLoai")==2 || rs.getInt("maLoai")==3)
                            {
                        %>
                        <div class="row align-items-center mb-5">
                            <div class="col-4 col-sm-3">
                                <img class="w-100 rounded-circle mb-3 mb-sm-0" src="img/<%=rs.getString("hinhAnh")%>" alt="">
                                <h5 class="menu-price">$<%=rs.getInt("donGia")%></h5>
                            </div>
                            <div class="col-8 col-sm-9">
                                <h4><%=rs.getString("tenSP")%></h4>
                                <p class="m-0"><%=rs.getString("moTa")%></p>
                                <form action="/Coffe_Shop/AddCart" method="post">
                                <input type="hidden" name="masp" value="<%=rs.getInt("maSP")%>">
                                <input type="hidden" name="productName" value="<%=rs.getString("tenSP")%>">
                                <input type="hidden" name="price" value="<%=rs.getInt("donGia")%>">
                                <input type="hidden" name="image" value="<%=rs.getString("hinhAnh")%>">
                                <input type="hidden" name="mota" value="<%=rs.getString("moTa")%>">
                                <input type="hidden" name="maloai" value="<%=rs.getInt("maLoai")%>">
                                <button 
                                    style="background-color: #491217;
                                        color: #fff;
                                        border: none;
                                        padding: 10px 20px;
                                        font-size: 16px;
                                        border-radius: 1px;
                                        cursor: pointer;
                                        text-shadow: 0 1px 0 #fff, 0 -1px 0 #fff, 1px 0 0 #fff, -1px 0 0 #fff; /* tạo bóng chữ */
                                        box-shadow: 2px 2px 5px rgba(0, 0, 0, 0.1); /* tạo bóng nút */"  
                                type="submit">Add to cart</button>
                            </form>
                            </div>
                        </div>
                        <%
                            }
                            }
                        } catch (SQLException e) {
                            out.println("Loi connect" + e.getMessage());
                        }
                        %>
                </div>
            </div>
        </div>
    </div>
    <!-- Menu End -->


    <!-- Footer Start -->
    <div class="container-fluid footer text-white mt-5 pt-5 px-0 position-relative overlay-top">
        <div class="row mx-0 pt-5 px-sm-3 px-lg-5 mt-4">
            <div class="col-lg-3 col-md-6 mb-5">
                <h4 class="text-white text-uppercase mb-4" style="letter-spacing: 3px;">Get In Touch</h4>
                <p><i class="fa fa-map-marker-alt mr-2"></i>123 Street, New York, USA</p>
                <p><i class="fa fa-phone-alt mr-2"></i>+012 345 67890</p>
                <p class="m-0"><i class="fa fa-envelope mr-2"></i>info@example.com</p>
            </div>
            <div class="col-lg-3 col-md-6 mb-5">
                <h4 class="text-white text-uppercase mb-4" style="letter-spacing: 3px;">Follow Us</h4>
                <p>Amet elitr vero magna sed ipsum sit kasd sea elitr lorem rebum</p>
                <div class="d-flex justify-content-start">
                    <a class="btn btn-lg btn-outline-light btn-lg-square mr-2" href="#"><i class="fab fa-twitter"></i></a>
                    <a class="btn btn-lg btn-outline-light btn-lg-square mr-2" href="#"><i class="fab fa-facebook-f"></i></a>
                    <a class="btn btn-lg btn-outline-light btn-lg-square mr-2" href="#"><i class="fab fa-linkedin-in"></i></a>
                    <a class="btn btn-lg btn-outline-light btn-lg-square" href="#"><i class="fab fa-instagram"></i></a>
                </div>
            </div>
            <div class="col-lg-3 col-md-6 mb-5">
                <h4 class="text-white text-uppercase mb-4" style="letter-spacing: 3px;">Open Hours</h4>
                <div>
                    <h6 class="text-white text-uppercase">Monday - Friday</h6>
                    <p>8.00 AM - 8.00 PM</p>
                    <h6 class="text-white text-uppercase">Saturday - Sunday</h6>
                    <p>2.00 PM - 8.00 PM</p>
                </div>
            </div>
            <div class="col-lg-3 col-md-6 mb-5">
                <h4 class="text-white text-uppercase mb-4" style="letter-spacing: 3px;">Newsletter</h4>
                <p>Amet elitr vero magna sed ipsum sit kasd sea elitr lorem rebum</p>
                <div class="w-100">
                    <div class="input-group">
                        <input type="text" class="form-control border-light" style="padding: 25px;" placeholder="Your Email">
                        <div class="input-group-append">
                            <button class="btn btn-primary font-weight-bold px-3">Sign Up</button>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <div class="container-fluid text-center text-white border-top mt-4 py-4 px-sm-3 px-md-5" style="border-color: rgba(256, 256, 256, .1) !important;">
            <p class="mb-2 text-white">Copyright &copy; <a class="font-weight-bold" href="#">Domain</a>. All Rights Reserved.</a></p>
            <p class="m-0 text-white">Designed by <a class="font-weight-bold" href="https://htmlcodex.com">HTML Codex</a></p>
        </div>
    </div>
    <!-- Footer End -->


    <!-- Back to Top -->
    <a href="#" class="btn btn-lg btn-primary btn-lg-square back-to-top"><i class="fa fa-angle-double-up"></i></a>


    <!-- JavaScript Libraries -->
    <script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.bundle.min.js"></script>
    <script src="lib/easing/easing.min.js"></script>
    <script src="lib/waypoints/waypoints.min.js"></script>
    <script src="lib/owlcarousel/owl.carousel.min.js"></script>
    <script src="lib/tempusdominus/js/moment.min.js"></script>
    <script src="lib/tempusdominus/js/moment-timezone.min.js"></script>
    <script src="lib/tempusdominus/js/tempusdominus-bootstrap-4.min.js"></script>

    <!-- Contact Javascript File -->
    <script src="mail/jqBootstrapValidation.min.js"></script>
    <script src="mail/contact.js"></script>

    <!-- Template Javascript -->
    <script src="js/main.js"></script>
    <!-- code JS gi? cho nút "gi? hàng" theo ng??i dùng -->
    <!--<script>
        window.onscroll = function() {
        var cartIcon = document.getElementById("cart-icon");
        var scrollPosition = window.scrollY || document.documentElement.scrollTop;
        cartIcon.style.top = (scrollPosition/3) + "px";
      };
    </script>-->
    <script>
        var cartIcon = document.getElementById("cart-icon");
        var cartBox = document.getElementById("cart-box");
        cartIcon.addEventListener("click", function() {
            cartBox.style.display = cartBox.style.display === "none" ? "table" : "none";
            cartIcon.classList.toggle("active");
        });
    </script>
    <script>
        function removeFromCart(itemId) {
        var xhr = new XMLHttpRequest();
        xhr.open("POST", "CartRemoveServlet");
        xhr.setRequestHeader("Content-type", "application/x-www-form-urlencoded");
        xhr.onload = function() {
            if (xhr.status === 200) {
              // Xóa sản phẩm thành công
              // Cập nhật lại giỏ hàng trên trang web nếu cần
            }
          };
          xhr.send("id=" + itemId);
        }

    </script>
</body>

</html>