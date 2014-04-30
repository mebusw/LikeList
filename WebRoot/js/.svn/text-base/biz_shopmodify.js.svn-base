function composeAddress() {
    $("#fullAddress").attr(
            "value",
            $("#province").attr("value") + $("#city").attr("value") + $("#district").attr("value")
                    + $("#street").attr("value"));

}

function delayMapLoading() {

}

$(document).ready( function() {
    // setTimeout("delayMapLoading()", 0);
        var map = new BMap.Map("mapContainer");
        map.addControl(new BMap.NavigationControl());
        var point = new BMap.Point($("#longitude").attr("value"), $("#latitude").attr("value"));
        map.centerAndZoom(point, 15);
        map.addOverlay(new BMap.Marker(point));
        // 创建地址解析器实例
        var myGeo = new BMap.Geocoder();
        // 将地址解析结果显示在地图上,并调整地图视野

        $("#getPoint").click(
                function() {
                    var city = $("#city").attr("value") != "" ? $("#city").attr("value") : $(
                            "#province").attr("value");
                    myGeo.getPoint($("#fullAddress").attr("value"), function(point) {
                        if (point) {
                            map.centerAndZoom(point, 30);
                            map.addOverlay(new BMap.Marker(point));
                            $("#latitude").attr("value", point.lat);
                            $("#longitude").attr("value", point.lng);
                        }
                    }, city);

                });

        $.getJSON("../action/findComment.jsp", {
            shopId : $("#shopId").attr("value"),
            offset : 0,
            pageSize : 5
        }, function(data) {
            $("#comments").empty();
            $.each(data.comments, function(i, item) {
                $("#comments").append(
                        "<li>" + item.userFullName + item.createTime + item.content + "</li>");
            });
            $("#commentsNav").empty();
            $("#commentsNav").append(
                    "评论共" + data.commentsCount + "条， 共" + data.commentsCount / 5 + "页");
        });

        $("#category1Sel").change( function() {
            $("#category1").attr("value", $("#category1Sel :selected").text());
        });

        $("#updateDealForm").ajaxForm( {
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
        $("#updateShopProfileForm").ajaxForm( {
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

        $("#updateGrouprateForm").ajaxForm( {
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

        $("#province").change( function() {
            composeAddress();
            $("#getPoint").click();
        });

        $("#city").change( function() {
            composeAddress();
            $("#getPoint").click();
        });

        $("#district").change( function() {
            composeAddress();
            $("#getPoint").click();
        });

        $("#street").change( function() {
            composeAddress();
            $("#getPoint").click();
        });

        $("#btnUploadShopAvatar").click(
                function() {
                    popUpWindow("uploadShopAvatar.jsp?shopId=" + $("#shopId").attr("value"), 100,
                            100, 600, 500);
                });

        $("#btnUploadDealAvatar").click(
                function() {
                    popUpWindow("uploadDealAvatar.jsp?shopId=" + $("#shopId").attr("value")
                            + "&dealId=" + $("#dealId").attr("value"), 100, 100, 600, 500);
                }); 
        // 
    });// end of $(document).ready
