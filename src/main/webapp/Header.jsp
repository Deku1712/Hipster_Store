<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
  <%@ page session="true" %>


    <c:set var="list_size" value="${sessionScope.cart_user.list_product.size()}" />
    <!-- Header desktop -->
    <div class="container-menu-desktop">
      <div class="wrap-menu-desktop">
        <nav class="limiter-menu-desktop container">
          <!-- Logo desktop -->
          <a href="Home.jsp" class="logo">
            <img src="images/icons/logo-01.png" alt="IMG-LOGO" />
          </a>

          <!-- Menu desktop -->
          <div class="menu-desktop">
            <ul class="main-menu">
              <li class="active-menu">
                <a href="Home.jsp">Home</a>
              </li>

              <li>
                <a href="product">Shop</a>
                
              </li>

              <li>
                <a href="blog">Blog</a>
              </li>

              <li>
                <a href="about.jsp">About</a>
              </li>

              <li>
                <a href="contact.jsp">Contact</a>
              </li>
            </ul>
          </div>

          <!-- Icon header -->
          <div class="wrap-icon-header flex-w flex-r-m">
            <div class="icon-header-item cl2 hov-cl1 trans-04 p-l-22 p-r-11 js-show-modal-search">
              <i class="zmdi zmdi-search"></i>
            </div>
            <!-- chua login sẽ ẩn đi  -->
            <c:choose>
              <c:when test="${sessionScope.user != nul}">
                <div class="icon-header-item cl2 hov-cl1 trans-04 p-l-22 p-r-11 icon-header-noti js-show-cart"
                  data-notify="${list_size}">
                  <!-- so lượng item trong cart -->
                  <i class="zmdi zmdi-shopping-cart"></i>
                </div>
                <a href="profile" class="dis-block icon-header-item cl2 hov-cl1 trans-04 p-l-22">
                  <i class="fa-solid fa-user-large"></i>
                  <span class="fs-15">${sessionScope.user}</span>
                </a>

              </c:when>
              <c:otherwise>

                <a href="#" class="dis-block icon-header-item cl2 hov-cl1 trans-04 p-l-22" data-toggle="dropdown">
                  <i class="fa-solid fa-user-large"></i>
                </a>

                <ul class="dropdown-menu">
                  <li><a href="checkCookie">Login</a></li>
                  <li><a href="Login_SignUp.jsp">Sign Up</a></li>
                </ul>
              </c:otherwise>
            </c:choose>

          </div>
        </nav>
      </div>
    </div>

    <!-- Header Mobile -->
    <div class="wrap-header-mobile">
      <!-- Logo moblie -->
      <div class="logo-mobile">
        <a href="Home.jsp"><img src="images/icons/logo-01.png" alt="IMG-LOGO" /></a>
      </div>

      <!-- Icon header -->
      <div class="wrap-icon-header flex-w flex-r-m m-r-15">
        <div class="icon-header-item cl2 hov-cl1 trans-04 p-r-11 js-show-modal-search">
          <i class="zmdi zmdi-search"></i>
        </div>

        <c:choose>
              <c:when test="${sessionScope.user != nul}">
                <div class="icon-header-item cl2 hov-cl1 trans-04 p-l-22 p-r-11 icon-header-noti js-show-cart"
                  data-notify="${list_size}">
                  <!-- so lượng item trong cart -->
                  <i class="zmdi zmdi-shopping-cart"></i>
                </div>
                <a href="profile.jsp" class="dis-block icon-header-item cl2 hov-cl1 trans-04 p-l-22">
                  <i class="fa-solid fa-user-large"></i>
                  <span class="fs-15">${sessionScope.user}</span>
                </a>

              </c:when>
              <c:otherwise>

                <a href="#" class="dis-block icon-header-item cl2 hov-cl1 trans-04 p-l-22" data-toggle="dropdown">
                  <i class="fa-solid fa-user-large"></i>
                </a>

                <ul class="dropdown-menu">
                  <li><a href="checkCookie">Login</a></li>
                  <li><a href="Login_SignUp.jsp">Sign Up</a></li>
                </ul>
              </c:otherwise>
            </c:choose>
      </div>

      <!-- Button show menu -->
      <div class="btn-show-menu-mobile hamburger hamburger--squeeze">
        <span class="hamburger-box">
          <span class="hamburger-inner"></span>
        </span>
      </div>
    </div>

    <!-- Menu Mobile -->
    <div class="menu-mobile">
      <ul class="main-menu-m">
        <li>
          <a href="Home.jsp">Home</a>
        </li>

        <li>
          <a href="product">Shop</a>
          
          <span class="arrow-main-menu-m">
            <i class="fa fa-angle-right" aria-hidden="true"></i>
          </span>
        </li>

        <li>
          <a href="blog">Blog</a>
        </li>

        <li>
          <a href="about.jsp">About</a>
        </li>

        <li>
          <a href="contact.jsp">Contact</a>
        </li>
      </ul>
    </div>

    <!-- Modal Search -->
    <div class="modal-search-header flex-c-m trans-04 js-hide-modal-search">
      <div class="container-search-header">
        <button class="flex-c-m btn-hide-modal-search trans-04 js-hide-modal-search">
          <img src="images/icons/icon-close2.png" alt="CLOSE" />
        </button>

        <form action="Search" method="post" class="wrap-search-header flex-w p-l-15">
          <button class="flex-c-m trans-04">
            <i class="zmdi zmdi-search"></i>
          </button>
          <input class="plh3" type="text" name="search" placeholder="Search..." />
        </form>
      </div>
    </div>