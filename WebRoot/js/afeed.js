var feed=function(){
	this.init.apply(this,arguments);
}
feed.prototype={
	init:function(sendData,sFeedBox,url,num){
		    var self = this;
			var datatype = ["recentLog","friendLog","recentdeal","recentgr","liked","tried","shops","searchshop","searchdeal","searchgr"];
			var offset = sendData.offset;
		    $.ajax({
			  url:url,
			  data:sendData,
			  dataType:"json",
			  success:function(json){
				   if(0 === json.ec){
					   var shops = json.shops;
					   var tab = $(sFeedBox);
					   var type = datatype [ num - 1 ];
					   for(var i=0; i<shops.length; i++){
						   self.data[type].push(shops[i]);
						   var category=shops[i].feedFormatter;
						   tab.append(self.build(shops[i], offset + i,category,type)); 
						   if(i == 1){
							     var srTop = $(".a-feed").eq(0).offset().top - 5;
								 window.scrollTo(0,srTop)
							 }
						   $(".a-feed").click(function(){
							   $(this).addClass("feed-cur").siblings(".a-feed").removeClass("feed-cur");
						   })
					   }
					   self.likedMuster();
			           self.helpPlat();
				   }
			    }
			})
			
		},
	data:{
		  recentLog:[],  //1
		  friendLog:[],  //2
		  recentdeal:[], //3 
		  recentgr:[],   //4
		  liked:[],      //5
		  tried:[],      //6
		  shops:[],      //7
		  searchshop:[], //8
		  searchdeal:[], //9
		  searchgr:[]    //10
		},
	build:function(shop,offset,category,type){
		     var opName = [ "喜欢", "尝试", "点评", "分享", "访问", "转发", "团购", "点击", "回应" ];
		     var feedDom = $("<div class='a-feed' data-shopId='" + shop.shopId + "' data-shopName='" + shop.shopName + "' data-type='" + type + "'></div>");
			 var likeFlagStr = shop.isLikedByYou || shop.isTriedByYou ? "已经喜欢" : "喜欢";
			 var likedClassStr = shop.isLikedByYou ? "liked" : "";
			 var feedAction = "<div class='feed-action'>" + "<a class='bt-feed-action bt-likeit bt-split'>"
					+ "<span class='bt-primary {0}'>{1}</span>".Format(likedClassStr, likeFlagStr)
					+ "<span class='bt-secondary'><span class='arrow-down'></span></span></a>"
					+ "<input type='hidden' class='shop-id' value='{0}'/>".Format(shop.shopId)
					+ "<input type='hidden' class='shop-liked' value='{0}'/>".Format(shop.isLikedByYou)
					+ "<input type='hidden' class='shop-tried' value='{0}'/>".Format(shop.isTriedByYou)
			     + "</div>";
			  feedDom.append(feedAction);
			  
			  var feedCon = $("<div class='feed-con'></div>");
			  
			  switch(category){
				  case 0:
					var feedItro =  "<div class='feed-img l'><img src='{0}' height='90' width='90' /></div>".Format(shop.avatarPath)
					              + "<div class='feed-msg l'>"
								  + "<p class='feed-shop-title'><a href='../home/userShop.jsp?shopId={0}' target='_blank'>{1}</a></p>"
										  .Format(shop.shopId, shop.shopName)
								  + "<p class='feed-shop-info'>{0}</p>".Format(shop.description)
								  + "<p class='street-address'>详细地址：{0}</p>".Format(shop.fullAddress)
								  + "<p>网址：<a href='{0}'>{1}</a></p>".Format(shop.website, shop.website)
								  + "<p class='one-row'><span class='tel'>优惠：</span><a href='../home/userShop.jsp?shopId={0}#tabs_4' target='_black'>{1}</a></p>".Format(shop.shopId,shop.dealSubject)
								  + "<p class='one-row'><span class='tel'>团购：</span><a href='../home/userShop.jsp?shopId={0}#tabs_5' target='_black'><span>价格￥{1}</span>,<span>原价￥{2}</span>,<span>{3}折</span>,<span>节省￥{4}</span></a></p>".Format(shop.shopId,shop.grCurrPrice,shop.grOrigPrice,this.discount(shop.grOrigPrice,shop.grCurrPrice),(parseInt(shop.grOrigPrice,10) - parseInt(shop.grCurrPrice,10)))
								  + "<p>分类：<a href='./search.jsp?category1={0}'>{1}</a></p>".Format(shop.categroy1,shop.categroy1) + "</div>";
					feedCon.append(feedItro);
				  break;
				  
				  case 1:
				     var likedStatus="<h4 class='feed-title-sub'>"
									+ "<span class='feed-newsuser'><img src='{0}' height='20' width='20' alt='头像' /></span>".Format(shop.opAvatarDir)
									+ "<a href='./likelist.jsp?friendId={0}' target='_blank'>{1}</a>".Format(shop.opUserId, shop.opFullName)
									+ " {0} {1} {2}".Format(jsDateDiff(shop.createTime), opName[shop.opTypeId],shop.destContent) + "</h4>";
				     
					 var feedItro =  "<div class='feed-img l'><img src='{0}' height='90' width='90' /></div>".Format(shop.avatarPath)
									+ "<div class='feed-msg l'>"
									+ "<p class='feed-shop-title'><a href='../home/userShop.jsp?shopId={0}'>{1}</a></p>"
											.Format(shop.shopId, shop.shopName)
									+ "<p class='feed-shop-info'>{0}</p>".Format(shop.description)
									+ "<p class='street-address'>详细地址：{0}</p>".Format(shop.fullAddress)
									+ "<p class='one-row'><span class='tel'>优惠：</span><a href='../home/userShop.jsp?shopId={0}' target='_black'>{0}</a></p>".Format(shop.shopId,shop.dealSubject)
									+ "<p class='one-row'><span class='tel'>团购：</span><a href='../home/userShop.jsp?shopId={0}' target='_black'><span>价格￥{1}</span>,<span>原价￥{2}</span>,<span class='fm-blue'>{3}折</span>,<span>节省￥{4}</span></a></p>".Format(shop.shopId,shop.grCurrPrice,shop.grOrigPrice,this.discount(shop.grOrigPrice,shop.grCurrPrice),(parseInt(shop.grOrigPrice,10) - parseInt(shop.grCurrPrice,10)))
									+ "<p>网址：<a href='{1}' target='_blank'>{1}</a></p>".Format(shop.website, shop.website)
									+ "<p>分类：<a href='./search.jsp?category1={0}'>{1}</a></p>".Format(shop.categroy1,
											shop.categroy1) + "</div>"
											
					  feedCon.append(likedStatus);
					  feedCon.append(feedItro);
				  break;
				  
				  case 2:
				    var feedItro= "<div class='feed-img l'><img src='{0}' height='90' width='90' /></div>".Format(shop.avatarPath)
								+ "<div class='feed-msg l'>"
								+ "<p class='feed-shop-title'><a href='../home/userShop.jsp?shopId={0}'>{1}</a></p>"
										.Format(shop.shopId, shop.shopName)
								+ "<p>优惠标题：{0}</p>".Format(shop.dealSubject)
								+ "<p class='feed-shop-info'>描述：{0}</p>".Format(shop.dealContent)
								+ "<p class='one-row'><span>折扣：{0}</span></p>".Format(shop.dealPercent)
								+ "<p class=''><span>结束时间：{0}</span></p>".Format(this.formatTime(shop.grTimeTo))
								+ "<p class='one-row'><span>团购：<a href='../home/userShop.jsp?shopId={0}'>{1}</a></span></p>".Format(shop.shopId,shop.grSubject) + "</div>";
					feedCon.append(feedItro);
				  break;
				  
				  case 3:
				    var feedItro= "<div class='feed-img l'><img src='{0}' height='90' width='90' /></div>".Format(shop.avatarPath)
								+ "<div class='feed-msg l'>"
								+ "<p class='feed-shop-title'><a href='../home/userShop.jsp?shopId={0}'>{1}</a></p>"
										.Format(shop.shopId, shop.shopName)
								+ "<p class='feed-shop-info'>团购描述：{0}</p>".Format(shop.grContent)
								+ "<p class='feed-gr-price'><span>价格：<b class='fr-red'>{0}</b></span>原价：<del>{1}</del><b>折扣：{2}</b></p>".Format(shop.grCurrPrice,shop.grOrigPrice,this.discount(shop.grOrigPrice,shop.grCurrPrice))
								+ "<p class='feed-gr-rtime'><span>剩余时间：{0}</span></p>"
								+ "<p class='one-row'><span>截止：{0}</span></p>".Format(this.formatTime(shop.grTimeTo)) + "</div>";
					feedCon.append(feedItro);
				  break;
			  }
			  var friends = shop.likedFriends,friendsLi="";
			  for ( var j = 0; j < friends.length; j += 1) {
				  friendsLi += "<li title='{0}'><a class='userInfoTrigger' href='./likelist.jsp?friendId={1}'><img src='{2}' width='20' height='20'></a></li>".Format(friends[j].fullName, friends[j].userId, friends[j].avatarDir);
			  }
			  var feedLikes = "<div class='feed-likes r'>"
							+ "<p class='feed-likes-num'><strong>{0}</strong>人喜欢".Format(shop.likes)
							+ "<strong>{0}</strong>来自你朋友</p>".Format(shop.likesFromFriends)
							+ "<div class='feed-likes-list'><ul>"+ friendsLi +"</ul></div>"
						    + "</div>";
			  feedCon.append(feedLikes);
			  feedDom.append(feedCon);
			  
			  if(category == 1 && shop.opSeekHelp !=" " && shop.opSeekHelp != "undefield" ){
				  var seekHelp = "<p class='feed-help'><b class='hfn'>{0}的求助</b>：<b class='htc'>{1}</b><a href='#' class='btn-a'>回应</a></p>".Format(shop.opFullName, shop.opSeekHelp);
				  feedDom.append(seekHelp);
			  }
			  return feedDom;
		},
	likedMuster:function(){
		     var s={
					tBox:"#like-context-popup",
					tInfo:"#like-context-element"
				 }
			var self = this;
			
		    $("span.bt-secondary").unbind("click").click(function(e){
				var shopBox = $(this).parents(".a-feed");
				var shopId = shopBox.attr("data-shopid");
				var aPosition = $(this).offset();
				var feedAction = shopBox.find(".feed-action");
				var type = shopBox.attr("data-type");
				
				var curShop = self.getShop(shopId,type);
				var liked = curShop.isLikedByYou;
				var tried = curShop.isTriedByYou;
				
				shopBox.attr("id","feedAnchor")
				$(s.tBox).css( {
					left : (aPosition.left - 2) + 'px',
					top : (aPosition.top + 32) + 'px'
				})
				    .removeClass("hidden")
					.show();
				$(s.tInfo).find(".shop-id").attr("value", shopId);
						  
				if (liked || tried) {
					$("#like-context-element-try").parent().addClass("hidden");
					$("#like-context-element-remove").parent().removeClass("hidden");
				} else {
					$("#like-context-element-remove").parent().addClass("hidden");
					$("#like-context-element-try").parent().removeClass("hidden");
				}
				var tryText = tried ? "已经尝试" : "尝试";
				$("#like-context-element-try").text(tryText);
	            $(".qqwb").attr("href",self.shareTo("qqweb"));
	            $(".rr").attr("href",self.shareTo("rr"));
	            $(".snwb").attr("href",self.shareTo("snwb"));
	            $(".qqkj").attr("href",self.shareTo("qqkj"));
	            $(".qqpy").attr("href",self.shareTo("qqpy"));
	            $(".kx").attr("href",self.shareTo("kx"));
			})
			$("span.bt-primary").unbind("click").click( function() {
				var shopBox = $(this).parents(".a-feed");
				var shopId = shopBox.attr("data-shopid");
				var allShop = $(".a-feed[data-shopid='" + shopId + "']");
				var type = shopBox.attr("data-type");
				
				var curShop = self.getShop(shopId,type);
				var liked = curShop.isLikedByYou;
				var tried = curShop.isTriedByYou;
		
				if (!liked) {
					$.getJSON("../action/iLike.jsp", {
						shopId : shopId
					}, function(json) {
						if (0 == json.ec) {
							for(var i=0; i < allShop.length; i++){
								var span = allShop.eq(i).find("span.bt-primary");
								span.html("已经喜欢");
								allShop.eq(i).parent().nextAll(".shop-liked").attr("value", liked);
								allShop.eq(i).parent().nextAll(".shop-tried").attr("value", tried);
							}
							curShop.isLikedByYou = true;
						}
					});
				}
		    });
			$("#like-context-element-remove").unbind("click").click(function() {
				var shopBox = $("#feedAnchor");
				var shopId = $("#like-context-element .shop-id").attr("value");
				var allShop = $(".a-feed[data-shopid='" + shopId + "']");
				var type = shopBox.attr("data-type");
				
				var curShop = self.getShop(shopId,type);
				var liked = curShop.isLikedByYou;
				var tried = curShop.isTriedByYou;
				
                if (liked || tried) {
					$.getJSON("../action/disLike.jsp", {shopId : shopId}, function(json) {
						if (0 == json.ec) {
							for(var i=0; i < allShop.length; i++){
								var span = allShop.eq(i).find("span.bt-primary");
								span.html("喜欢");
								allShop.eq(i).find(".shop-liked").attr("value",liked);
								allShop.eq(i).find(".shop-tried").attr("value",tried);
							}
							self.likedBoxhide();
							curShop.isLikedByYou = false ;
							curShop.isTriedByYou = false ;
						}
					})
                }
            });
			$("#like-context-element-try").unbind("click").click(function() {
				var shopBox = $("#feedAnchor");
				var shopId = $("#like-context-element .shop-id").attr("value");
				var allShop = $(".a-feed[data-shopid='" + shopId + "']");
				var type = shopBox.attr("data-type");
				
				var curShop = self.getShop(shopId,type);
				var liked = curShop.isLikedByYou;
				var tried = curShop.isTriedByYou;

				$.getJSON("../action/iTry.jsp", {
					shopId : shopId
				}, function(json) {
					if (0 == json.ec) {
						for(var i=0; i < allShop.length; i++){
							var span = allShop.eq(i).find("span.bt-primary");
							span.html("已经喜欢");
							allShop.eq(i).find(".shop-liked").attr("value",liked);
							allShop.eq(i).find(".shop-tried").attr("value",tried);
						}
						self.likedBoxhide();
						curShop.isLikedByYou = true ;
						curShop.isTriedByYou = true ;
					}
					
				});
               
            });
			$("#like-context-element-alikelist").click( function() {
				var id = $(this).parents("#like-context-element").find(".shop-id").attr("value");
				$(this).attr("href","shopCard.jsp?shopId=" + id);
			});

			$("#container").click(function(event){
				 var $target = $(event.target);
				 if($target.attr("class") != "bt-secondary"){
					 self.likedBoxhide();
				 }
			})
		},
	likedBoxhide:function(){
		    $("#like-context-popup").hide();
			$("#feedAnchor").attr("id","");
	    },
		//回应求助
	helpPlat:function(){
		   var self = this;
		   var drop=$("#help"),drag=$(".feed-img");
		   self.dropPosition(drop);
		   if(self.helpStatus() == "yes"){
			    var text=self.getHelpRegard();
				var shopId = text[1];
				var helpTitle = text[3];
				var helpCon=text[2];
				drop.find(".help-title").text(helpTitle);
				drop.find(".help-con").text(helpCon);
				self.esjDrop(drag,drop);
		   }
		   $(".feed-help a").click(function(e){
				  e.preventDefault();
				  var shopBox = $(this).parents(".a-feed")
				  var shopId = shopBox.attr("data-shopid");
				  var type = shopBox.attr("data-type");
				  var curShop = self.getShop(shopId,type);
				  
				  var helpTitle=$(this).siblings(".hfn").text();
				  var helpCon=$(this).siblings(".htc").text();
				  var s=self.helpStatus(); //获取状态
				  setCookie("ghr","" + curShop.opUserId +"&" + shopId + "&" + helpCon + "&" + helpTitle + "");
				  
				  drop.attr("data-shopid",shopId).find(".help-title").text(helpTitle).end()
				      .find(".help-con").text(helpCon);
				  if(s===null || s==="no"){
					  self.esjDrop(drag,drop);
				  }
			  })
		   $(".help-canel a").click(function(e){
				  e.preventDefault();
				  drop.hide();
				  self.helpStatus("no");
			})
	    },
	dropPosition:function(drop){
		    var dropOffect={
					left:(parseInt($(window).width())-980)/2+50,
					top:parseInt($(window).height()-160)/2
				};
			drop.css({left:dropOffect.left,top:dropOffect.top})
			$(document).scroll(function(){
				var dTop = dropOffect.top + parseInt($(this).scrollTop());
				drop.css({top:dTop});
			})  
	    },
	esjDrop:function(drag,drop){
		    var self = this;
		    drop.show();
			self.helpStatus("yes");
			var helpData=self.getHelpRegard();
			var shopId = helpData[1];
			var friendId = helpData[0];
			var helpTitle = helpData[3];
			drag.css({cursor:"move"}).draggable({ 
						containment:"document", 
						revert: "invalid",
						helper: "clone", 
						cursor: "move", 
						zIndex: "2000" 
			});
		   drop.droppable({
				accept:".feed-img",
				activeClass:"help-box-highlight",
				drop:function(event, ui){
				  self.helpStatus("no");
				  drop.hide();
				  drag.css({cursor:"default"});
				  $.ajax({
					  url:"../action/iResponse.jsp",
					  data:{shopId:shopId,friendId:friendId},
					  dataType:"json",
					  success:function(json){
						  if(json.ec == "0"){alert("您回应了" + helpTitle + "！")}
					  }
				  })
				} 
		   })
		},
		//获取帮助动作的三个关系方，被帮助的id:friendId，回应的id:userId，店铺id:shopId
	getHelpRegard:function(){
		     var ghr = getCookie("ghr");
			 var gArr = [];
			 if(ghr){
				 gArr = ghr.split("&");
			 }
			 return gArr;
	   },
	   //获取求助信息
	helpStatus:function(status){
		    if(status){
					setCookie("helpstatus",status);
			}else{
					var status=getCookie("helpstatus");
			}
			return status; 
		},
		//获取当前店铺的json
	getShop:function(shopid,type){ //type:数据来源类别，分为：recentLog,friendLog,recentdeal,recentgr
	        var self = this;
		    var datas = self.data[type];
		    var curShop = null;
			for(var i=0; i<datas.length; i++){
				if(datas[i].shopId == shopid){
					curShop = datas[i];
				}
			}
			return curShop;
	    },
		//共享
	shareTo:function(web){
	        var self = this;
	        var shopBox = $("#feedAnchor");
            var shopId = $("#like-context-element .shop-id").attr("value");
            var allShop = $(".a-feed[data-shopid='" + shopId + "']");
            var type = shopBox.attr("data-type");
            
            var curShop = self.getShop(shopId,type);
            var shopTitle = curShop.shopName;
            var imgSrc = curShop.avatarPath;
            switch(type)
            {
            case("friendLog"):
                var _title = "我在朋互网看到"+ shopTitle +"这家店不错，推荐下!" ;
                break;
            case("recentdeal"):
            {
                var dealsub = curShop.dealSubject;
                var _title = shopTitle +"打折啦!" + dealsub ;
            }
                break;
            case("recentgr"):
            {
                var grsubject = curShop.grSubject;
                var _title = shopTitle +"的团购："+ grSubject ;
            }
                break;
            default:
                 var _title = "我在朋互网看到"+ shopTitle +"这家店不错，推荐下!" ;
                break;
            }
	        var _url = "http://www.penghoo.com/home/userShop.jsp?shopId=" + shopId;
	        var _pic="http://www.penghoo.com/" + imgSrc.substring(3);
	        var _site = "http://www.penghoo.com/home/";
	        var _content ="我个人觉得还不错，过来看看吧！";
	        var _u;
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
		},
		//格式化时间
	formatTime:function(time){
		    var s=String(time).split(" ");
			var arr=s[0].split("/");
			var time=arr[2] + "-" + arr[0] + "-" + arr[1] + " " + s[1];
			return time;
	    },
		//计算折扣
	discount:function(olePrice,newPrice){
		     var op=parseInt(olePrice),np=parseInt(newPrice),count="";
		     var c=parseFloat(np/op);
			 if(c<1 && c>0){
				 count = parseFloat(c.toString().substring(0,4),10) * 10;
			 }
			 return count || 0;
	    }
}

