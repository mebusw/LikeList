$(document)
        .ready(
                function() {
                    $("#email").attr("value", getCookie("email"));
                    $("#password").attr("value", getCookie("password"));

                    $("#loginForm").validate();

                    $("#signupForm").validate( {
                        rules : {
                            regEmail : {
                                required : true,
                            },
                            regFullName : {
                                required : true,
                            },
                            regPassword1 : {
                                required : true,
                                minlength : 3
                            },
                            regPassword2 : {
                                required : true,
                                minlength : 3,
                                equalTo : "#regPassword1"
                            }
                        },
                        messages : {
                            regEmail : {
                                required : "请输入您的电子邮件地址",
                                email : "清输入一个格式正确的电子邮件地址"
                            }
                        }
                    });

                    $("#loginForm").ajaxForm( {
                        dataType : 'json',
                        success : function(data) {
                            switch (data.ec) {
                            case 0:
                                deleteCookie("email");
                                setCookie("email", data.email, 1000);
                                deleteCookie("password");
                                setCookie("password", $("#password").attr("value"), 1000);

                                var lastPage = getCookie("lastPage");
                                
                                if (null != lastPage && "" != lastPage) {
                                    deleteCookie("lastPage");
                                    window.location = "../" + lastPage;
                                }
                                else if (data.userType == "user")
                                    window.location = "../home";
                                else if (data.userType == "biz")
                                    window.location = "../biz";
                                else
                                    alert("错误的登录类型！");
                                break;
                            default:
                                alert("登陆失败");
                                deleteCookie("email");
                                deleteCookie("password");
                                deleteCookie("userId");
                                $("#btnLogin").attr("disabled", "");
                            }

                    },
                        beforeSerialize : function() {
                            $("#btnLogin").attr("disabled", "disabled");
                        }

                    });

                    $("#signupForm").ajaxForm(
                            {
                                dataType : 'json',
                                success : function(data) {

                                    switch (data.ec) {
                                    case 0:
                                        alert("注册成功，请登录");
                                        deleteCookie("email");
                                        setCookie("email", data.email, 1000);
                                        deleteCookie("password");
                                        setCookie("password", $(
                                                "#signupForm > input[name='regPassword1']")
                                                .attr("value"), 1000);
                                        $("email").attr("value", data.email);
                                        break;
                                    case 5:
                                        alert("该邮件已经注册");
                                        break;
                                    default:
                                        alert("注册失败");
                                        deleteCookie("email");
                                        deleteCookie("password");
                                        deleteCookie("userId");
                                        $("#btnSignup").attr("disabled", "");

                                    }
                                },
                                beforeSerialize : function() {
                                    $("#regPassword1").attr("value",
                                            hex_md5($("#regPassword1").attr("value")));
                                    $("#regPassword2").attr("value",
                                            hex_md5($("#regPassword2").attr("value")));
                                    $("#btnSignup").attr("disabled", "disabled");
                                }
                            });

                    $("#noemail")
                            .powerFloat(
                                    {
                                        width : 65,
                                        target : [
                                                {
                                                    href : "https://www.google.com/accounts/NewAccount?continue=http%3A%2F%2Fwww.google.com.hk%2F&hl=zh-cn",
                                                    text : "Gmail"
                                                },
                                                {
                                                    href : "https://signup.live.com/signup.aspx?lic=1",
                                                    text : "Hotmail"
                                                },
                                                {
                                                    href : "http://reg.email.163.com/mailregAll/reg0.jsp?from=163",
                                                    text : "163.com"
                                                } ],
                                        targetMode : "list"
                                    });
                });// end of $(document).ready

