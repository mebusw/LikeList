function shopActionsBind() {
    $("a.invite-friend").unbind("click").click( function() {
        alert();
    });
    
    $("span.bt-secondary").unbind("click").click( function() {
        var feed = $(this).parents(".a-feed");
        var offset = $(this).offset();
        var tBox = $("#like-context-popup");
        var tInfo = $("#like-context-element");
        var feedAction = $(this).parents(".feed-action");
        var shopId = feedAction.find(".shop-id").attr("value");
        var shopAnchor = feedAction.find(".shop-feed-anchor").attr("id");
        var liked = feedAction.find(".shop-liked").attr("value") == "true" ? true : false;
        var tried = feedAction.find(".shop-tried").attr("value") == "true" ? true : false;

        tBox.css( {
            left : (offset.left) + 'px',
            top : (offset.top + 32) + 'px'
        });
        tBox.removeClass("hidden");
        tBox.show();

        tInfo.find(".shop-id").attr("value", shopId);
        tInfo.find(".shop-feed-anchor").attr("value", shopAnchor);

        tInfo.find(".shop-liked").attr("value", liked);
        tInfo.find(".shop-tried").attr("value", tried);

        if (liked || tried) {
            $("#like-context-element-try").parent().addClass("hidden");
            $("#like-context-element-remove").parent().removeClass("hidden");
        } else {
            $("#like-context-element-remove").parent().addClass("hidden");
            $("#like-context-element-try").parent().removeClass("hidden");
        }
		
	var shareTo=function(web){
		var _title = "我在朋互网看到"+ $(".feed-shop-title a",feed).text() +"这家店不错，推荐下!" ;
		//var _url = document.location;
		var _url = "http://www.penghoo.com/home/userShop.jsp?shopId=" + $(".feed-action .shop-id",feed).attr("value");
		var imgSrc="http://www.penghoo.com/" + $(".feed-img img",feed).attr("src");
		var _pic = imgSrc;
		var _site = "http://www.penghoo.com/home/";//你的网站地址
		var _u;
		var _content ="我个人觉得还不错，过来看看吧！";
		switch(web){
			case("qqweb"):
			_u = 'http://v.t.qq.com/share/share.php?title=' + _title + '&site=' + _site + '&pic=' + _pic + '&url=' + _url;
			break;
			case("rr"):
			_u='http://www.connect.renren.com/share/sharer?title=' + _title + '&pic=' + _pic + '&url=' + _url;
			break;
			case("snwb"):
			_u='http://service.t.sina.com.cn/share/share.php?title=' + _title + '&url=' + _url + '&pic=' + _pic;
			break;
			case("qqkj"):
			_u='http://sns.qzone.qq.com/cgi-bin/qzshare/cgi_qzshare_onekey?title=' + _title + '&url=' + _site + '&pic=' + _pic;
			break;
			case("qqpy"):
			_u='http://sns.qzone.qq.com/cgi-bin/qzshare/cgi_qzshare_onekey?to=pengyou&title=' + _title + '&url=' + _site + '&pic=' + _pic;
			break;
			case("kx"):
			_u='http://www.kaixin001.com/repaste/bshare.php?rtitle=' + _title + '&rurl=' + _url + '&rpic=' + _pic + '&rcontent=' + _content;
			break;
		}
		return _u;
	}
		$(".qqwb").attr("href",shareTo("qqweb"));
		$(".rr").attr("href",shareTo("rr"));
		$(".snwb").attr("href",shareTo("snwb"));
		$(".qqkj").attr("href",shareTo("qqkj"));
		$(".qqpy").attr("href",shareTo("qqpy"));
		$(".kx").attr("href",shareTo("kx"));

    });

    $("span.bt-primary").unbind("click").click( function() {
        var tBox = $("#like-context-popup");
        var tInfo = $("#like-context-element");
        var feedAction = $(this).parents(".feed-action");
        var shopId = feedAction.find(".shop-id").attr("value");
        var liked = feedAction.find(".shop-liked").attr("value") == "true" ? true : false;

        var that = $(this);

        if (!liked) {
            $.getJSON("../action/iLike.jsp", {
                shopId : shopId
            }, function(json) {
                if (0 == json.ec) {
                    that.html("已经喜欢");
                    that.addClass("liked");
                    that.parent().nextAll(".shop-liked").attr("value", true);
                    that.parent().nextAll(".shop-tried").attr("value", false);
                }
            });
        }
        $("#like-context-popup").hide();

    });

    $("#like-context-element-try").unbind("click").click( function() {
        id = $("#like-context-element .shop-id").attr("value");
        that = $(this);
        var liked = eval($("#like-context-element .shop-liked").attr("value"));
        var tried = eval($("#like-context-element .shop-tried").attr("value"));

        if (!tried && !liked) {
            $.getJSON("../action/iTry.jsp", {
                shopId : id
            }, function(json) {
                if (0 == json.ec) {
                    var feed_anchor = $("#like-context-element .shop-feed-anchor").attr("value");
                    $("#{0}".Format(feed_anchor)).nextAll(".shop-liked").attr("value", false);
                    $("#{0}".Format(feed_anchor)).nextAll(".shop-tried").attr("value", true);
                }
            });
        }
        $("#like-context-popup").hide();
    });
    $("#like-context-element-remove").unbind("click").click(
            function() {
                id = $("#like-context-element .shop-id").attr("value");
                that = $(this);
                var liked = eval($("#like-context-element .shop-liked").attr("value"));
                var tried = eval($("#like-context-element .shop-tried").attr("value"));

                if (liked || tried) {
                    $.getJSON("../action/disLike.jsp", {
                        shopId : id
                    }, function(json) {
                        if (0 == json.ec) {

                            var feedAnchor = $("#like-context-element .shop-feed-anchor").attr(
                                    "value");
                            var span = $("#" + feedAnchor).prevAll("a.bt-feed-action").children(
                                    "span.bt-primary");
                            span.html("喜欢");
                            span.removeClass("liked");

                            var feed_anchor = $("#like-context-element .shop-feed-anchor").attr(
                                    "value");
                            $("#{0}".Format(feed_anchor)).nextAll(".shop-liked").attr("value",
                                    false);
                            $("#{0}".Format(feed_anchor)).nextAll(".shop-tried").attr("value",
                                    false);

                        }
                        $("#like-context-popup").hide();
                    });
                }
            });

    $(".close").unbind("click").click( function() {
        $("#like-context-popup").hide();
    });
    
    $("#like-context-element-alikelist").click( function() {
        id = $("#like-context-element .shop-id").attr("value");
        $(this).attr("href","shopCard.jsp?shopId=" + id);
    });


    $("#container").unbind("click").click( function(event) {
        var popup = $("#like-context-popup");
        var x1 = popup.offset().left - 20;
        var x2 = popup.offset().left + popup.width() + 20;
        var y1 = popup.offset().top - 20;
        var y2 = popup.offset().top + popup.height() + 20;

        if (event.pageX < x1 || event.pageX > x2 && event.pageY < y1 || event.pageY > y2) {
            $("#like-context-popup").hide();
        }

    });

    $("a.tabs-n").unbind("click").click( function() {
        $("#like-context-popup").hide();
    });

    $("#like-context-element-comment-submit").unbind("click").click( function() {
        var id = $("#like-context-element .shop-id").attr("value");
        var c = $("#like-context-element-comment").attr("value");
        if (null == c || "" == c)
            alert("评论不能为空！");
        else {
            $.getJSON("../action/addComment.jsp", {
                shopId : id,
                content : c
            }, function(json) {
                if (0 == json.ec) {

                }
            });
        }
        $("#like-context-popup").hide();

    });
	
}

