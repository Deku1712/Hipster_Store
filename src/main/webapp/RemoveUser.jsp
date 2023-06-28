<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
  <%@ page session="true" %>

<c:forEach items="${list_user}" var="user">
    <form action="RemoveUser" method="post">
        <div id="sample-modal-delete${user.username}" class="modal">
            <div class="modal-background --jb-modal-close"></div>
            <div class="modal-card">
              <header class="modal-card-head">
                <p class="modal-card-title">Confirm Delete</p>
              </header>
              <section class="modal-card-body">
                <p>Do you want to remove " <b>${user.username}</b> "</p>
                <p><b>Role: </b> ${user.role}</p>
                <input type="hidden" name="userRemove" value="${user.username}">
              </section>
              <footer class="modal-card-foot">
                <button class="button --jb-modal-close">Cancel</button>
                <button class="button red "  type="submit">Confirm</button>
              </footer>
            </div>
          </div>
    </form>

</c:forEach>
