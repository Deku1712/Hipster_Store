<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
  <%@ page session="true" %>
<c:forEach items="${list_user}" var="user">
  <div id="sample-modal-${user.username}" class="modal">
    <div class="modal-background --jb-modal-close"></div>
    <form action="updateRole" method="post">
      <div class="modal-card " style="width: 100%;">
        <section class="modal-card-body vh-100 " style="background-color: #f4f5f7; ">
          <div class="container py-5 h-100 ">
            <div class="row d-flex justify-content-center align-items-center h-100 " style="width: 100%;">
              <div class="col-12">
                <div class="card mb-3" style="border-radius: .5rem;">
                  <div class="row g-0">
                    <div class="col-md-4 gradient-custom text-center text-white"
                      style="border-top-left-radius: .5rem; border-bottom-left-radius: .5rem; background: linear-gradient(to right bottom, rgba(246, 211, 101, 1), rgba(253, 160, 133, 1))">
                      <img src="${user.img}"
                        alt="Avatar" class="img-fluid my-5" style="width: 130px; height: 130px; margin: 0 auto; border: 1px solid; border-radius: 50% ;  object-fit: cover;" />
                      <h5>${user.username}</h5>
                      <h6>${user.role}</h6>
                      <input type="hidden" value="${user.username}" name="userUpdate">
                      
                    </div>
                    <div class="col-md-8">
                      <div class="card-body p-4">
                        <h6>Information</h6>
                        <hr class="mt-0 mb-4">
                        <div class="row pt-1">
                          <div class="col-6 mb-3">
                            <h6>Email</h6>
                            <p class="text-muted">${user.email}</p>
                          </div>
                          <div class="col-6 mb-3">
                            <h6>Phone</h6>
                            <p class="text-muted">${user.phone}</p>
                          </div>
                        </div>
                        <h6>${user.fullname}</h6>
                        <hr class="mt-0 mb-4">
                        <div class="row pt-1">
                          <div class="col-6 mb-3">
                            <h6>Address</h6>
                            <p class="text-muted">${user.address}</p>
                          </div>
                          <div class="col-6 mb-3">
                            <h6>Update Role</h6>
                            <select name="role" id="" value="${user.role}" class="text-black" >
                              <option value="${user.role}"  selected>Select your option</option>
                              <option value="customer">Customer</option>
                              <option value="shipper">Shipper</option>
                              <option value="content">Content Creator</option>
                              <option value="admin">Admin</option>
                              <option value="seller">Seller</option>
                            </select>
                          </div>
                        </div>
                        
                      </div>
                    </div>
                  </div>
                </div>
              </div>
            </div>
          </div>
        </section>
        <footer class="modal-card-foot">
          <button class="button --jb-modal-close">Cancel</button>
          <button class="button red " type="submit">Confirm</button>
        </footer>
      </div>
    </form>
  </div>
</c:forEach>