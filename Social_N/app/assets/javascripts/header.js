$(document).ready(function() {
  
  $('#header_user_link').hover(function() {
    $('#user_menu').toggle("slow");
  });

  function ShowOrHide(iD) {
  	$(this).toggle();
  }

});