function AFeed(shopJson, nbr) {

    // org.likelist.type.OperationType
    var opName = [ "喜欢", "尝试", "点评", "分享", "访问", "转发", "团购", "点击", "回应", "求助" ];
    var str = "<div class='a-feed'>";
	var shop=shopJson;
	var seekHelp = "";

    if (shop.isLikedByYou) {
        likeFlagStr = "已经喜欢";
        likedClassStr = "liked";
    } else {
        likeFlagStr = "喜欢";
        likedClassStr = "liked";
    }
    // feed-action start
    var feedAction = "<div class='feed-action'>" + "<a class='bt-feed-action bt-likeit bt-split'>"
					+ "<span class='bt-primary {0}'>{1}</span>".Format(likedClassStr, likeFlagStr)
					+ "<span class='bt-secondary'><span class='arrow-down'></span></span></a>"
					+ "<a id='feed-{0}' class='shop-feed-anchor hidden'></a>".Format(nbr)
					+ "<input type='hidden' class='shop-id' value='{0}'/>".Format(shop.shopId)
					+ "<input type='hidden' class='shop-liked' value='{0}'/>".Format(shop.isLikedByYou)
					+ "<input type='hidden' class='shop-tried' value='{0}'/>".Format(shop.isTriedByYou)
			    + "</div>";
	str += feedAction;
    // feed-action end

    // feed-con strat
    switch (shop.feedFormatter) {// org.likelist.type.FeedFormatter
    case 0:// SHOP_ONLY
        str += "<div class='feed-con'>";
        str += "<input type='hidden' class='shop-id' value='{0}' >".Format(shop.shopId)
                + "<input type='hidden' class='shop-name' value='{0}' >".Format(shop.shopName)
                + "<div class='feed-img l'><img src='{0}' height='90' width='90' /></div>"
                        .Format(shop.avatarPath)
                + "<div class='feed-msg l'>"
                + "<p class='feed-shop-title'><a href='../home/userShop.jsp?shopId={0}' target='_blank'>{1}</a></p>"
                        .Format(shop.shopId, shop.shopName)
                + "<p class='feed-shop-info'>{0}</p>".Format(shop.description)
                + "<p class='street-address'>详细地址：{0}</p>".Format(shop.fullAddress)
				+ "<p>网址：<a href='{0}'>{1}</a></p>".Format(shop.website, shop.website)
                + "<p class='one-row'><span class='tel'>优惠：{0}</span></p>".Format(shop.dealSubject)
                + "<p class='one-row'><span class='tel'>团购：{0}</span></p>".Format(shop.grSubject)
                + "<p>分类：<a href='./search.jsp?category1={0}'>{1}</a></p>".Format(shop.categroy1,
                        shop.categroy1) + "</div>";
        break;
    case 1:// USER_LOG
	    if(shop.opSeekHelp){
			seekHelp = "<p class='feed-help'><b class='hfn'>{0}</b>的求助：<b class='htc'>{1}</b><a href='#' class='btn-a'>回应</a></p>".Format(shop.opFullName, shop.opSeekHelp);
		}

        str += "<h3 class='feed-title-sub'>"
                + "<span class='feed-newsuser'><img src='{0}' height='20' width='20' alt='头像' /></span>"
                        .Format(shop.opAvatarDir)
                + "<a href='./likelist.jsp?friendId={0}' target='_blank'>{1}</a>".Format(
                        shop.opUserId, shop.opFullName)
                + " {0} {1} {2}".Format(jsDateDiff(shop.createTime), opName[shop.opTypeId],
                        shop.destContent) + "</h3>";
        str += "<div class='feed-con'>";
        str += "<input type='hidden' class='shop-id' value='{0}' >".Format(shop.shopId)
                + "<input type='hidden' class='shop-name' value='{0}' >".Format(shop.shopName)
                + "<div class='feed-img l'><img src='{0}' height='90' width='90' /></div>"
                        .Format(shop.avatarPath)
                + "<div class='feed-msg l'>"
                + "<p class='feed-shop-title'><a href='../home/userShop.jsp?shopId={0}'>{1}</a></p>"
                        .Format(shop.shopId, shop.shopName)
                + "<p class='feed-shop-info'>{0}</p>".Format(shop.description)
                + "<p class='street-address'>详细地址：{0}</p>".Format(shop.fullAddress)
                + "<p class='one-row'><span class='tel'>优惠：{0}</span></p>".Format(shop.dealSubject)
                + "<p class='one-row'><span class='tel'>团购：{0}</span></p>".Format(shop.grSubject)
                + "<p>网址：<a href='{0}' target='_blank'>{1}</a></p>".Format(shop.website, shop.website)
                + "<p>分类：<a href='./search.jsp?category1={0}'>{1}</a></p>".Format(shop.categroy1,
                        shop.categroy1) + "</div>";
        break;
    case 2:// DISCOUNT
        str += "<div class='feed-con'>";
        str +=  "<input type='hidden' class='shop-id' value='{0}' >".Format(shop.shopId)
                + "<input type='hidden' class='shop-name' value='{0}' >".Format(shop.shopName)
                + "<div class='feed-img l'><img src='{0}' height='90' width='90' /></div>"
                        .Format(shop.avatarPath)
                + "<div class='feed-msg l'>"
                + "<p class='feed-shop-title'><a href='../home/userShop.jsp?shopId={0}'>{1}</a></p>"
                        .Format(shop.shopId, shop.shopName)
				+ "<p>优惠标题：{0}</p>".Format(shop.dealSubject)
                + "<p class='feed-shop-info'>描述：{0}</p>".Format(shop.dealContent)
				+ "<p class='one-row'><span>折扣：{0}</span></p>".Format(shop.dealPercent)
				+ "<p class=''><span>结束时间：{0}</span></p>".Format(shop.dealTimeTo)
				+ "<p class='street-address'>店铺地址：{0}</p>".Format(shop.fullAddress)
				+ "<p class='one-row'><span>团购：<a href='#'>{0}</a></span></p>".Format(shop.grSubject) + "</div>";
        break;
    case 3:// GROUPRATE
	    str += "<div class='feed-con'>";
        str +=  "<input type='hidden' class='shop-id' value='{0}' >".Format(shop.shopId)
                + "<input type='hidden' class='shop-name' value='{0}' >".Format(shop.shopName)
                + "<div class='feed-img l'><img src='{0}' height='90' width='90' /></div>"
                        .Format(shop.avatarPath)
                + "<div class='feed-msg l'>"
                + "<p class='feed-shop-title'><a href='../home/userShop.jsp?shopId={0}'>{1}</a></p>"
                        .Format(shop.shopId, shop.shopName)
                + "<p class='feed-shop-info'>团购描述：{0}</p>".Format(shop.grContent)
                + "<p class='street-address'>店铺地址：{0}</p>".Format(shop.fullAddress)
				+ "<p class=''><span>价格：{0}</span><del></del><span></span></p>".Format(shop.grCurrPrice)
				+ "<p class='one-row'><span>截止：{0}</span></p>".Format(shop.grTimeTo) + "</div>";
        break;
    default:

    }
    var friends = shop.likedFriends,friendsLi="";
	for ( var j = 0; j < friends.length; j += 1) {
        friendsLi += "<li title='{0}'><a class='userInfoTrigger' href='./likelist.jsp?friendId={1}'><img src='{2}' width='20' height='20'></a></li>".Format(friends[j].fullName, friends[j].userId, friends[j].avatarDir);
    }
	
    str += "<div class='feed-likes r'>"
            + "<p class='feed-likes-num'><strong>{0}</strong>人喜欢".Format(shop.likes)
            + "<strong>{0}</strong>来自你朋友</p>".Format(shop.likesFromFriends)
            + "<div class='feed-likes-list'><ul>"+ friendsLi +"</ul></div>"
		+ "</div></div>";
			
    str +=	seekHelp 
    // feed-con end
    + "</div>"
    return str;
}