$(document).ready(function() {


  $('#refresh-button').click(function(){

    console.log("yo are you working")

    var pathName = window.location.pathname;
    $("#hot-div").load(pathName + " #hot-div");

  });
});

