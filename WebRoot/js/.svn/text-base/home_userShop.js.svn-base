function showComments(data) {
    $.each(data.comments, function(i, item) {
        str = "<li class='comment_contents_li'>"
                + "<div class='l mr10'>"
                + "<span class='commenter_image'><img src='{0}' alt='' width='40'>".Format(item.userPhotoPath)
                + "<span class='sn-icon'></span></span>" + "</div>" + "<div class='l'>"
                + "{0} 说：{1}</div>".Format(item.userFullName, item.content) + "</li>";

        $("#more_comments_ul").append(str);

    });

    if (data.comments.length < 5) {
        $("#more-comment").addClass("hidden");
    } else {
        curr_offset = eval($("#commentOffset").attr("value"));
        $("#commentOffset").attr("value", curr_offset += 5)
    }
}

function delayMapLoading() {
    var map = new BMap.Map("mapContainer");
    map.addControl(new BMap.NavigationControl());
    var point = new BMap.Point($("#longitude").attr("value"), $("#latitude").attr("value"));
    map.centerAndZoom(point, 15);
    map.addOverlay(new BMap.Marker(point));
    // 创建地址解析器实例
    var myGeo = new BMap.Geocoder();
    // 将地址解析结果显示在地图上,并调整地图视野

}
$(document).ready( function() {

    $("#tabs").mytab({tab:"#tabs"});
	
	var data_shopid = $("#shopId").attr("value");
	var shopBox = "#notice-system" , shopUrl = "../action/findShop.jsp";
	var recentLogFeed=new feed({shopId:data_shopid},shopBox,shopUrl,7);
	setTimeout("delayMapLoading()", 1000); 

    $("#advance-search-droplist").click( function() {
        $("#advance-search").slideToggle("fast");
    });
	
	$.getJSON("../action/findComment.jsp", {
		  shopId : data_shopid,
		  offset : $("#commentOffset").attr("value"),
		  pageSize : 5
	  }, function(data) {
		  showComments(data);
	  });

    $("#more-comment").click( function(e) {
		e.preventDefault();
        $.getJSON("../action/findComment.jsp", {
            shopId : data_shopid,
            offset : $("#commentOffset").attr("value"),
            pageSize : 5
        }, function(data) {
            showComments(data);
        });
    });

    inviteFriendAjax();


});// end of $(document).ready

