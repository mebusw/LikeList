$(document).ready( function() {
    
    $("#create-shop-form").ajaxForm( {
        dataType : 'json',
        success : function(data) {
            switch (data.ec) {
            case 0:
                alert("已创建");
                break;
            default:
                alert("创建失败，错误代码=" + data.ec);
            }
        }
    });
    $("#create-shop-form").validate();
    
});// end of $(document).ready
