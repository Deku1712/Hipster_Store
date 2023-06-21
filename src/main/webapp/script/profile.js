const buttons = document.querySelectorAll('.btn');
const contents = document.querySelectorAll('.contentbtn');
buttons.forEach(button => {
  button.addEventListener('click', () => {
    const target = button.dataset.target; // Lấy giá trị của thuộc tính data-target
    const content = document.getElementById(target); // Lấy phần tử content dựa trên ID
    contents.forEach(element => { 
        element.style.display = 'none';
    })
    // Kiểm tra nếu phần tử content tồn tại
    if (content) {
      content.style.display = 'block'; // Hiển thị nội dung
    }
  });
});


$(document).ready(function(){
  $('.pass_show').append('<span class="ptxt">Show</span>');  
  });
    
  
  $(document).on('click','.pass_show .ptxt', function(){ 
  
  $(this).text($(this).text() == "Show" ? "Hide" : "Show"); 
  
  $(this).prev().attr('type', function(index, attr){return attr == 'password' ? 'text' : 'password'; }); 
  
  });  