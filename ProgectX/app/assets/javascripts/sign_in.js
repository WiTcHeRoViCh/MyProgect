$(document).ready(function(){
  $('#partial').hide();	
  $('#session').click(function () {
    if ($('#partial').is(":hidden")){
      $('#partial').show();
    }
    else{
      $('#partial').hide();
    }
  });
}); 	