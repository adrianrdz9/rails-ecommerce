$(document).on("turbolinks:load", function(){
  $(".quantity").change(function(ev){
    var id = ev.target.id.split("_")[1]
    console.log($("#unit_"+id));

    var newVal = $("#unit_"+id).html() * ev.target.value

    console.log(id);
    console.log(newVal);
    $("#productTotal_"+id).html(newVal)


    var totals = $(".product_total")
    console.log(total);
    var subtotal = 0;
    for (var i = 0; i < totals.length; i++) {
      console.log(totals[i]);
      subtotal += parseInt(totals[i].innerHTML)
    }

    $("#subtotal").html(subtotal)

    var total = 0

    if (subtotal < 1000) {
      total = subtotal + 150
      $("#delivery").html("+ $150")
    }else{
      $("#delivery").html("Gratis")
      total = subtotal
    }

    $("#total").html(total)
  })
})
