$(document).ready(function() {
  $('#new_user').validate({
    rules: {
    	"user[name]": {required: true},
    	"user[second_name]": {required: true},
    	"user[email]": {required: true, email: true},
    	"user[password]": {required: true},
    	"user[password_confirmation]": {required: true, equalTo: "#user_password"}
    },
    
    messages: {
    	"user[name]": {required: "This field must be required"},
    	"user[second_name]": {required: "The field must be required"},
    	"user[email]": {required: "The field must be required", email: "Write correct email"}
    }

  });
});