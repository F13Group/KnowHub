function showMessageLogin() {
	devalidate();
	$("#login-group").append("<div id=loginInstructions>Use your corporate email as in the example.\nYou should only add your name and surname with _ symbol in between.</div>")
}

function hideMessageLogin() {
	$("#loginInstructions").remove();
}

function showMessagePassword() {
	devalidate();
	if (!validateLogin()) {
		return;
	}
	$("#password-group").append("<div id=passwordInstructions>Password must have at least 8 characters but not more than 20 characters and contain at least 2 of the following: uppercase letters, lowercase letters, numbers, and symbols including spaces.\nDo not use your email, name or surname as your password or as part of it.</div>")
}

function hideMessagePassword() {
	$("#passwordInstructions").remove();
}

function showMessagePassword2() {
	
}

function confirmation() {
	return confirm("TERMS OF AGREEMENT\nDo you agree?");
}

function devalidate() {
	$('.form-control').removeAttr('style');
	$( ".error" ).remove();
}

function validateLogin() {
	hideMessageLogin();
	
	var login = document.forms["newUser"]["login"].value;
	
	if (login == null || login == "") {                
		document.getElementById("login").style.border = "1px solid #B22746";
		document.getElementById("login").style.boxShadow = "0 0 10px #B22746";
		$("#login-group").after("<div class='error col-lg-offset-2'>This information is required.</div>");                
		return false;
	}
	if (login.indexOf("@epam.com") <= 0) {
		document.getElementById("login").style.border = "1px solid #B22746";
		document.getElementById("login").style.boxShadow = "0 0 10px #B22746";
		$("#login-group").after("<div class='error col-lg-offset-2'>Enter the email address in the format name_surname@epam.com</div>");            	
		return false;
	}
	
	var username = login.substr(0, login.indexOf("@epam.com"));
	if (username.indexOf("_") <= 0) {
		document.getElementById("login").style.border = "1px solid #B22746";
		document.getElementById("login").style.boxShadow = "0 0 10px #B22746";
		$("#login-group").after("<div class='error col-lg-offset-2'>Enter the email address in the format name_surname@epam.com</div>");            	
		return false;
	}
	
	return true;
}

function loginExists() {
	document.getElementById("login").style.border = "1px solid #B22746";
	document.getElementById("login").style.boxShadow = "0 0 10px #B22746";
	$("#login-group").after("<div class='error col-lg-offset-2'>We are sorry but the user with this login exists already!</div>");
}

function validatePassword() {
	hideMessagePassword();
	
	var pass1 = document.forms["newUser"]["password"].value;
	
	if (pass1 == null || pass1 == "") {                
		document.getElementById("password").style.border = "1px solid #B22746";
		document.getElementById("password").style.boxShadow = "0 0 10px #B22746";
		$("#password-group").after("<div class='error col-lg-offset-2'>This information is required.</div>");                
		return false;
	}	

	var regexp1 = /((?=.*\d)(?=.*[a-z]).{8,})/;
	var regexp2 = /((?=.*\d)(?=.*[A-Z]).{8,})/;
	var regexp3 = /((?=.*\d)(?=.*[~@#$%^\+\-\=\[\]\*\(\)\/\{\}\\\?\!\|\:\;\_\<\>]).{8,})/;
	var regexp4 = /((?=.*[a-z])(?=.*[A-Z]).{8,})/;
	var regexp5 = /((?=.*[a-z])(?=.*[~@#$%^\+\-\=\[\]\*\(\)\/\{\}\\\?\!\|\:\;\_\<\>]).{8,})/;
	var regexp6 = /((?=.*[A-Z])(?=.*[~@#$%^\+\-\=\[\]\*\(\)\/\{\}\\\?\!\|\:\;\_\<\>]).{8,})/;            
	if (!regexp1.test(pass1) & !regexp2.test(pass1) & !regexp3.test(pass1) & !regexp4.test(pass1) & !regexp5.test(pass1) & !regexp6.test(pass1)) {
		document.getElementById("password").style.border = "1px solid #B22746";
		document.getElementById("password").style.boxShadow = "0 0 10px #B22746";                
		document.getElementById("password").value = "";
		document.getElementById("password2").value = "";
		$("#password-group").after("<div class='error col-lg-offset-2'>Passwords must have at least 8 characters and contain at least two of the following: uppercase letters, lowercase letters, numbers, and symbols including spaces. Do not use your email, name or surname as your password or as part of it.</div>");            	
		return false;
	}

	if (pass1.length > 20) {
		document.getElementById("password").style.border = "1px solid #B22746";
		document.getElementById("password").style.boxShadow = "0 0 10px #B22746";                
		document.getElementById("password").value = "";
		document.getElementById("password2").value = "";
		$("#password-group").after("<div class='error col-lg-offset-2'>Your password can't be longer than 20 characters.</div>");            	
		return false;
	}
	
	return true;
}

function validatePassword2() {
	showMessagePassword2();
	
	var pass1 = document.forms["newUser"]["password"].value;
	var pass2 = document.forms["newUser"]["password2"].value;
	
	if (pass2 == null || pass2 == "") {                
		document.getElementById("password2").style.border = "1px solid #B22746";
		document.getElementById("password2").style.boxShadow = "0 0 10px #B22746";
		$("#password2-group").after("<div class='error col-lg-offset-2'>This information is required.</div>");                
		return false;
	}

	if (pass1 != pass2) {
		document.getElementById("password").style.border = "1px solid #B22746";
		document.getElementById("password").style.boxShadow = "0 0 10px #B22746";
		document.getElementById("password2").style.border = "1px solid #B22746";
		document.getElementById("password2").style.boxShadow = "0 0 10px #B22746";
		document.getElementById("password").value = "";
		document.getElementById("password2").value = "";
		$("#password2-group").after("<div class='error col-lg-offset-2'>These passwords don't match!</div>");            	
		return false;
	}
	
	return true;
}

function validateForm() {
	devalidate();

	if (!validateLogin()) {
		return false;
	}

	if (!validatePassword()) {
		return false;
	}
	
	if (!validatePassword2()) {
		return false;
	}

	return confirmation();
}