$(function(){
	var searchShopArg = {
		   keyword : $("#keyword").attr("value"),
		   offset : 0,
		   pageSize : 10,
		   category1 : $("#category1").attr("value"),
		   province : $("#province").attr("value"),
		   city : $("#city").attr("value"),
		   district : $("#district").attr("value")
		};
	var searchDealArg = {
		   keyword : $("#keyword").attr("value"),
		   offset : 0,
		   pageSize : 10,
		   category1 : $("#category1").attr("value"),
		   province : $("#province").attr("value"),
		   city : $("#city").attr("value"),
		   district : $("#district").attr("value")
		};
	var searchShopBox = "#search-shop" , searchShopUrl = "../action/searchShop.jsp";
	var searchDealBox = "#search-deal" , searchDealUrl = "../action/searchDeal.jsp";
	var searchShop = new feed(searchShopArg,searchShopBox,searchShopUrl,8);
	var searchDeal = new feed(searchDealArg,searchDealBox,searchDealUrl,9);
	var shopCountNum = Math.floor(parseInt($("#searchTotal").attr("value"))  /  10);
	var dealCountNum = Math.floor(parseInt($("#dealTotal").attr("value"))  /  10);
	var buildSearchNav = function(count,parent,cur){
		   var curcount = cur;
		   var searchNav = $("<div class='search-nav'></div>");
		   for(var i = 0; i<count; i++){
		     	var navE = "<a href='#'>" + (i+1) + "</a>";
				searchNav.append(navE);
		   }
		   if(typeof parent == "string"){
			   $(parent).append(searchNav);
		   }else {
			   parent.append(searchNav);
			}
			searchNav.find("a").eq(cur).attr("class","active");
		}
	buildSearchNav(shopCountNum,"#tabs-1",0);
	buildSearchNav(dealCountNum,"#tabs-2",0);
	$("#tabs-1 .search-nav a").click(function(e){
		e.preventDefault();
		var cur = parseInt(($(this).text()-1),10);
		searchShopArg.offset = cur * 10;
		$("#search-shop").empty();
		var searchShop = new feed(searchShopArg,searchShopBox,searchShopUrl,8);
		$(this).siblings().removeClass("active");
		$(this).addClass("active");
	})
	$("#tabs-2 .search-nav a").click(function(e){
		e.preventDefault();
		var cur = parseInt(($(this).text()-1),10);
		searchShopArg.offset = cur * 10;
		$("#search-deal").empty();
		var searchDeal = new feed(searchDealArg,searchDealBox,searchDealUrl,9);
		$(this).siblings().removeClass("active");
		$(this).addClass("active");
	})
	$("#tabs").mytab({tab:"#tabs"});
	inviteFriendAjax();
	
})

