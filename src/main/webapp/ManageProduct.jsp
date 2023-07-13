<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
  <!DOCTYPE html>
  <html lang="en" class="">

  <head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>Admin-Manage Product</title>

    <!-- Tailwind is included -->
    <link rel="stylesheet" href="css/main1.css?v=1628755089081">
    <link rel="stylesheet" type="text/css" href="vendor/bootstrap/css/bootstrap.min.css" />
    <link rel="stylesheet" type="text/css" href="fonts/font-awesome-4.7.0/css/font-awesome.min.css" />



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
        <div class="navbar-brand">
        </div>
        <div class="navbar-brand is-right">
          <a class="navbar-item --jb-navbar-menu-toggle" data-target="navbar-menu">
            <span class="icon"><i class="mdi mdi-dots-vertical mdi-24px"></i></span>
          </a>
        </div>
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
      
      <c:import url="navMenu.html" />
      
      <section class="is-title-bar">
        <div class="flex flex-col md:flex-row items-center justify-between space-y-6 md:space-y-0">
          <ul>
            <li>Admin</li>
            <li>Manage Product</li>
          </ul>
          
        </div>
      </section>

      

      <section class="section main-section">
        
        <div class="card has-table">
          <header class="card-header">
            <p class="card-header-title">
              <span class="icon"><i class="mdi mdi-account-multiple"></i></span>
              Product Store
            </p>
            <button class="button small green --jb-modal" data-target="sample-modal-insert" type="button">
              <span class="icon"><i class="fa-solid fa-plus"></i></span>
            </button>
          </header>
          <div class="card-content">
            <table>
              <thead>
                <tr>
                  <th>Product ID</th>
                  <th class="image-cell"></th>
                  <th>Brand</th>
                  <th>Name</th>
                  <th>Color</th>
                  <th>Profit_price</th>
                  <th>Quantity</th>
                  <th>Created</th>
                  <th>Update_At</th>
                  <th></th>
                </tr>
              </thead>
              <tbody>
                <c:forEach items="${manageProduct}" var="product">
                  <tr>
                    <td>${product.product_id}</td>
                    <td class="image-cell">
                      <div class="image" style="width: 70px; height: 70px;">
                        <img src="${product.img}" class="rounded-full">
                      </div>
                    </td>
                    <td>${product.brand}</td>
                    <td>${product.product_name}</td>
                    <td>${product.color}</td>
                    <td>${product.profit_price} $</td>
                    <td>
                      ${product.quantity}
                    </td>
                    <td>
                      ${product.created_at}
                    </td>
                    <td>
                      ${product.update_at}
                    </td>
                    <td class="actions-cell">
                      <div class="buttons right nowrap">
                        <button class="button small green --jb-modal" data-target="sample-modal-${product.product_id}" type="button">
                          <span class="icon"><i class="mdi mdi-eye"></i></span>
                        </button>
                        <button class="button small red --jb-modal" data-target="sample-modal-delete${product.product_id}" type="button">
                          <span class="icon"><i class="mdi mdi-trash-can"></i></span>
                        </button>
                      </div>
                    </td>
                  </tr>
                </c:forEach>
              </tbody>
            </table>
            <div class="table-pagination">
              <div class="flex items-center justify-between">
                <div class="buttons">
                  <button type="button" class="button active">1</button>
                  <button type="button" class="button">2</button>
                  <button type="button" class="button">3</button>
                </div>
                <small>Page 1 of 3</small>
              </div>
            </div>
          </div>
        </div>

        <div class="notification green">
          <div class="flex flex-col md:flex-row items-center justify-between space-y-3 md:space-y-0">
            <div>
              <span class="icon"><i class="mdi mdi-buffer"></i></span>
              <b>Tightly wrapped.</b> Table header becomes card header
            </div>
            <button type="button" class="button small textual --jb-notification-dismiss">Dismiss</button>
          </div>
        </div>



        <div class="notification red">
          <div class="flex flex-col md:flex-row items-center justify-between space-y-3 md:space-y-0">
            <div>
              <span class="icon"><i class="mdi mdi-buffer"></i></span>
              <b>Empty table.</b>
            </div>
            <button type="button" class="button small textual --jb-notification-dismiss">Dismiss</button>
          </div>
        </div>

        <div class="card empty">
          <div class="card-content">
            <div>
              <span class="icon large"><i class="mdi mdi-emoticon-sad mdi-48px"></i></span>
            </div>
            <p>Nothing's here…</p>
          </div>
        </div>
      </section>

      <c:forEach items="${manageProduct}" var="product">
        <div id="sample-modal-delete${product.product_id}" class="modal">
          <div class="modal-background --jb-modal-close"></div>
          <form action="deleteProductStore" method="post">
            <div class="modal-card" style="width: 100%;">
              <header class="modal-card-head">
                <p class="modal-card-title">Do you want to delete Product: ${product.product_name}</p>
              </header>
              <section class="modal-card-body">
                <table>
                  <tr>
                    <th>Product ID</th>
                    <th class="image-cell"></th>
                    <th>Img</th>
                    <th>Brand</th>
                    <th>Name</th>
                    <th>Color</th>
                    <th>Profit_price</th>
                    <th>Quantity</th>
                    <th>Created</th>
                    <th>Update_At</th>
                  </tr>
                  <tr>
                    <td><input type="text" name="product_id" id="" value="${product.product_id}"
                        placeholder="${product.product_id}" readonly ></td>
                    <td class="image-cell">
                      <div class="image" style="width: 80px; height: 80px;">
                        <img src="${product.img}" class="rounded-full">
                      </div>
                    </td>
                    <td>
                    </td>
                    <td>
                      <input type="text" name="brandupdate" id="" placeholder="${product.brand}"
                        value="${product.brand}" readonly>
                    </td>
                    <td>
                      <input type="text" name="nameup" id="" placeholder="${product.product_name}"
                        value="${product.product_name}" readonly>
                    </td>
                    <td>
                      <input type="text" name="colorup" id="" placeholder="${product.color}" value="${product.color}" readonly>
                    </td>
                    <td>
                      ${product.profit_price} $
                    </td>
                    <td>
                      ${product.quantity}
                    </td>
                    <td>
                      ${product.created_at}
                    </td>
                    <td>
                      ${product.update_at}
                    </td>
                  </tr>
                  <tr>
                    <td colspan="10">
                      <textarea name="description" id="" cols="30" rows="10" aria-valuetext="${product.prouduct_description}" placeholder="${product.prouduct_description}" style="width: 100%;" readonly></textarea>
                    </td>
                  </tr>
                </table>
              </section>
              <footer class="modal-card-foot">
                <button class="button --jb-modal-close">Cancel</button>
                <button class="button red" type="submit">Confirm</button>
              </footer>
            </div>
          </form>
        </div>
      </c:forEach>


      <c:forEach items="${manageProduct}" var="product">
        <div id="sample-modal-${product.product_id}" class="modal">
          <div class="modal-background --jb-modal-close"></div>
          <form action="updateProduct" method="post" enctype="multipart/form-data" >

            <div class="modal-card" style="width: 100%;">
              <header class="modal-card-head">
                <p class="modal-card-title">View Detail</p>
              </header>
              <section class="modal-card-body">
                <table>
                  <tr>
                    <th>Product ID</th>
                    <th class="image-cell"></th>
                    <th>Img</th>
                    <th>Brand</th>
                    <th>Name</th>
                    <th>Color</th>
                    <th>Profit_price</th>
                    <th>Quantity</th>
                    <th>Created</th>
                    <th>Update_At</th>
                  </tr>
                  <tr>
                    <td><input type="text" name="product_id" id="" value="${product.product_id}"
                        placeholder="${product.product_id}" readonly ></td>
                    <td class="image-cell">
                      <div class="image" style="width: 80px; height: 80px;">
                        <img src="${product.img}" class="rounded-full">
                      </div>
                    </td>
                    <td>
                      <div class="img_input">
                        <input type="file" name="linkimg">
                        <input type="hidden" name="oldimg" value="${product.img}" readonly>
                      </div>
                    </td>
                    <td>
                      <input type="text" name="brandupdate" id="" placeholder="${product.brand}"
                        value="${product.brand}">
                    </td>
                    <td>
                      <input type="text" name="nameup" id="" placeholder="${product.product_name}"
                        value="${product.product_name}">
                    </td>
                    <td>
                      <input type="text" name="colorup" id="" placeholder="${product.color}" value="${product.color}">
                    </td>
                    <td>
                      ${product.profit_price} $
                    </td>
                    <td>
                      ${product.quantity}
                    </td>
                    <td>
                      ${product.created_at}
                    </td>
                    <td>
                      ${product.update_at}
                    </td>
                  </tr>
                  <tr>
                    <td colspan="10">
                      <input type="text" name="description" id="" value="${product.prouduct_description}" placeholder="${product.prouduct_description}" style="width: 100%; height: 30px;" >
                    </td>
                  </tr>
                </table>

                <div class="detail_product" style="display: flex; flex-direction: row; justify-content: space-around;">
                  <table class="table table-bordered" style="width: 30%; margin-right: 20px; padding: 5px;">
                    <tr>
                      <th>
                        Size
                      </th>
                      <th>
                        Quantity
                      </th>
                    </tr>
                    <c:forEach items="${product.sizeAndQuantitysize}" var="entry">
                      <tr>
                        <td>
                          ${entry.key}
                        </td>
                        <td>
                          <input type="number" min="0" placeholder="${entry.value}" name="${entry.key}"
                            value="${entry.value}">
                        </td>
                      </tr>
                    </c:forEach>
                  </table>

                  <table class=" table table-bordered " style="width: 50%; padding: 5px; height: 100px;">
                    <tr>
                      <th>Price</th>
                      <th>Original_Price</th>
                      <th>Start the day</th>
                      <th>End of day</th>
                    </tr>

                    <tr class="timeControl">
                      <td>${product.profit_price} $(+50)</td>
                      <td><input type="number" name="priceup" min="0" value="${product.profit_price - 50}" ></td>
                      <td><input type="date" name="start" class="startinput"  value="${product.price.startOfDate}" min="${product.created_at}" max="${product.price.endOfDate}" ></td>
                      <td><input type="date" name="end" class="endinput"  value="${product.price.endOfDate}" min="${product.price.startOfDate}" ></td>
                    </tr>

                    <tr>
                      <td>Product ID</td>
                      <td colspan="3">
                        <h3>History Change</h3>
                      </td>
                    </tr>
                    <c:forEach items="${product.historyChange}" var="history">
                      <tr>
                        <td>${history.product_id}</td>
                        <td>${history.price_input}</td>
                        <td>${history.startOfDate}</td>
                        <td>${history.endOfDate}</td>
                      </tr>
                    </c:forEach>
                  </table>
                </div>

              </section>
              <footer class="modal-card-foot">
                <button class="button --jb-modal-close">Cancel</button>
                <button class="button blue " type="submit">Confirm</button>
              </footer>
            </div>
          </form>
        </div>
      </c:forEach>
      
      <div id="sample-modal-insert" class="modal">
        <div class="modal-background --jb-modal-close"></div>
        <form action="insertProduct" method="post" enctype="multipart/form-data" >

          <div class="modal-card" style="width: 100%;">
            <header class="modal-card-head">
              <p class="modal-card-title">Insert Product</p>
            </header>
            <section class="modal-card-body">
              <table>
                <tr>
                  <th>Product ID</th>
                  <th class="image-cell"></th>
                  <th>Img</th>
                  <th>Brand</th>
                  <th>Name</th>
                  <th>Color</th>
                </tr>
                <tr>
                  <td></td>
                  <td class="image-cell">
                    
                  </td>
                  <td>
                    <div class="img_input">
                      <input type="file" name="linkimg" required>
                    </div>
                  </td>
                  <td>
                    <input type="text" name="brand+" id="" placeholder="brand"
                      required>
                  </td>
                  <td>
                    <input type="text" name="name+" id="" placeholder="Name product"
                      required>
                  </td>
                  <td>
                    <input type="text" name="color+" id="" placeholder="Color" required>
                  </td>

                </tr>
                <tr>
                  <td colspan="10">
                    <input type="text" name="description+" id=""  style="width: 100%; height: 30px;" required >
                  </td>
                </tr>
              </table>

              <div class="detail_product" style="display: flex; flex-direction: row; justify-content: space-around;">
                <table class="table table-bordered" style="width: 30%; margin-right: 20px; padding: 5px;">
                  <tr>
                    <th>
                      Size
                    </th>
                    <th>
                      Quantity
                    </th>
                  </tr>
                  
                    <tr>
                      <td>
                        36
                      </td>
                      <td>
                        <input type="number" min="0"  name="36"
                          required>
                      </td>
                    </tr>
                                      
                    <tr>
                      <td>
                        37
                      </td>
                      <td>
                        <input type="number" min="0"  name="37"
                          required>
                      </td>
                    </tr>
                                      
                    <tr>
                      <td>
                        38
                      </td>
                      <td>
                        <input type="number" min="0"  name="38"
                          required>
                      </td>
                    </tr>
                                      
                    <tr>
                      <td>
                        39
                      </td>
                      <td>
                        <input type="number" min="0"  name="39"
                          required>
                      </td>
                    </tr>
                                      
                    <tr>
                      <td>
                        40
                      </td>
                      <td>
                        <input type="number" min="0"  name="40"
                          required>
                      </td>
                    </tr>
                                      
                    <tr>
                      <td>
                        41
                      </td>
                      <td>
                        <input type="number" min="0"  name="41"
                          required>
                      </td>
                    </tr>
                                      
                    <tr>
                      <td>
                        42
                      </td>
                      <td>
                        <input type="number" min="0"  name="42"
                          required>
                      </td>
                    </tr>
                                      
                    <tr>
                      <td>
                        43
                      </td>
                      <td>
                        <input type="number" min="0"  name="43"
                          required>
                      </td>
                    </tr>
                  
                </table>

                <table class=" table table-bordered " style="width: 50%; padding: 5px; height: 100px;">
                  <tr>
                    <th>Price</th>
                    <th>Original_Price</th>
                    <th>Start the day</th>
                    <th>End of day</th>
                  </tr>

                  <tr class="timeControl">
                    <td></td>
                    <td><input type="number" name="price+" min="0" required ></td>
                    <td><input type="date" name="start+" id="startinsert" readonly   ></td>
                    <td><input type="date" name="end+" id="endinsert" required  ></td>
                  </tr>
                </table>
              </div>

            </section>
            <footer class="modal-card-foot">
              <button class="button --jb-modal-close">Cancel</button>
              <button class="button blue " type="submit">Confirm</button>
            </footer>
          </div>
        </form>
      </div>

      

    </div>

    <!-- Scripts below are for demo only -->
    <script src="js/main1.js"></script>
    <script>
      var startDate = document.querySelectorAll(".startinput");
      var endDate = document.querySelectorAll(".endinput");
      startDate.forEach(d => {
        d.addEventListener("change", (event) => {
          var changeE = event.target;
          var time = changeE.closest(".timeControl");
          
          var endDate = time.querySelector(".endinput");
          var endBegin = endDate.value;
          if(changeE.value > endBegin){
            changeE.value = endBegin;
            
          }
          endDate.min = changeE.value;
          
        });
      });

      var today = new Date().toISOString().split('T')[0];
      var startinsert = document.getElementById('startinsert');
      startinsert.value = today;
      var endinsert = document.getElementById('endinsert');
      endinsert.min = today;
      


      
    </script>
    
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