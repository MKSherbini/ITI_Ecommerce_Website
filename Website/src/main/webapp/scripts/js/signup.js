var wsocket = new WebSocket("ws://localhost:9090/ITI_Ecommerce_Website_war_exploded/echo");
wsocket.onopen = onOpen;
wsocket.onmessage = onMessage;

function validateEmail(emailregex) {
    console.log(emailregex);
    var emailpattern = /^[A-Za-z0-9+_.-]+@(.+)$/;
    if (!emailpattern.test(emailregex)) {
        document.getElementById("emailValid").innerHTML = "Please enter a valid form of an email";
        document.getElementById("reg-email").innerHTML= '';
    } else {
        document.getElementById("emailValid").innerHTML = "";
        wsocket.send(emailregex);
    }
}

function onOpen() {
    console.log("connection established");
}


function onMessage(evt) {
    if(evt.data()== "") {
        document.getElementById("emailValid").innerHTML = evt.data;
    }else
    {
        document.getElementById("emailValid").innerHTML = evt.data;
        document.getElementById("reg-email").value = '';
    }
}


function disconnect() {
    wsocket.close();
}


function validatePassword() {
    var passwordregex = document.getElementById("reg-password").value;
    var passwordreregex = document.getElementById("reg-repassword").value;
    var passwordpattern = /[A-Za-z._0-9]{5,}/;
    if (!passwordpattern.test(passwordregex)) {
        document.getElementById("passwordValid").innerHTML = "Short Password are easy to guess! Try one with at least 5 characters";
        document.getElementById("reg-password").innerHTML = '';
        document.getElementById("reg-repassword").innerHTML = '';
    } else {
        document.getElementById("passwordValid").innerHTML = "";
    }
    if (passwordregex != passwordreregex) {
        document.getElementById("repasswordValid").innerHTML = "Those Passwords didn't match please try again ";
        document.getElementById("reg-repassword").innerHTML = '';
    } else {
        document.getElementById("repasswordValid").innerHTML = "";
    }
}