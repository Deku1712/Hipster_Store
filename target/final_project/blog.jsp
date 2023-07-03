<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page session="true" %>
<!DOCTYPE html>
<html lang="en">
  <head>
    <title>Blog</title>
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1" />
    <!--===============================================================================================-->
    <link rel="icon" type="image/png" href="images/icons/favicon.png" />
    <!--===============================================================================================-->
    <link
      rel="stylesheet"
      type="text/css"
      href="vendor/bootstrap/css/bootstrap.min.css"
    />
    <!--===============================================================================================-->
    <link
      rel="stylesheet"
      type="text/css"
      href="fonts/font-awesome-4.7.0/css/font-awesome.min.css"
    />
    <link
      rel="stylesheet"
      href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css"
      integrity="sha512-iecdLmaskl7CVkqkXNQ/ZH/XLlvWZOJyj7Yy7tcenmpD1ypASozpmT/E0iPtmFIB46ZmdtAc9eNBvH0H/ZpiBw=="
      crossorigin="anonymous"
      referrerpolicy="no-referrer"
    />
    <!--===============================================================================================-->
    <link
      rel="stylesheet"
      type="text/css"
      href="fonts/iconic/css/material-design-iconic-font.min.css"
    />
    <!--===============================================================================================-->
    <link
      rel="stylesheet"
      type="text/css"
      href="fonts/linearicons-v1.0.0/icon-font.min.css"
    />
    <!--===============================================================================================-->
    <link rel="stylesheet" type="text/css" href="vendor/animate/animate.css" />
    <!--===============================================================================================-->
    <link
      rel="stylesheet"
      type="text/css"
      href="vendor/css-hamburgers/hamburgers.min.css"
    />
    <!--===============================================================================================-->
    <link
      rel="stylesheet"
      type="text/css"
      href="vendor/animsition/css/animsition.min.css"
    />
    <!--===============================================================================================-->
    <link
      rel="stylesheet"
      type="text/css"
      href="vendor/select2/select2.min.css"
    />
    <!--===============================================================================================-->
    <link
      rel="stylesheet"
      type="text/css"
      href="vendor/perfect-scrollbar/perfect-scrollbar.css"
    />
    <!--===============================================================================================-->
    <link rel="stylesheet" type="text/css" href="css/util.css" />
    <link rel="stylesheet" type="text/css" href="css/main.css" />
    <link rel="stylesheet" href="css/styleHome.css">
    <!--===============================================================================================-->
  </head>
  <body class="animsition">
    <!-- Header -->
    <header class="header-v4">
      <!-- Header desktop -->
      <c:import url="Header.jsp" />
    </header>

