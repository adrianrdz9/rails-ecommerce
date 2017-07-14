function quantityUpdated(id){
  document.querySelector("#product_total_"+id).innerHTML =
  document.querySelector("#product_unity_"+id).innerHTML *
  $("#"+id).val()
}
