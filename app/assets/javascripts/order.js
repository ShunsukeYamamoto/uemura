$(document).on('turbolinks:load', function() { 

  let counts =document.getElementsByClassName("menu__select--count") 
  
  for(let $i = 0;$i<counts.length;$i++){
    counts[$i].addEventListener("change",function(){
      let food_id = this.getAttribute("data-food-id")
      let val = this.value;
      $.ajax({
        type: "get",
        data: {id: food_id,count: val},
        url: "/orders/data",
        dataType: "json"
      })
      .done(function(data){
        console.log(data.id)
        console.log(data.count)
      })
      .fail(function(){
        alert("通信に失敗しました")
      })
    })
  }

});

