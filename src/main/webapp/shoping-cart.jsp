<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page session="true" %>
<!DOCTYPE html>
<html lang="en">
  <head>
    <title>Shoping Cart</title>
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1" />
    <!--===============================================================================================-->
    <link rel="icon" type="image/png" href="images/icons/favicon.png" />
    <!--===============================================================================================-->
    <link rel="stylesheet" type="text/css" href="vendor/bootstrap/css/bootstrap.min.css" />
    <!--===============================================================================================-->
    <link rel="stylesheet" type="text/css" href="fonts/font-awesome-4.7.0/css/font-awesome.min.css" />
    <link
      rel="stylesheet"
      href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css"
      integrity="sha512-iecdLmaskl7CVkqkXNQ/ZH/XLlvWZOJyj7Yy7tcenmpD1ypASozpmT/E0iPtmFIB46ZmdtAc9eNBvH0H/ZpiBw=="
      crossorigin="anonymous"
      referrerpolicy="no-referrer"
    />
    <!--===============================================================================================-->
    <link rel="stylesheet" type="text/css" href="fonts/iconic/css/material-design-iconic-font.min.css" />
    <!--===============================================================================================-->
    <link rel="stylesheet" type="text/css" href="fonts/linearicons-v1.0.0/icon-font.min.css" />
    <!--===============================================================================================-->
    <link rel="stylesheet" type="text/css" href="vendor/animate/animate.css" />
    <!--===============================================================================================-->
    <link rel="stylesheet" type="text/css" href="vendor/css-hamburgers/hamburgers.min.css" />
    <!--===============================================================================================-->
    <link rel="stylesheet" type="text/css" href="vendor/animsition/css/animsition.min.css" />
    <!--===============================================================================================-->
    <link rel="stylesheet" type="text/css" href="vendor/select2/select2.min.css" />
    <!--===============================================================================================-->
    <link rel="stylesheet" type="text/css" href="vendor/perfect-scrollbar/perfect-scrollbar.css" />
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

    <!-- breadcrumb -->
    <div class="container">
      <div class="bread-crumb flex-w p-l-25 p-r-15 p-t-30 p-lr-0-lg">
        <a href="Home.jsp" class="stext-109 cl8 hov-cl1 trans-04">
          Home
          <i class="fa fa-angle-right m-l-9 m-r-10" aria-hidden="true"></i>
        </a>

        <span class="stext-109 cl4"> Shoping Cart </span>
      </div>
    </div>

    <!-- Shoping Cart -->
    <div class="bg0 p-t-75 p-b-85">
      <div class="container">
        <div class="row">
          <div class="col-lg-10 col-xl-7 m-lr-auto m-b-50">
            <form action="updateCart" method="post">
              <div class="m-l-25 m-r--38 m-lr-0-xl">
                <div class="wrap-table-shopping-cart">
                  <table class="table-shopping-cart">
                    <tr class="table_head">
                      <th class="column-1">Product</th>
                      <th class="column-2"></th>
                      <th class="column-3">Size</th>
                      <th class="column-4">Quantity</th>
                      <th class="column-5">Total</th>
                      
                    </tr>
                    
  
                      <c:forEach items="${sessionScope.cart_user.list_product}" var="productCart">
                        <tr class="table_row">
                          <td class="column-1">
                            <div class="productId d-none">${productCart.product.product_id}/${productCart.size}</div>
                            <div class="how-itemcart1">
                              <img src="${productCart.product.img}" alt="IMG" />
                            </div>
                          </td>
                          <td class="column-2">
                            <div>${productCart.product.product_name}</div>
                            <div class="price_product">${productCart.product.profit_price} $</div>
                          </td>
                          <td class="column-3">
                            <select class="w-75 sizeTable" name="${productCart.product.product_id}size${productCart.size}" id="">
                              <option value="${productCart.size}">${productCart.size}</option>
                              <option value="38">38</option>
                              <option value="39">39</option>
                              <option value="40">40</option>
                              <option value="41">41</option>
                              <option value="42">42</option>
                              <option value="43">43</option>
                              <option value="44">44</option>
                            </select>
                          </td>
    
                          <td class="column-4">
                            <div class="wrap-num-product flex-w m-l-auto m-r-0">
                              <div class="btn-num-product-down cl8 hov-btn3 trans-04 flex-c-m">
                                <i class="fs-16 zmdi zmdi-minus"></i>
                              </div>
      
                              <input
                                class="mtext-104 cl3 txt-center num-product"
                                type="number"
                                name="${productCart.product.product_id}quantitysize${productCart.size}"
                                value="${productCart.quantity}"
                              />
      
                              <div class="btn-num-product-up cl8 hov-btn3 trans-04 flex-c-m">
                                <i class="fs-16 zmdi zmdi-plus"></i>
                              </div>
                            </div>
                          </td>
                          <td class="column-5"></td>
                          
  
                        </tr>
                      </c:forEach>
                    
  
                    
                  </table>
                </div>
  
                <div class="flex-w flex-sb-m bor15 p-t-18 p-b-15 p-lr-40 p-lr-15-sm">
                  <div class="flex-w flex-m m-r-20 m-tb-5">
                    <input
                      class="stext-104 cl2 plh4 size-117 bor13 p-lr-20 m-r-10 m-tb-5"
                      type="text"
                      name="coupon"
                      placeholder="Coupon Code"
                    />
                  </div>
  
                  <button type="submit" class="flex-c-m stext-101 cl2 size-119 bg8 bor13 hov-btn3 p-lr-15 trans-04 pointer m-tb-10 updateToCart">
                    Update To Cart
                  </button>
                </div>
              </div>
            </form>
          </div>

          <div class="col-sm-10 col-lg-7 col-xl-5 m-lr-auto m-b-50 cartTotal">
            <div class="bor10 p-lr-40 p-t-30 p-b-40 m-l-63 m-r-40 m-lr-0-xl p-lr-15-sm">
              <h4 class="mtext-109 cl2 p-b-30">Cart Totals</h4>

              <div class="flex-w flex-t bor12 p-b-13">
                <div class="size-208">
                  <span class="stext-110 cl2 "> Subtotal: </span>
                </div>

                <div class="size-209">
                  <span class="mtext-110 cl2 subtotal"></span>
                </div>
              </div>

              <div class="flex-w flex-t bor12 p-t-15 p-b-30">
                <div class="size-208 w-full-ssm">
                  <span class="stext-110 cl2"> Shipping: </span>
                </div>

                <div class="size-209 p-r-18 p-r-0-sm w-full-ssm">
                  <p class="stext-111 cl6 p-t-2">
                    There are no shipping methods available. Please double check your address, or contact us if you need
                    any help.
                  </p>

                  <div class="p-t-15">
                    <span class="stext-112 cl8"> Calculate Shipping </span>

                    <div class=" bg0 m-b-12">
                      <select name="calc_shipping_provinces " class="city w-100" >
                        <option value="">City</option>
                        <c:forEach items="${sessionScope.list_fee}" var="fee">
                          <option value="${fee.feeShip}">${fee.city}</option>
                        </c:forEach>
                      </select>
                      
                    </div>
                    <textarea class="form-control m-b-9 address" rows="5" placeholder="Address" name="address"></textarea>
                    <div class="flex-w">
                      <button class="flex-c-m stext-101 cl2 size-115 bg8 bor13 hov-btn3 p-lr-15 trans-04 pointer updateTotal">
                        Update Totals
                      </button>
                    </div>
                  </div>
                </div>
              </div>

              <div class="flex-w flex-t bor12 p-b-13 m-t-9">
                <div class="size-208">
                  <span class="paymentMethod"> Payment Methods </span>
                </div>

                <div class="size-209">
                  <span class="mtext-110 cl2 ">
                    <input type="radio" name="pay" class="payment" value="COD"> COD
                    <input type="radio" name="pay"  class="payment" value="VnPay">VnPay
                  </span>
                </div>
              </div>

              <div class="flex-w flex-t p-t-27 p-b-33">
                <div class="size-208">
                  <span class="mtext-101 cl2"> Total: </span>
                </div>

                <div class="size-209 p-t-1">
                  <span class="mtext-110 cl2 totalOfBill"> $0.0 </span>
                </div>
              </div>

              <a href="" class="flex-c-m stext-101 cl0 size-116 bg3 bor14 hov-btn3 p-lr-15 trans-04 pointer proceedToCheckout">
                Proceed to Checkout
              </a>
            </div>
          </div>
        </div>
      </div>
    </div>

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
                <a href="#" class="stext-107 cl7 hov-cl1 trans-04"> Converse </a>
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
                <a href="#" class="stext-107 cl7 hov-cl1 trans-04"> Track Order </a>
              </li>

              <li class="p-b-10">
                <a href="#" class="stext-107 cl7 hov-cl1 trans-04"> Shipping </a>
              </li>

              <li class="p-b-10">
                <a href="#" class="stext-107 cl7 hov-cl1 trans-04"> FAQs </a>
              </li>
            </ul>
          </div>

          <div class="col-sm-6 col-lg-3 p-b-50">
            <h4 class="stext-301 cl0 p-b-30">GET IN TOUCH</h4>

            <p class="stext-107 cl7 size-201">
              Any questions? Let us know in store at 8th floor, 379 Ngu Hanh Son Da Nang or call us on
            </p>
            <p>012931233</p>
          </div>
          <div class="col-sm-6 col-lg-3 p-b-50">
            <h4 class="stext-301 cl0 p-b-30">Subscribe</h4>
            <div class="p-t-27">
              <a href="#" class="fs-18 cl7 hov-cl1 trans-04 m-r-16">
                <i class="fa-brands fa-facebook"></i>
              </a>

              <a href="#" class="fs-18 cl7 hov-cl1 trans-04 m-r-16">
                <i class="fa-brands fa-instagram"></i>
              </a>

              <a href="#" class="fs-18 cl7 hov-cl1 trans-04 m-r-16">
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
    <script src="script/shopping_cart.js"></script>
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
    <!-- city -->
    <!-- <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.4.1/jquery.min.js" />
    <script src="https://cdn.jsdelivr.net/gh/vietblogdao/js/districts.min.js" />
    <script>
      //<![CDATA[
      if ((address_2 = localStorage.getItem("address_2_saved"))) {
        $('select[name="calc_shipping_district"] option').each(function () {
          if ($(this).text() == address_2) {
            $(this).attr("selected", "");
          }
        });
        $("input.billing_address_2").attr("value", address_2);
      }
      if ((district = localStorage.getItem("district"))) {
        $('select[name="calc_shipping_district"]').html(district);
        $('select[name="calc_shipping_district"]').on("change", function () {
          var target = $(this).children("option:selected");
          target.attr("selected", "");
          $('select[name="calc_shipping_district"] option').not(target).removeAttr("selected");
          address_2 = target.text();
          $("input.billing_address_2").attr("value", address_2);
          district = $('select[name="calc_shipping_district"]').html();
          localStorage.setItem("district", district);
          localStorage.setItem("address_2_saved", address_2);
        });
      }
      $('select[name="calc_shipping_provinces"]').each(function () {
        var $this = $(this),
          stc = "";
        c.forEach(function (i, e) {
          e += +1;
          stc += "<option value=" + e + ">" + i + "</option>";
          $this.html('<option value="">Tỉnh / Thành phố</option>' + stc);
          if ((address_1 = localStorage.getItem("address_1_saved"))) {
            $('select[name="calc_shipping_provinces"] option').each(function () {
              if ($(this).text() == address_1) {
                $(this).attr("selected", "");
              }
            });
            $("input.billing_address_1").attr("value", address_1);
          }
          $this.on("change", function (i) {
            i = $this.children("option:selected").index() - 1;
            var str = "",
              r = $this.val();
            if (r != "") {
              arr[i].forEach(function (el) {
                str += '<option value="' + el + '">' + el + "</option>";
                $('select[name="calc_shipping_district"]').html('<option value="">Quận / Huyện</option>' + str);
              });
              var address_1 = $this.children("option:selected").text();
              var district = $('select[name="calc_shipping_district"]').html();
              localStorage.setItem("address_1_saved", address_1);
              localStorage.setItem("district", district);
              $('select[name="calc_shipping_district"]').on("change", function () {
                var target = $(this).children("option:selected");
                target.attr("selected", "");
                $('select[name="calc_shipping_district"] option').not(target).removeAttr("selected");
                var address_2 = target.text();
                $("input.billing_address_2").attr("value", address_2);
                district = $('select[name="calc_shipping_district"]').html();
                localStorage.setItem("district", district);
                localStorage.setItem("address_2_saved", address_2);
              });
            } else {
              $('select[name="calc_shipping_district"]').html('<option value="">Quận / Huyện</option>');
              district = $('select[name="calc_shipping_district"]').html();
              localStorage.setItem("district", district);
              localStorage.removeItem("address_1_saved", address_1);
            }
          });
        });
      });
      //]]>
    </script> -->
    ////////
    <script src="script/product.js"></script>
    <script src="js/main.js"></script>
  </body>
</html>
