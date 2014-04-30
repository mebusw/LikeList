
$(document).ready( function() {

    $("a.accept-invite").click(function() {
        var url = $(this).attr("href");
        $.getJSON(url, {}, function(json) {
            if (0 == json.ec) {
                alert("邀请已接受");
            } else {
                alert("未能接受邀请");
            }
        });
        return false;
     });

});// end of $(document).ready

