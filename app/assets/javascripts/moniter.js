$(document).on('turbolinks:load', function() {

  function findLastOrder(){
    id=0
    orders = document.getElementsByClassName("order_table")
    for(i = 0;i<orders.length;i++){
      if(id < orders[i].getAttribute("data-order-id")){
        id =orders[i].getAttribute("data-order-id")
      }
    }
    return id
  }

  function checkOrder(){
    id = findLastOrder()
    $.ajax({
      type: "get",
      data: {id: id},
      url: "/orders/order_data",
      dataType: "json"
    })
    .done(function(data){
      if(data.id > id){
        location.reload()
      }
    })
    .fail(function(){
    
    })
  }

  if (document.location.pathname == "/orders"){
    setInterval(checkOrder,10000);
  }
})