$(document).ready(function() {


  $('#refresh-button').click(function(){

    console.log("yo are you working")

    var pathName = window.location.pathname;
    $("#hot-div").load(pathName + " #hot-div");

  });
});


$(document).ready(function() {

    var pathName = window.location.pathname;

    if (pathName.indexOf("entertainment") != -1){
      $( "a.entertainment" ).addClass( "selected" );
    }
    else if (pathName.indexOf("diy") != -1){
      $( "a.diy" ).addClass( "selected" );
    }
    else if (pathName.indexOf("animal") != -1){
      $( "a.animal" ).addClass( "selected" );
    }
    else if (pathName.indexOf("rewind") != -1){
      $( "a.rewind" ).addClass( "selected" );
    }
    else if (pathName.indexOf("politics") != -1){
      $( "a.politics" ).addClass( "selected" );
    }
    
});


