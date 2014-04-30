var SHOPS_ONE_PAGE = 2;

function likeFeeds(offset) {
    $.getJSON("../action/fetchLikelist.jsp", {
        offset : offset,
        pageSize : SHOPS_ONE_PAGE,
        friendId : $("#friendId").attr("value")
    }, function(json) {
        var tab = $("#tabs-1");
        tab.empty();
        var shops = json.shops;
        var html = "";

        for ( var i = 0; i < shops.length; i += 1) {
            html += (AFeed(shops[i], offset + i));
        }
        var searchTotal = eval($("#likeTotal").attr("value"));
        var SHOPS_ONE_PAGE = 2;
        var pageCount = searchTotal / SHOPS_ONE_PAGE;
        html += "<div id='likeNav'>";
        for ( var i = 0; i < pageCount; i += 1) {
            if (i * SHOPS_ONE_PAGE == offset)
                html += "<strong> {0} </strong>".Format(i + 1);
            else
                html += "<span title={0}> {1} </span>".Format(i, i + 1);
        }
        html += "</div>";
        tab.append(html);

        $("#likeNav > span").click( function() {
            var pageNbr = $(this).attr("title") * SHOPS_ONE_PAGE;
            likeFeeds(pageNbr);
        });
        
        tryFeeds(0);

    });
}
function tryFeeds(offset) {
    $.getJSON("../action/fetchTrylist.jsp", {
        offset : offset,
        pageSize : SHOPS_ONE_PAGE,
        friendId : $("#friendId").attr("value")
    }, function(json) {
        var tab = $("#tabs-2");
        tab.empty();
        var shops = json.shops;
        var html = "";

        for ( var i = 0; i < shops.length; i += 1) {
            html += (AFeed(shops[i], offset + i));
        }
        var searchTotal = eval($("#tryTotal").attr("value"));
        var SHOPS_ONE_PAGE = 2;
        var pageCount = searchTotal / SHOPS_ONE_PAGE;
        html += "<div id='tryNav'>";
        for ( var i = 0; i < pageCount; i += 1) {
            if (i * SHOPS_ONE_PAGE == offset)
                html += "<strong> {0} </strong>".Format(i + 1);
            else
                html += "<span class='nav' title={0}> {1} </span>".Format(i, i + 1);
        }
        html += "</div>";
        tab.append(html);

        $("#tryNav > span.nav").click( function() {
            var pageNbr = eval($(this).attr("title")) * SHOPS_ONE_PAGE;
            tryFeeds(pageNbr);
        });
        
        shopActionsBind();
    });

}
$(document).ready( function() {

    $("#tabs").mytab({tab:"#tabs"});

    likeFeeds(0);
    // $("#advance-search-droplist").click( function() {
        // $("#advance-search").slideToggle("fast");
        // });

    inviteFriendAjax();

    });// end of $(document).ready

