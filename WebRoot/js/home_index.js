var SHOPS_ONE_PAGE = 4;


function recentGrFeeds(offset) {
    $.getJSON("../action/findRecentGr.jsp", {
        offset : offset,
        pageSize : SHOPS_ONE_PAGE
    }, function(json) {
        if (0 == json.ec) {
            var tab = $("#feeds-4");
            var shops = json.shops;

            for ( var i = 0; i < shops.length; i += 1) {
                tab.append(AFeed(shops[i], offset + i));
            }

            $("#feed-locate").attr("href", "#feed-{0}".Format(offset));
            $("#feed-locate").click();
            
            //sequence 4
            shopActionsBind();

            if (shops.length < SHOPS_ONE_PAGE) {
                $("#more-recent-gr").hide();
            } else {

                var recentGrOffset = eval($("#recentGrOffset").attr("value"));
                $("#recentGrOffset").attr("value", recentGrOffset + SHOPS_ONE_PAGE)
            }
        }
    });

}

function recentDealFeeds(offset) {
    $.getJSON("../action/findRecentDeal.jsp", {
        offset : offset,
        pageSize : SHOPS_ONE_PAGE
    }, function(json) {
        if (0 == json.ec) {
            var tab = $("#feeds-3");
            var shops = json.shops;

            for ( var i = 0; i < shops.length; i += 1) {
                tab.append(AFeed(shops[i], offset + i));
            }

            $("#feed-locate").attr("href", "#feed-{0}".Format(offset));
            $("#feed-locate").click();
            
            //sequence 3
            recentGrFeeds(0);

            if (shops.length < SHOPS_ONE_PAGE) {
                $("#more-recent-deal").hide();
            } else {

                var recentDealOffset = eval($("#recentDealOffset").attr("value"));
                $("#recentDealOffset").attr("value", recentDealOffset + SHOPS_ONE_PAGE)
            }
        }
    });

}

function friendLogFeeds(offset) {
    $.getJSON("../action/findFriendLog.jsp", {
        offset : offset,
        pageSize : SHOPS_ONE_PAGE
    }, function(json) {
        if (0 == json.ec) {
            var tab = $("#feeds-2");
            var shops = json.shops;
            
            for ( var i = 0; i < shops.length; i += 1) {
                tab.append(AFeed(shops[i], offset + i));
            }

            //sequence 2
            recentDealFeeds(0);
            
            if (shops.length < SHOPS_ONE_PAGE) {
                 $("#more-friend-log").hide();
            } else {
                var friendLogOffset = eval($("#friendLogOffset").attr("value"));
                $("#friendLogOffset").attr("value", friendLogOffset + SHOPS_ONE_PAGE)
            }
        }
    });

}

function recentLogFeeds(offset) {
    $.getJSON("../action/findRecentLog.jsp", {
        offset : offset,
        pageSize : SHOPS_ONE_PAGE
    }, function(json) {
        if (0 == json.ec) {
            var tab = $("#feeds-1");
            var shops = json.shops;

            for ( var i = 0; i < shops.length; i += 1) {
                tab.append(AFeed(shops[i], offset + i));
            }

            $("#feed-locate").attr("href", "#feed-{0}".Format(offset));
            $("#feed-locate").click();

            //sequence 1
            friendLogFeeds(0);

            if (shops.length < SHOPS_ONE_PAGE) {
                $("#more-recent-log").hide();
            } else {

                var recentLogOffset = eval($("#recentLogOffset").attr("value"));
                $("#recentLogOffset").attr("value", recentLogOffset + SHOPS_ONE_PAGE)
            }
        }
    });

}


$(document).ready( function() {


    $("#tabs").mytab({tab:"#tabs"});
    
    recentLogFeeds(0);
	
    

    $("#more-friend-log").click( function() {
        friendLogOffset = eval($("#friendLogOffset").attr("value"));
        friendLogFeeds(friendLogOffset);
		var feedFrientLog = new feed(friendLogOffset,SHOPS_ONE_PAGE,$("#feeds-2"));
		feedFrientLog();
    });

    $("#more-recent-log").click( function() {
        recentLogOffset = eval($("#recentLogOffset").attr("value"));
        recentLogFeeds(recentLogOffset);
        
    });
    
    $("#more-recent-deal").click( function() {
        recentDealOffset = eval($("#recentDealOffset").attr("value"));
        recentDealFeeds(recentDealOffset);
    });

    $("#more-recent-gr").click( function() {
        recentGrOffset = eval($("#recentGrOffset").attr("value"));
        recentGrFeeds(recentGrOffset);
    });

    inviteFriendAjax();
});// end of $(document).ready

