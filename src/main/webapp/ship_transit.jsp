<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    <%@ page session="true" %>
<!DOCTYPE html>
<html lang="en" class="">

<head>
  <meta charset="utf-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <title>Shipping</title>

  <link rel="stylesheet" href="ship/css/main.css?v=1628755089081">

  <link rel="apple-touch-icon" sizes="180x180" href="ship/img/favicon.png" />
  <link rel="icon" type="image/png" sizes="32x32" href="ship/img/favicon.png" />
  <link rel="icon" type="image/png" sizes="16x16" href="ship/img/favicon.png" />
  <link rel="mask-icon" href="ship/safari-pinned-tab.svg" color="#00b4b6" />

  <meta name="description" content="Hipster store - Ship">

  <!-- Global site tag (gtag.js) - Google Analytics -->
  <script async src="https://www.googletagmanager.com/gtag/js?id=UA-130795909-1"></script>
  <script>
    window.dataLayer = window.dataLayer || [];
    function gtag() { dataLayer.push(arguments); }
    gtag('js', new Date());
    gtag('config', 'UA-130795909-1');
  </script>

</head>

<body>

  <div id="app">

    <nav id="navbar-main" class="navbar is-fixed-top">

      <div class="navbar-menu" id="navbar-menu">
        <div class="navbar-end">
          <div class="navbar-item dropdown has-divider has-user-avatar">
            <a class="navbar-link">
              <div class="user-avatar">
                <img src="${admin.img}" alt="" class="rounded-full">
              </div>
              <div class="is-user-name"><span>${admin.username}</span></div>
              <span class="icon"><i class="mdi mdi-chevron-down"></i></span>
            </a>
            <div class="navbar-dropdown">
              <a href="profile" class="navbar-item">
                <span class="icon"><i class="mdi mdi-account"></i></span>
                <span>My Profile</span>
              </a>
              
              <hr class="navbar-divider">
              <a class="navbar-item" href="logout">
                <span class="icon"><i class="mdi mdi-logout"></i></span>
                <span>Log Out</span>
              </a>
            </div>
          </div>
        </div>
      </div>
    </nav>

    <c:import url="NavShip.html"/>



    <section class="section main-section">
      <div class="card has-table">
        <header class="card-header">
          <p class="card-header-title">
            <span class="icon"><i class="mdi mdi-account-multiple"></i></span>
            Manage Order In Transit
          </p>
        </header>
        <div class="card-content">
          <table>
            <thead>
            <tr>
              <th>Order Id</th>
              <th>Username</th>
              <th>Status Order</th>
              <th>Delivery Address</th>
              <th>Total_Price</th>
              <th>Created At</th>
              <th>Status Payment</th>
              <th>Pick Up</th>
              <th>Phone</th>
              <th></th>
              
            </tr>
            </thead>
            <tbody>
              <c:forEach items="${shipper}" var="shippers" >
                <tr>
                  <td>
                    ${shippers.order.orderDetail.order_id}
                  </td>
                  <td>${shippers.order.orderDetail.username}</td>
                  <td>${shippers.order.orderDetail.status_order}</td>
                  <td>${shippers.order.orderDetail.delivery_address}</td>
                  <td>${shippers.order.orderDetail.total_price}</td>
                  <td>${shippers.order.orderDetail.created_at}</td>
                  <td>${shippers.order.orderDetail.status_Payment}</td>
                  <td>${shippers.time_pick_up}</td>
                  <td>${shippers.phone}</td>
                  <td class="actions-cell">
                    <div class="buttons right nowrap">
                      <button class="button small green --jb-modal" data-target="sample-modal-2-${shippers.order.orderDetail.order_id}" type="button">
                          Completed
                      </button>
  
                      <button class="button small green --jb-modal" data-target="sample-modal-3-${shippers.order.orderDetail.order_id}" type="button">
                          Failed
                      </button>
  
                    </div>
                  </td>
                </tr>
              </c:forEach>
            </tbody>
          </table>
          <!-- <div class="table-pagination">
            <div class="flex items-center justify-between">
              <div class="buttons">
                <button type="button" class="button active">1</button>
                <button type="button" class="button">2</button>
                <button type="button" class="button">3</button>
              </div>
              <small>Page 1 of 3</small>
            </div>
          </div> -->
        </div>
      </div>

      <footer class="footer">
        <div class="flex flex-col md:flex-row items-center justify-between space-y-3 md:space-y-0">
          <div class="flex items-center justify-start space-x-3">
            <div>
              Copyright © 2023 Hipsterstore All rights reserved.
            </div>
          </div>
        </div>
      </footer>
      <c:forEach items="${shipper}" var="shippers" >

        <div id="sample-modal-2-${shippers.order.orderDetail.order_id}" class="modal">
          <div class="modal-background --jb-modal-close"></div>
          <div class="modal-card">
            <header class="modal-card-head">
              <p class="modal-card-title">DELIVERY COMPLETED!</p>
            </header>
            <section class="modal-card-body">
              <p>Are you sure the order has been successfully delivered?</p>
            </section>
            <footer class="modal-card-foot">
              <button class="button --jb-modal-close">Cancel</button>
              <a href="success?order_id=${shippers.order.orderDetail.order_id}" class="button blue ">Confirm</a>
            </footer>
          </div>
        </div>
      </c:forEach>
      <c:forEach items="${shipper}" var="shippers" >
        <form action="faildDelivery" method="post">

          <div id="sample-modal-3-${shippers.order.orderDetail.order_id}" class="modal">
            <div class="modal-background --jb-modal-close"></div>
            <div class="modal-card">
              <header class="modal-card-head">
                <p class="modal-card-title">FAILED DELIVERY!</p>
              </header>
              <section class="modal-card-body">
                <p>Are you sure the order was not delivered successfully?</p>
                <div class="field">
                    <label class="label">The reason for the unsuccessful delivery</label>
                    <div class="control">
                      <input type="hidden" value="${shippers.order.orderDetail.order_id}" name="order_id">
                      <textarea class="textarea" placeholder="Reason" name="reason"></textarea>
                    </div>
                  </div>
              </section>
              <footer class="modal-card-foot">
                <button class="button --jb-modal-close">Cancel</button>
                <button class="button blue " type="submit" >Confirm</button>
              </footer>
            </div>
          </div>
        </form>
      </c:forEach>



  </div>

  <!-- Scripts below are for demo only -->
  <script type="text/javascript" src="ship/js/main.min.js?v=1628755089081"></script>


  <script>
    !function (f, b, e, v, n, t, s) {
      if (f.fbq) return; n = f.fbq = function () {
        n.callMethod ?
        n.callMethod.apply(n, arguments) : n.queue.push(arguments)
      };
      if (!f._fbq) f._fbq = n; n.push = n; n.loaded = !0; n.version = '2.0';
      n.queue = []; t = b.createElement(e); t.async = !0;
      t.src = v; s = b.getElementsByTagName(e)[0];
      s.parentNode.insertBefore(t, s)
    }(window, document, 'script',
      'https://connect.facebook.net/en_US/fbevents.js');
    fbq('init', '658339141622648');
    fbq('track', 'PageView');
  </script>
  <noscript><img height="1" width="1" style="display:none"
      src="https://www.facebook.com/tr?id=658339141622648&ev=PageView&noscript=1" /></noscript>

  <!-- Icons below are for demo only. Feel free to use any icon pack. Docs: https://bulma.io/documentation/elements/icon/ -->
  <link rel="stylesheet" href="https://cdn.materialdesignicons.com/4.9.95/css/materialdesignicons.min.css">

</body>

</html>