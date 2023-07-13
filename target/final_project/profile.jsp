<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    <%@ page session="true" %>
        <!DOCTYPE html>
        <html lang="en">

        <head>
            <meta charset="UTF-8">
            <meta name="viewport" content="width=device-width, initial-scale=1.0">
            <title>Profile</title>
            <link rel="stylesheet" href="css/styleProfile.css">
            <link rel="stylesheet" type="text/css" href="vendor/bootstrap/css/bootstrap.min.css" />
            <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css">
            <link rel="stylesheet" type="text/css" href="css/util.css" />
        </head>

        <body>

            

            <c:set var="var_img" value="${profile_user.img}" />
            <c:if test="${empty var_img}">
                <c:set var="var_img" value="imgs/ava_user.jpg" />
            </c:if>
            <div class="container">
                <div class="content_left">
                    <div class="left_header">
                        <div class="img">
                            <img src="${var_img}" alt="">
                        </div>
                        <div class="user_info">
                            <p>${profile_user.fullname}</p>
                            <a href="logout">Log out</a>
                        </div>
                    </div>
                    <div class="left_content">
                        <button class="btn hover-zoom" data-target="profile">
                            <i class="fa-solid fa-house"></i>
                            <span>My account</span>
                        </button>
                        <button class="btn changePass" data-target="ChangePassword">
                            Change Password
                        </button>
                        <button class="btn hover-zoom " type="button" data-target="order"  >
                            <i class="fa-solid fa-list-radio"></i>
                            <span>Order Bill</span>
                        </button>
                        
                        
                        <button class="btn hover-zoom" data-target="notification">
                            <i class="fa-regular fa-bell"></i>
                            <span>Notification</span>
                        </button>

                        <a href="Home.jsp" class="btn hover-zoom" >
                            <i class="fa-solid fa-house"></i>
                            Back to home
                        </a>
                    </div>
                </div>
                <div class="content_right">
                    <!-- my account -->
                    <div id="profile" class="contentbtn">
                        <form action="updateProfile" method="post" enctype="multipart/form-data">
                            <div class="profile_header">
                                <p>My profile</p>
                                <p>Manage profile information for account security</p>
                            </div>
                            <div class="profile_content">
                                <div class="profile_content_left">
                                    <table>
                                        <tr>
                                            <td>Name</td>
                                            <td>
                                                <input type="text" name="nameUpdate" id=""
                                                    placeholder="${profile_user.fullname}" required>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td>Email</td>
                                            <td>
                                                <p>${profile_user.email}<a href="http://"> Change</a> </p>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td>Phone</td>
                                            <td>
                                                <input type="number" name="phone" placeholder="${profile_user.phone}" required>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td>Address</td>
                                            <td>
                                                <input type="text" name="address" placeholder="${profile_user.address}" required>
                                            </td>
                                        </tr>
                                    </table>
                                </div>
                                <div class="profile_contetn_right">
                                    <div class="img">
                                        <img src="${var_img}" alt="">
                                    </div>

                                    <div class="img_input">
                                        <input type="file" name="linkimg" required>
                                        <p>Maximum file size 1mb, PNG format</p>
                                    </div>
                                </div>
                            </div>
                            <button class="save" type="submit">Save</button>
                        </form>
                    </div>
                    <!-- end profile -->
                    <!-- change password -->
                    <div id="ChangePassword" class="contentbtn">
                        
                        <form action="changePassWord" method="post">
                        <div class="row">
                                <div class="col-sm-12">
                                    <label>Current Password</label>
                                    <div class="form-group pass_show"> 
                                        <input type="password" value="" name="currentPass" class="form-control" placeholder="Current Password"> 
                                    </div> 
                                        <label>New Password</label>
                                    <div class="form-group pass_show"> 
                                        <input type="password" value="" name="newPass" class="form-control" placeholder="New Password"> 
                                    </div> 
                                        <label>Confirm Password</label>
                                    <div class="form-group pass_show"> 
                                        <input type="password" value="" name="confirmPass" class="form-control" placeholder="Confirm Password"> 
                                    </div> 
                                </div> 
                                <button class="btn" type="submit">Save</button> 
                            </div>
                        </form>
                        
                    </div>
                    <!-- end change password -->
                    <!-- order -->
                    <div id="order" class="contentbtn">
                        <div id="myBtnContainer">
                            <button type="button" class="btn-orderType active" onclick="filterSelection('all')"> Show all</button>
                            <button type="button" class="btn-orderType" onclick="filterSelection('Processing')"> Processing</button>
                            <button type="button" class="btn-orderType" onclick="filterSelection(' Preparing for delivery')"> Prepare For shipping</button>
                            <button type="button" class="btn-orderType" onclick="filterSelection('shipping')"> Shipping</button>
                            <button type="button" class="btn-orderType" onclick="filterSelection('success')"> Success</button>
                          </div>

                        <div class="scrollable-content">
                            <div class="order-items">
                                <c:forEach items="${list_order}" var="order">
                                    <div class="item filterDiv ${order.orderDetail.status_order}">
                                        <div class="item-header">
                                            <div class="code">
                                                Code : ${order.orderDetail.order_id}
                                            </div>
                                            <div class="item-header-status_paid">
                                                <p>${order.orderDetail.status_Payment}</p>
                                            </div>
                                            <div class="item-header-status_order">
                                                <p>${order.orderDetail.status_order}</p>
                                            </div>
                                        </div>
                                        <c:forEach items="${order.list_item}" var="item">
                                            <div class="item-content">
                                                <div class="img">
                                                    <img src="${item.product.img}" alt="">
                                                </div>
                                                <div class="item-content-info">
                                                    <div class="item-name">
                                                        ${item.product.product_name}
                                                    </div>
                                                    <div class="item-detail">
                                                        <p>Color: ${item.product.color}</p>
                                                        <p>Size: ${item.size}</p>
                                                        <p>Price: ${item.product.profit_price} $</p>
                                                    </div>
                                                    <div class="item-quantity">
                                                        x ${item.quantity}
                                                    </div>
                                                    <div class="item-content-total">${item.product.profit_price*item.quantity} $</div>
                                                </div>
                                            </div>
                                            
                                        </c:forEach>
                                        <div class="item-footer">
                                            <div class="total">
                                                <p>Total: ${order.orderDetail.total_price} </p>
                                            </div>
                                            <div class="footer-detail">
                                                <div class="time">
                                                    <p>Created at : ${order.orderDetail.created_at} </p>
                                                    <p>Update at: ${order.orderDetail.update_at}</p>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </c:forEach>

                            </div>
                        </div>
                    </div>
                    <!-- end order -->

                    <div id="notification" class="contentbtn">
                        
                        <div class="scrollable-content">
                            <c:forEach items="${list_noti}" var="noti">
                                <div class="card m-b-9">
                                    <div class="card-header">
                                      ${noti.title}
                                    </div>
                                    <div class="card-body">
                                      <blockquote class="blockquote mb-0">
                                        <p>${noti.content}</p>
                                        <footer class="blockquote-footer">Created At:  <cite title="Source Title"> ${noti.create_at}</cite></footer>
                                      </blockquote>
                                    </div>
                                </div>
                            </c:forEach>
                        </div>
                        <a href="deleteNoti" class="btn btn-secondary btn-lg active" role="button" aria-pressed="true">Delete All Notification</a>
                    </div>



                </div>
            </div>
            <script src="script/profile.js"></script>
            
            
        </body>

        </html>