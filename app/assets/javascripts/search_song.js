function search_song(){
   $("#search_button").click(function(){
     var song = $("#song").val();
     $.ajax({
        url: "/songs/search/" + song,
        dataType: "JSON",
        timeout: 10000,
        beforeSend: function(){
           $("#result").html("Cargando...");
        },
        error: function(){
           $("#result").html("Error al intentar buscar el empleado. Por favor intente más tarde.");
        },
        success: function(res){
           if(res){
              $("#result").html('<a href="/songs/search/'+res.id+'"> '+song.name+' ' + song.singer_band + ' </a>');
           }else{
              $("#result").html("El legajo no le pertenece a ningún empleado.");
           }
        }
     })
  });
  
};




$(document).ready(function(){
   search_song();
});
