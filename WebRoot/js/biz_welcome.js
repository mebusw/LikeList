$(document).ready( function() {

    loginForm.email.value = getCookie("email");
    loginForm.password.value = getCookie("password");

    $("#loginForm").ajaxForm( {
        dataType : 'json',
        success : function(data) {
            $("#loginResult").append(data.ec);
            switch (data.ec) {
            case 0:
                deleteCookie("bizId");
                setCookie("bizId", data.bizId, 1000);
                deleteCookie("email");
                setCookie("email", data.email, 1000);
                deleteCookie("password");
                setCookie("password", data.password, 1000);

                window.location = "../biz";
                
                break;
            default:
                alert("登陆失败");
                deleteCookie("email");
                deleteCookie("password");
                deleteCookie("bizId");

            }
        }
    });
    
    $("#loginForm").validate();

});// end of $(document).ready

