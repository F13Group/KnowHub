function endsWith(str, suffix) {
    return str.indexOf(suffix, str.length - suffix.length) != -1;
}

function showMessageLogin(message) {
	devalidate();
	$("#login-group").append("<div id=loginInstructions>" + message + "</div>");
}

function hideMessageLogin() {
	$("#loginInstructions").remove();
}

function showMessagePassword(message, message1, message2) {
	devalidate();
	if (!validateLogin(message1, message2)) {
		return;
	}
	$("#password-group").append("<div id=passwordInstructions>" + message + "</div>")
}

function hideMessagePassword() {
	$("#passwordInstructions").remove();
}

function showMessagePassword2() {
	$('#password2').removeAttr('style');
	$("#password2-error").remove();
}

function devalidate() {	
	$('.form-control').removeAttr('style');
	$( ".error" ).remove();
}

function validateLogin(message1, message2) {
	hideMessageLogin();
	devalidate();
	
	var login = document.forms["newUser"]["login"].value.toLowerCase();
	
	if (login == null || login == "") {                
		document.getElementById("login").style.border = "1px solid #B22746";
		document.getElementById("login").style.boxShadow = "0 0 10px #B22746";
		$("#login-group").after("<div class='error col-lg-offset-2' id=login-error>" + message1 + "</div>");                
		return false;
	}
	
	if (login.indexOf("@") < 0) {
		login += "@epam.com";
		document.getElementById("login").value = login;
	}
	
	if (login.indexOf("@epam.com") <= 0) {
		document.getElementById("login").style.border = "1px solid #B22746";
		document.getElementById("login").style.boxShadow = "0 0 10px #B22746";
		$("#login-group").after("<div class='error col-lg-offset-2' id=login-error>" + message2 + "</div>");            	
		return false;
	}
		
	var username = login.substr(0, login.length - "@epam.com".length);
	if (username.indexOf("_") <= 0 || username.indexOf("@") > -1) {
		document.getElementById("login").style.border = "1px solid #B22746";
		document.getElementById("login").style.boxShadow = "0 0 10px #B22746";
		$("#login-group").after("<div class='error col-lg-offset-2' id=login-error>" + message2 + "</div>");            	
		return false;
	}
	
	var firstname = login.substr(0, login.indexOf("_"));
	var lastname = login.substr(login.indexOf("_") + 1, login.indexOf("@") - login.indexOf("_") - 1);	
	var regexp_firstname = /(^[a-zA-Z]+[-]{0,1}[a-zA-Z]+$)/	
	var regexp_lastname = /(^[a-zA-Z]+[-]{0,1}[a-zA-Z]+[0-9]*$)/;
	if (!regexp_firstname.test(firstname) | !regexp_lastname.test(lastname)){
		document.getElementById("login").style.border = "1px solid #B22746";
		document.getElementById("login").style.boxShadow = "0 0 10px #B22746";
		$("#login-group").after("<div class='error col-lg-offset-2' id=login-error>" + message2 + "</div>");            	
		return false;
	}
	
	return true;
}

function loginExists(message) {
	document.getElementById("login").style.border = "1px solid #B22746";
	document.getElementById("login").style.boxShadow = "0 0 10px #B22746";
	$("#login-group").after("<div class='error col-lg-offset-2' id=login-error>" + message + "</div>");
}

function validatePassword(message1, message2, message3) {	
	hideMessagePassword();
	if ($("#password-error")[0]) {
		$('#password').removeAttr('style');
		$("#password-error").remove();
	}
	
	var login = document.forms["newUser"]["login"].value.toLowerCase();
	var pass1 = document.forms["newUser"]["password"].value;
	var firstname = login.substr(0, login.indexOf("_"));
	var lastname = login.substr(login.indexOf("_") + 1, login.indexOf("@")-login.indexOf("_") - 1);
	
	if (pass1 == null || pass1 == "") {		
		document.getElementById("password").style.border = "1px solid #B22746";
		document.getElementById("password").style.boxShadow = "0 0 10px #B22746";
		$("#password-group").after("<div class='error col-lg-offset-2' id=password-error>" + message1 + "</div>");                
		return false;
	}
	
	if (login != null && login != "" && firstname.length != 0 && lastname.length != 0) {
		if ((pass1.toLowerCase().indexOf(firstname) !=-1) || (pass1.toLowerCase().indexOf(lastname) !=-1) || (pass1.indexOf(" ") !=-1)) {			
			document.getElementById("password").style.border = "1px solid #B22746";
			document.getElementById("password").style.boxShadow = "0 0 10px #B22746";                
			$("#password-group").after("<div class='error col-lg-offset-2' id=password-error>" + message2 + "</div>");            	
			return false;
		}
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
		$("#password-group").after("<div class='error col-lg-offset-2' id=password-error>" + message2 + "</div>");            	
		return false;
	}

	if (pass1.length > 20) {
		document.getElementById("password").style.border = "1px solid #B22746";
		document.getElementById("password").style.boxShadow = "0 0 10px #B22746";                
		$("#password-group").after("<div class='error col-lg-offset-2' id=password-error>" + message3 + "</div>");            	
		return false;
	}
	
	return true;
}

function validatePassword2(message1, message2) {	
	if ($("#password2-error")[0]) {
		return false;
	}
	
	var pass1 = document.forms["newUser"]["password"].value;
	var pass2 = document.forms["newUser"]["password2"].value;
	
	if (pass2 == null || pass2 == "") {                
		document.getElementById("password2").style.border = "1px solid #B22746";
		document.getElementById("password2").style.boxShadow = "0 0 10px #B22746";
		$("#password2-group").after("<div class='error col-lg-offset-2' id=password2-error>" + message1 + "</div>");                
		return false;
	}

	if (pass1 != pass2) {
		document.getElementById("password").style.border = "1px solid #B22746";
		document.getElementById("password").style.boxShadow = "0 0 10px #B22746";
		document.getElementById("password2").style.border = "1px solid #B22746";
		document.getElementById("password2").style.boxShadow = "0 0 10px #B22746";
		$("#password2-group").after("<div class='error col-lg-offset-2' id=password2-error>" + message2 + "</div>");            	
		return false;
	}
	
	return true;
}

function validateForm(messageLogin1, messageLogin2, messagePassword1, messagePassword2, messagePassword3, messagePassword21, messagePassword22, confirmationMessage) {
	devalidate();

	if (!validateLogin(messageLogin1, messageLogin2)) {
		return false;
	}

	if (!validatePassword(messagePassword1, messagePassword2, messagePassword3)) {
		return false;
	}
	
	if (!validatePassword2(messagePassword21, messagePassword22)) {
		return false;
	}
	
	$('div#dialog-terms').dialog('open');
	
	return false;
}