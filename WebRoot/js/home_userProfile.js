

function refreshPhotos() {
    albumId = $("#albumId").attr("value");
    $.getJSON("../action/findAlbum.jsp", {
        albumId : albumId
    }, function(json) {
        // $("#album").empty();
            $.each(json.photos, function(i, item) {
                $("#album").append(
                        "<img width='50' height='50' src='" + item.largePath + "' />"
                                + "<a href=>设为头像</a> <a href=>删除</a>");
            });
        });
}

$(document).ready( function() {
    $("#account_setings_tabs").mytab({tab:"#account_setings_tabs"});

    $("#btnUploadAvatar").click( function() {
            popUpWindow("uploadAvatar.jsp", 100, 100, 600, 500);
        });

    $("#basic-info-form").validate();
    $("#basic-info-form").ajaxForm( {
        dataType : 'json',
        success : function(data) {
            switch (data.ec) {
            case 0:
                alert("已更新");
                break;
            default:
                alert("更新失败，错误代码=" + data.ec);
            }
        }
    });

    $("#change-password-form").validate({
        rules: {
            pass1: {
                required: true,
                minlength: 3
            },
            pass2: {
                required: true,
                minlength: 3,
                equalTo: "#pass1"
            }
         }
    });
    $("#change-password-form").ajaxForm( {
        dataType : 'json',
        success : function(data) {
            switch (data.ec) {
            case 0:
                alert("已更新");
                break;
            default:
                alert("更新失败，错误代码=" + data.ec);
            }
    
        },
        beforeSerialize : function() {
            $("#pass0").attr("value", hex_md5($("#pass0").attr("value")));
            $("#pass1").attr("value", hex_md5($("#pass1").attr("value")));
            $("#pass2").attr("value", $("#pass1").attr("value"));
            //alert($("#pass1").attr("value"));
        }
    });

    $("#calendar").css( {
        left : ($("#birthDay").offset().left + 30) + 'px',
        top : ($("#birthDay").offset().top + 25) + 'px',
    });
        
    inviteFriendAjax();

    

});// end of $(document).ready