<!-- Cart -->
<c:import url="Cart.jsp" />

    <!-- Title page -->
    <section class="bg-img1 txt-center p-lr-15 p-tb-92" style="background-image: url('images/bg-01.jpg')">
      <h2 class="ltext-105 cl0 txt-center">Blog</h2>
    </section>

    <!-- Content page -->
    <c:forEach items="${sessionScope.listContent}" var="content">
      <section class="bg0 p-t-62 p-b-60">
        <div class="container">
          <div class="row">
            <div class="col-md-8 col-lg-9 p-b-80">
              <div class="p-r-45 p-r-0-lg">
                <!-- item blog -->
                <div class="p-b-63">
                  <a href="blog-detail.jsp" class="hov-img0 how-pos5-parent">
                    <img src="${content.img}" alt="IMG-BLOG" />

                    <div class="flex-col-c-m size-123 bg9 how-pos5">
                      <span class="ltext-107 cl2 txt-center"> 4 </span>

                      <span class="stext-109 cl3 txt-center"> June 2023 </span>
                    </div>
                  </a>

                  <div class="p-t-32">
                    <h4 class="p-b-15">
                      <a href="blog-detail.jsp" class="ltext-108 cl2 hov-cl1 trans-04">
                        ${content.title}
                      </a>
                    </h4>

                    <p class="stext-117 cl6">
                      ${content.detail_title}
                    </p>

                    <div class="flex-w flex-sb-m p-t-18">
                      <span class="flex-w flex-m stext-111 cl2 p-r-30 m-tb-10">
                        <span>
                          <span class="cl4">By</span> Admin
                          <span class="cl12 m-l-4 m-r-6">|</span>
                        </span>

                        <span>
                          StreetStyle, Fashion, New
                          <span class="cl12 m-l-4 m-r-6"></span>
                        </span>
                      </span>

                      <a href="blog-detail?content_id=${content.id}" class="stext-101 cl2 hov-cl1 trans-04 m-tb-10">
                        Continue Reading

                        <i class="fa fa-long-arrow-right m-l-9"></i>
                      </a>
                    </div>
                  </div>
                </div>
              </div>
            </div>

            <div class="col-md-4 col-lg-3 p-b-80">
              <div class="side-menu">
                <div class="bor17 of-hidden pos-relative">
                  <input class="stext-103 cl2 plh4 size-116 p-l-28 p-r-55" type="text" name="search"
                    placeholder="Search" />

                  <button class="flex-c-m size-122 ab-t-r fs-18 cl4 hov-cl1 trans-04">
                    <i class="zmdi zmdi-search"></i>
                  </button>
                </div>

                <div class="p-t-55">
                  <h4 class="mtext-112 cl2 p-b-33">Categories</h4>

                  <ul>
                    <li class="bor18">
                      <a href="#" class="dis-block stext-115 cl6 hov-cl1 trans-04 p-tb-8 p-lr-4">
                        Fashion
                      </a>
                    </li>

                    <li class="bor18">
                      <a href="#" class="dis-block stext-115 cl6 hov-cl1 trans-04 p-tb-8 p-lr-4">
                        Beauty
                      </a>
                    </li>

                    <li class="bor18">
                      <a href="#" class="dis-block stext-115 cl6 hov-cl1 trans-04 p-tb-8 p-lr-4">
                        Street Style
                      </a>
                    </li>

                    <li class="bor18">
                      <a href="#" class="dis-block stext-115 cl6 hov-cl1 trans-04 p-tb-8 p-lr-4">
                        Life Style
                      </a>
                    </li>

                    <li class="bor18">
                      <a href="#" class="dis-block stext-115 cl6 hov-cl1 trans-04 p-tb-8 p-lr-4">
                        New
                      </a>
                    </li>
                  </ul>
                </div>

                <div class="p-t-50">
                  <h4 class="mtext-112 cl2 p-b-27">Tags</h4>

                  <div class="flex-w m-r--5">
                    <a href="#" class="flex-c-m stext-107 cl6 size-301 bor7 p-lr-15 hov-tag1 trans-04 m-r-5 m-b-5">
                      Fashion
                    </a>

                    <a href="#" class="flex-c-m stext-107 cl6 size-301 bor7 p-lr-15 hov-tag1 trans-04 m-r-5 m-b-5">
                      Comfortable
                    </a>

                    <a href="#" class="flex-c-m stext-107 cl6 size-301 bor7 p-lr-15 hov-tag1 trans-04 m-r-5 m-b-5">
                      New
                    </a>

                    <a href="#" class="flex-c-m stext-107 cl6 size-301 bor7 p-lr-15 hov-tag1 trans-04 m-r-5 m-b-5">
                      Streetstyle
                    </a>

                    <a href="#" class="flex-c-m stext-107 cl6 size-301 bor7 p-lr-15 hov-tag1 trans-04 m-r-5 m-b-5">
                      Trending
                    </a>
                  </div>
                </div>
              </div>
            </div>
          </div>
        </div>
      </section>
    </c:forEach>

    <!-- Footer -->
    <footer class="bg3 p-t-75 p-b-32">
      <div class="container">
        <div class="row">
          <div class="col-sm-6 col-lg-3 p-b-50">
            <h4 class="stext-301 cl0 p-b-30">Categories</h4>

            <ul>
              <li class="p-b-10">
                <a href="#" class="stext-107 cl7 hov-cl1 trans-04">Nike </a>
              </li>

              <li class="p-b-10">
                <a href="#" class="stext-107 cl7 hov-cl1 trans-04"> Adidas </a>
              </li>

              <li class="p-b-10">
                <a href="#" class="stext-107 cl7 hov-cl1 trans-04">
                  Converse
                </a>
              </li>

              <li class="p-b-10">
                <a href="#" class="stext-107 cl7 hov-cl1 trans-04"> Ananas</a>
              </li>
              <li class="p-b-10">
                <a href="#" class="stext-107 cl7 hov-cl1 trans-04"> Biti's </a>
              </li>
            </ul>
          </div>

          <div class="col-sm-6 col-lg-3 p-b-50">
            <h4 class="stext-301 cl0 p-b-30">Help</h4>

            <ul>
              <li class="p-b-10">
                <a href="#" class="stext-107 cl7 hov-cl1 trans-04">
                  Track Order
                </a>
              </li>

              <li class="p-b-10">
                <a href="#" class="stext-107 cl7 hov-cl1 trans-04">
                  Shipping
                </a>
              </li>

              <li class="p-b-10">
                <a href="#" class="stext-107 cl7 hov-cl1 trans-04"> FAQs </a>
              </li>
            </ul>
          </div>

          <div class="col-sm-6 col-lg-3 p-b-50">
            <h4 class="stext-301 cl0 p-b-30">GET IN TOUCH</h4>

            <p class="stext-107 cl7 size-201">
              FPT University Da Nang, Urban area FPT City, Ngu Hanh Son, Da Nang
            </p>
            <p>0947481545</p>
          </div>
          <div class="col-sm-6 col-lg-3 p-b-50">
            <h4 class="stext-301 cl0 p-b-30">Subscribe</h4>
            <div class="p-t-27">
              <a
                href="https://www.facebook.com/hipsterstore"
                class="fs-18 cl7 hov-cl1 trans-04 m-r-16"
              >
                <i class="fa-brands fa-facebook"></i>
              </a>

              <a
                href="https://www.instagram.com/thehipsterhouse/"
                class="fs-18 cl7 hov-cl1 trans-04 m-r-16"
              >
                <i class="fa-brands fa-instagram"></i>
              </a>

              <a
                href="https://www.tiktok.com"
                class="fs-18 cl7 hov-cl1 trans-04 m-r-16"
              >
                <i class="fa-brands fa-tiktok"></i>
              </a>
            </div>
          </div>
        </div>
      </div>
    </footer>

    <!-- Back to top -->
    <div class="btn-back-to-top" id="myBtn">
      <span class="symbol-btn-back-to-top">
        <i class="zmdi zmdi-chevron-up"></i>
      </span>
    </div>

    <!--===============================================================================================-->
    <script src="vendor/jquery/jquery-3.2.1.min.js"></script>
    <!--===============================================================================================-->
    <script src="vendor/animsition/js/animsition.min.js"></script>
    <!--===============================================================================================-->
    <script src="vendor/bootstrap/js/popper.js"></script>
    <script src="vendor/bootstrap/js/bootstrap.min.js"></script>
    <!--===============================================================================================-->
    <script src="vendor/select2/select2.min.js"></script>
    <script>
      $(".js-select2").each(function () {
        $(this).select2({
          minimumResultsForSearch: 20,
          dropdownParent: $(this).next(".dropDownSelect2"),
        });
      });
    </script>
    <!--===============================================================================================-->
    <script src="vendor/MagnificPopup/jquery.magnific-popup.min.js"></script>
    <!--===============================================================================================-->
    <script src="vendor/perfect-scrollbar/perfect-scrollbar.min.js"></script>
    <script>
      $(".js-pscroll").each(function () {
        $(this).css("position", "relative");
        $(this).css("overflow", "hidden");
        var ps = new PerfectScrollbar(this, {
          wheelSpeed: 1,
          scrollingThreshold: 1000,
          wheelPropagation: false,
        });

        $(window).on("resize", function () {
          ps.update();
        });
      });
    </script>
    <!--===============================================================================================-->
    <script src="script/product.js"></script>
    <script src="js/main.js"></script>
  </body>
</html>
