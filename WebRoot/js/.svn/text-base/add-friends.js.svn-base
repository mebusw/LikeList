// JavaScript Document
$( function() {
    var outInput = $('<div class="completed-con"><p><label style="width:50px;">用户名：</label><input type="text" class="text-input" size="25" id="email" name="email" /></p><p><label style="width:50px;">密码：</label><input type="password" class="text-input" size="25" id="password" name="password" /><input type="hidden" value="" id="provider" name="provider" /></p><p class="pl20"><input type="submit" class="btn-input-gray" id="add-friends-submit" value="登录" /></p></div>');
    $("#add-friends-way li a").click( function() {
        $("#add-friends-way li").removeClass("cur");
        $(this).parent().addClass("cur");
        $("#send-email").hide();
        $("#friends-lists").empty();
        $("#friends-lists").parent().hide();
        var wayBox = $("#add-friends-way").parent();
        var wayForm = $('<form action="../action/fetchContact.jsp" method="post" id="add-friends-form"></form>');
        if ($("#add-friends-form")) {
            $("#add-friends-form").remove();
        }
        outInput.appendTo(wayForm);
        wayForm.appendTo(wayBox);
		wayBox.waiting({wait:false});
        $("#provider").attr("value", $(this).attr("id"));
        getFriendsLists();
    })
    var getFriendsLists = function() {
        
        $("#sendMailForm").ajaxForm( {
            dataType : 'json',
            success : function(data) {
                switch (data.ec) {
                case 0:
                    alert("已发送");
                    break;
                default:
                    alert("发送失败，错误代码=" + data.ec);
                }
            }
        });
        
        $("#add-friends-submit").click(
                        function() {
                            var listsBox = $("#friends-lists");
							var wayForm=$("add-friends-form");
							var wayBox=$("#add-friends-way").parent();
                            var options = {
                                type : "POST",
                                dataType : "json",
                                success : function(json) {
                                    if (0 == json.ec) {
                                        var lists = json.contacts;
                                        listsBox.empty();
                                        for ( var i = 0; i < lists.length; i++) {
                                            var li = $("<li class='l'></li>");
                                            li.append('<input class="l" type="checkbox" checked="checked" name="to" value="{0}"/><span class="l username">{1}</span>'.Format(lists[i].email,lists[i].userName));
                                            li.appendTo(listsBox);
                                        }
                                        listsBox.parent().show();
                                        $("#send-email").show();
                                        wayBox.waiting( { wait : false});
                                    }
                                }
                            }
                            wayForm.ajaxForm(options);
                            wayBox.waiting();
                            wayForm.remove();
                            wayForm.clearForm();
                            return false;
                        })
    }
	var wrap=$(".add-inweb-friends");
	var trigger=$("#top_add");
	getFrList(0,8,wrap,trigger);
	var abox = $("#aside-friends-box .add-con");
    var atrigger = $("#aside-more-friends");
    getFrList(0,10,abox,atrigger);
	
	$("#top-friends").click(function(){
        $("#add-friends").popup({
            isDelay:false,
            isRelation:true,
            relationTarget:"#top-friends"
        });
    })
    $("#aside-more-friends").click(function(){
        $("#add-friends").hide();
        $("#aside-friends-box").popup();
    })
    $("#add-friends").mytab({tab:"#add-friends"});
})
function getFrList(offset,pageSize,wrap,trigger){
	    var lmore=$("<div class='more-btn'><a href='#' rel='0'>更多朋友</a></div>");
		var lm = wrap.find(".more-btn");
		if(lm.length < 1){
			wrap.append(lmore);
		}
		trigger.bind("click",function(){
			var lb = wrap.find(".lbox");
			if(lb.length < 1){
			  var listBox=$("<ul class='fix lbox'></ul>");
			  $.ajax({
				  url:"../action/findRecommendFriend.jsp",
				  data:{offset:offset,pageSize:pageSize},
				  dataType:"json",
				  success:function(json){
					  var friends=json.friends;
					  if(json.ec == 0){
						  for(var i=0; i<friends.length; i++){
							  var li=$("<li><a href='../action/inviteFriend.jsp?friendId=" + friends[i].userId + "' class='invite' userId='" + friends[i].userId + "'><img src='" + friends[i].avatarDir + "' width='40px' /><span>" + friends[i].fullName + "</span><span><b>+朋友</b></span></a></li>");
							  listBox.append(li);
						  }
						  lmore.before(listBox);
						  inviteFriendAjax();
					  }
				  }
			  })
			}
		})
		
		wrap.find(".more-btn a").click(function(e){
			e.preventDefault();
			var oft = parseInt($(this).attr("rel"),10) + pageSize;
			$(this).attr("rel",oft);
			$.ajax({
			    url:"../action/findRecommendFriend.jsp",
			    data:{offset:oft,pageSize:pageSize},
			    dataType:"json",
			    success:function(json){
                    var friends=json.friends;
					var listBox=$(".lbox");
                    if(json.ec == 0){
                        for(var i=0; i<friends.length; i++){
                            var li=$("<li><a href='../action/inviteFriend.jsp?friendId=" + friends[i].userId + "' class='invite' userId='" + friends[i].userId + "'><img src='" + friends[i].avatarDir + "' width='40px' /><span>" + friends[i].fullName + "</span><span><b>+朋友</b></span></a></li>");
                            listBox.append(li);
                        }
                        inviteFriendAjax();
                    }
                }
			})
		})
	}