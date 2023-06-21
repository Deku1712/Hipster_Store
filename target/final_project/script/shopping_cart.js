var checkButton = true;


var payment = document.getElementsByClassName('payment');




const table_row = document.querySelectorAll('.table_row');
function caculator(){
    for ( var i = 0 ; i < table_row.length; i++){
        var column_3 = parseFloat(table_row[i].querySelector('.price_product').textContent);
        var column_5 = table_row[i].querySelector('.column-5');
        var quantity = table_row[i].querySelector('input');
        column_5.textContent = column_3 * parseInt(quantity.value) + "$";
    }
}
caculator();


const columns = document.querySelectorAll('.table_row .column-1, .table_row .column-2');
const cartTotal = document.querySelector('.cartTotal');
var proceedToCheckout = cartTotal.querySelector('.proceedToCheckout');
var updateTotal = cartTotal.querySelector('.updateTotal');


columns.forEach(column => {
  column.addEventListener('click', (event) => {
    var columnClick = event.target;
    var table_row = columnClick.closest(".table_row");
    const isSelected = table_row.classList.contains("selected");
    if (isSelected) {
      table_row.classList.remove("selected");
    } else {
      table_row.classList.add("selected");
    }
    subtotal();
  });
});




proceedToCheckout.addEventListener('click', (event) => {
  event.preventDefault();
  if(checkButton){

    if (proceedToCheckout.href === "order?list_order=" || proceedToCheckout.href === "" ) {
      alert("Please complete all information ");
    } 
    else if(check()){
      var city = cartTotal.querySelector('.city');
      var address = cartTotal.querySelector('.address');
      var totalOfBill = cartTotal.querySelector('.totalOfBill');
      var pay = "";
      for ( var i = 0 ; i< payment.length; i++){
        if (payment[i].checked){
          pay = payment[i].value;
          console.log(pay);
          break;
        }
      }
      proceedToCheckout.href = proceedToCheckout.href + "&address="+address.value+"&city="+city.text +"&total="+totalOfBill.textContent+"&pay=" + pay;
      window.location.href = proceedToCheckout.href;
    }
  }
  else{
    alert("Looks like you haven't updated your cart to the latest status");
  }

  
});

function subtotal(){
  var link = '';
  const row_selected = document.querySelectorAll('.table_row.selected');
  var subtotal = document.querySelector('.subtotal');
  var total = 0 ;
  for ( var i = 0 ; i < row_selected.length; i++){
    var product_id = row_selected[i].querySelector('.productId').textContent;
    var column_5 = row_selected[i].querySelector('.column-5').textContent;
    var amount = parseFloat(column_5.replace("$",""));
    total += amount;
    link+= product_id + "--";
  }
  link = "order?list_order="+link;
  subtotal.textContent= "$" + total.toFixed(1);
  proceedToCheckout.href = link;
}


updateTotal.addEventListener("click", () =>{

  if(checkButton){
    if(check()){
      var totalOfBill = cartTotal.querySelector('.totalOfBill');
      var subtotal = parseFloat((cartTotal.querySelector('.subtotal').textContent).replace("$",""));
      var fee = parseFloat(cartTotal.querySelector('.city').value);
      totalOfBill.textContent = (subtotal + fee).toFixed(2) +"$";
    }
  }
  else{
    alert("Looks like you haven't updated your cart to the latest status");
  }


});


function check(){
  var flag = true;
  var city = cartTotal.querySelector('.city');
  var address = cartTotal.querySelector('.address');
  var subtotal = cartTotal.querySelector('.subtotal');
  if (city.value === "" || address.value === "" ){
    alert("Please complete all information ");
    flag =false;
  }
  else if(subtotal.textContent == null || subtotal.textContent === ""){
    alert("choose at least one product");
    flag = false;
  }
  return flag;
}


const btn_up = document.querySelectorAll('.btn-num-product-up');
const btn_down = document.querySelectorAll('.btn-num-product-down');
const sizeTable = document.querySelectorAll('.sizeTable');

btn_up.forEach(btn => {
  btn.addEventListener('click', () =>{
    checkButton = false;
  })
});
btn_down.forEach(btn => {
  btn.addEventListener('click', () =>{
    checkButton = false;
  })
});

sizeTable.forEach(size =>{
  size.addEventListener('change', ()=>{
    checkButton = false;
  })
});





