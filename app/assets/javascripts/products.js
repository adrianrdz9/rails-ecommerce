$(document).on("turbolinks:load", function(){
  document.querySelectorAll("[type='file']").forEach(function(control){
    control.addEventListener('change', function(ev){
      document.querySelector("[for='"+ this.id +"']").innerHTML = "Archivos seleccionados: <br/>";
      for (i = 0; i < ev.target.files.length; i ++) {
        document.querySelector("[for='"+ this.id +"']").innerHTML += ev.target.files[i].name;
        if (ev.target.files.length != i+1) {
          document.querySelector("[for='"+ this.id +"']").innerHTML += ",<br/>"
        }else{
          document.querySelector("[for='"+ this.id +"']").innerHTML += "."
        }
      }
    });
  });
})

$(document).on("turbolinks:load", function(){
  $("#img-0").removeClass("hidden");

  document.querySelectorAll(".images-previews").forEach(function(control){
    control.addEventListener("mouseover", function(ev){
      $(".products-images").addClass("hidden");


      $("#img-"+ev.target.id.split("-")[1]).removeClass("hidden")
    });
  })


  $(".lightbox-image").colorbox({width:"75%", height:"75%", scalePhotos: true});
});
