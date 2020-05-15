$(document).on('turbolinks:load', function() { 

  let counts =document.getElementsByClassName("menu__select--count")
  
  
  
  for(let $i = 0;$i<counts.length;$i++){
    counts[$i].addEventListener("change",function(){
      let food_id = this.getAttribute("id")
      console.log(food_id)
    })
  }

});

