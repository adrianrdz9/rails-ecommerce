;(function(){
  $(window).on("turbolinks:load", function(){
    let currenPosition = 0
    let maxPosition = $("#galeria .inner").children().length;
    setInterval(()=>{
      currenPosition = (currenPosition >= maxPosition) ? 0 : currenPosition;
      $("#galeria .inner").css({
        left: "-"+(currenPosition*100)+"%"
      })
      currenPosition ++;
    }, 3000)
  })
})()
