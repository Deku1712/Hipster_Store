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
        
        
        <div class="grid gap-6 grid-cols-1 md:grid-cols-3 mb-6">
            <div class="card">
              <div class="card-content">
                <div class="flex items-center justify-between">
                  <div class="widget-label">
                    <h3>
                        Undelivered Orders
                    </h3>
                    <h1>
                      ${faild}
                    </h1>
                  </div>
                  <span class="icon widget-icon text-green-500"><i class="mdi mdi-account-multiple mdi-48px"></i></span>
                </div>
              </div>
            </div>
            
      
            <div class="card">
              <div class="card-content">
                <div class="flex items-center justify-between">
                  <div class="widget-label">
                    <h3>
                        Orders Delivered Successfully
                    </h3>
                    <h1>
                      ${success}
                    </h1>
                  </div>
                  <span class="icon widget-icon text-red-500"><i class="mdi mdi-finance mdi-48px"></i></span>
                </div>
              </div>
            </div>
            
            <div class="card">
                <div class="card-content">
                  <div class="flex items-center justify-between">
                    <div class="widget-label">
                      <h3>
                        Revenue
                      </h3>
                      <h1>
                        ${revenue}
                      </h1>
                    </div>
                    <span class="icon widget-icon text-blue-500"><i class="mdi mdi-cart-outline mdi-48px"></i></span>
                  </div>
                </div>
              </div>
          </div>


      <div class="card has-table">
        <header class="card-header">
          <p class="card-header-title">
            <span class="icon"><i class="mdi mdi-account-multiple"></i></span>
            Manage Undelivered Orders
          </p>
        </header>
        <div class="card-content">
          <table>
            <thead>
            <tr>
              <th>Order Id</th>
              <th>Username</th>
              <th>Delivery Address</th>
              <th>Total_Price</th>
              <th>Created At</th>
              <th>Status Payment</th>
              <th>Pick Up</th>
              <th>Phone</th>
              <td>Deliver The Order</td>
              <th></th>
              
            </tr>
            </thead>
            <tbody>
              <c:forEach items="${deliveredOrder}" var="shippers" >
                <tr>
                  <td>
                    ${shippers.order.orderDetail.order_id}
                  </td>
                  <td>${shippers.order.orderDetail.username}</td>
                  <td>${shippers.order.orderDetail.delivery_address}</td>
                  <td>${shippers.order.orderDetail.total_price}</td>
                  <td>${shippers.order.orderDetail.created_at}</td>
                  <td>${shippers.order.orderDetail.status_Payment}</td>
                  <td>${shippers.time_pick_up}</td>
                  <td>${shippers.phone}</td>
                  <td data-label="DeliverTheOrder">
                    <button class="button small green --jb-modal" type="button">
                      ${shippers.order.orderDetail.status_order}
                    </button>
                </td>
                <td class="actions-cell">
                  <div class="buttons right nowrap">
                    <button class="button small green --jb-modal" data-target="sample-modal-${shippers.order.orderDetail.order_id}" type="button">
                      View details
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

      <div id="sample-modal" class="modal">
        <div class="modal-background --jb-modal-close"></div>
        <div class="modal-card">
          <header class="modal-card-head">
            <p class="modal-card-title">ORDER DETAILS</p>
          </header>
          <section class="modal-card-body">
            <p>PRODUCT<b>PRICE</b></p>
            <p>ADDRESS</p>
          </section>
          <footer class="modal-card-foot">
            <button class="button --jb-modal-close">Cancel</button>
          </footer>
        </div>
      </div>

      <div id="sample-modal-2" class="modal">
        <div class="modal-background --jb-modal-close"></div>
        <div class="modal-card">
          <header class="modal-card-head">
            <p class="modal-card-title">ACCEPT THE ORDER!</p>
          </header>
          <section class="modal-card-body">
            <p>Are you sure you will deliver this order?</p>
          </section>
          <footer class="modal-card-foot">
            <button class="button --jb-modal-close">Cancel</button>
            <button class="button blue --jb-modal-close">Confirm</button>
          </footer>
        </div>
      </div>

      <div id="sample-modal-3" class="modal">
        <div class="modal-background --jb-modal-close"></div>
        <div class="modal-card">
          <header class="modal-card-head">
            <p class="modal-card-title">REFUSE THE ORDER!</p>
          </header>
          <section class="modal-card-body">
            <p>Are you sure you don't want to deliver this order?</p>
          </section>
          <footer class="modal-card-foot">
            <button class="button --jb-modal-close">Cancel</button>
            <button class="button blue --jb-modal-close">Confirm</button>
          </footer>
        </div>
      </div>

      <c:forEach items="${deliveredOrder}" var="s">
        <div id="sample-modal-${s.order.orderDetail.order_id}" class="modal">
          <div class="modal-background --jb-modal-close"></div>
            <div class="modal-card" style="width: 70%;">
              <header class="modal-card-head">
                <p class="modal-card-title">Order :  ${s.order.orderDetail.order_id}</p>
              </header>
              <section class="modal-card-body">
                <table>
                    <tr>
                        <th>Order Id</th>
                        <th>Username</th>
                        <th>Status Order</th>
                        <th>Delivery Address</th>
                        <th>Total_Price</th>
                        <th>Created At</th>
                        <th>Status Payment</th>
                        <th></th>
                    </tr>
                    <tr>
    
                        <td>
                            ${s.order.orderDetail.order_id}
                          </td>
                        <td>${s.order.orderDetail.username}</td>
                        <td>${s.order.orderDetail.status_order}</td>
                        <td>${s.order.orderDetail.delivery_address}</td>
                        <td>${s.order.orderDetail.total_price}</td>
                        <td>${s.order.orderDetail.created_at}</td>
                        <td>${s.order.orderDetail.status_Payment}</td>
                    </tr>
                </table>
    
                <div class="detail_product" style="display: flex; flex-direction: row; justify-content: space-around;">
                    <c:forEach items="${s.order.list_item}" var="item">
                        
                        <div class="card mb-5" style="max-width: 540px; margin: 8px 0; border-radius: 5px;">
                            <div class="row g-0">
                              <div class="col-md-5">
                                <img src="${item.product.img}" class="img-fluid rounded-start" alt="...">
                              </div>
                              <div class="col-md-8">
                                <div class="card-body">
                                    <h5 class="card-title">${item.product.product_name}</h5>
                                    <p class="card-text">Color: ${item.product.color}</p>
                                    <p class="card-text">Size: ${item.size} x ${item.quantity}</p>
                                    <p class="card-text">Price: ${item.product.profit_price} $</p>
                                    <p class="card-text">Total: ${item.product.profit_price*item.quantity} $</p>
                                </div>
                              </div>
                            </div>
                        </div>
                        
                    </c:forEach>
                </div>
    
              </section>
              <footer class="modal-card-foot">
                <button class="button --jb-modal-close">Cancel</button>
              </footer>
            </div>
        </div>
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