var btnShow = document.querySelectorAll('.show');
btnShow.forEach(btn => {
    btn.addEventListener("click", (event)=>{
        var btnClick = event.target;
        var userRow = btnClick.closest('.user_row');
        
        var username = userRow.querySelector('.username').textContent;
        var email = userRow.querySelector('.email').textContent;
        var phone = userRow.querySelector('.phone').textContent;
        var img = userRow.querySelector('.userImg').getAttribute('src');
        var role = userRow.querySelector('.role').textContent;

        var modal_2 = document.getElementById("sample-modal-2");
        var namedetail = modal_2.querySelector('.name');
        var phonedetail = modal_2.querySelector('.phone');
        var emaildetail = modal_2.querySelector('.email');
        var roleDetail = modal_2.querySelector('.role');
        var imgDetail = modal_2.querySelector('.img');

        namedetail.textContent ="User: "+ username;
        emaildetail.textContent ="Gmail: " + email;
        phonedetail.textContent ="Phone number:  "+ phone;
        roleDetail.textContent = role;
        imgDetail.src = img;
        
        

    })
})