$(document).on('turbolinks:load', function() { 

  let totalPrice= 0

  let counts =document.getElementsByClassName("menu__select--count")

  function appendConfirm(data){
    if(data.count != 0){
      let html = `<div class="confirm_area" data-confirm-id="${data.id}" data-confirm-price="${data.price}">
                    <p class="confirm_area--name">${data.name} ${data.count}つ</p>
                    <p class="confirm_area--price">¥ ${data.price} -</p>
                  </div>`
      $('.confirm_areas').append(html)
      let totalPriceView = document.getElementsByClassName("total_price")
      totalPrice += data.price
      totalPriceView[0].textContent = '¥ '+totalPrice
    }
  }

  function checkOrder(data){
    var orders = document.getElementsByClassName("confirm_area")
    for(let $i = 0;$i<orders.length;$i++){
      let id = orders[$i].getAttribute("data-confirm-id")
      let delPrice = orders[$i].getAttribute("data-confirm-price")
      if(id == data.id){
        let delPrice = orders[$i].getAttribute("data-confirm-price")
        totalPrice -= Number(delPrice)
        let totalPriceView = document.getElementsByClassName("total_price")
        totalPriceView[0].textContent = '¥ '+totalPrice
        orders[$i].remove()
      }
    }
  }

  function resetVal(data){
    forms = document.querySelectorAll('[data-food-id]')
    for(let i = 0;i<forms.length;i++){
      if(forms[i].getAttribute("data-food-id") == data.id){
        forms[i].value = 0
      }
    }
  }
  
  for(let $i = 0;$i<counts.length;$i++){
    counts[$i].addEventListener("change",function(){
      let food_id = this.getAttribute("data-food-id")
      let val = this.value;
      $.ajax({
        type: "get",
        data: {id: food_id,count: val},
        url: "/orders/food_data",
        dataType: "json"
      })
      .done(function(data){
        if(data.count >= 0 && data.count <= data.stock){
          checkOrder(data)
          appendConfirm(data)
        }
        else if(data.count > data.stock)
        {
          alert("申し訳ございません、"+data.name+"は残り"+data.stock+"個です")
          resetVal(data)
          checkOrder(data)
        }
      })
      .fail(function(){
        alert("通信に失敗しました")
      })
    })
  }
  
});

