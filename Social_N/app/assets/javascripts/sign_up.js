$(document).ready(function() {
	$('#new_user').validate({
		rules: {
			"user[name]": {required: true},
			"user[email]": {required: true, email: true, uniqueness: true},
			"user[password]": {required: true},
			"user[password_confirmation]": {required: true, equalTo: "#user_password"}
		},

		messages: {
      "user[name]": {required: "Field must be filled"},

		}
	});
});