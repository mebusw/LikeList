// JavaScript Document
/*tab插件的html结构*/
/*
<div id="tab">
   <div class="tab-head"></div>
   <div class="tab-art"></div>
</div>
*/
   
/*tab*/
(function($){
	$.fn.mytab=function(options){
		return $(this).each(function(){
			var defaults={
				tab:"#tab",
				curIndex:0
				}
			var s = $.extend({}, defaults, options || {});
			var tabGroup=$(s.tab);
			var tabHa=tabGroup.children(".tab-head").find("a");
			var showtab=function(index){
				tabGroup.children(".tab-art").children().hide();
				tabGroup.children(".tab-art").children().eq(index).show();
				tabHa.eq(index).addClass("cur");
			}
			var anchorText=window.location.hash.toString().split("&");
			for(var i=0; i<anchorText.length;i++){
				var anchorTextarr=anchorText[i].replace("#","").split("_");
				if(anchorTextarr[0]==tabGroup.attr("id")){
					s.curIndex=anchorTextarr[1];
				}
			}
			showtab(s.curIndex);
			tabHa.click(function(e){
				e.preventDefault();
				var sid=$(this).attr("rel");
				tabHa.removeClass("cur");
				$(this).addClass("cur");
				tabGroup.children(".tab-art").children().hide();
				$("#"+sid).show();
			})
		})
	}
	$.fn.popup=function(options){
		return $(this).each(function(){
			var defaults={
				isDelay:true,
				isRelation:false,
				relationTarget:""
			}
			var s = $.extend({}, defaults, options || {});
			var wrapGroup=$(this);
			var addBg=wrapGroup.find(".add-bg");
			wrapGroup.show();
			
			var wWidth=wrapGroup.outerWidth(),wHeight=wrapGroup.outerHeight();
			var pWidth=$(document.body).width(),pHeight=$(document.body).height();
			var oWidth=$(window).width(),oHeight=$(window).height();
			var pl=oWidth>wWidth?(oWidth-wWidth)/2:0;
			var pt=oHeight>wHeight?(oHeight-wHeight)/2:0;
			if(s.isRelation){
				var rt=$(s.relationTarget);
				var rtOffset=rt.offset();
				var rtWidth=rt.outerWidth(),rtHeight=rt.outerHeight();
				var rtl=(oWidth-wWidth)>rtOffset.left?rtOffset.left:(oWidth-wWidth);
				wrapGroup.css({left:rtl,top:(rtOffset.top+rtHeight)});
			}else{
				wrapGroup.css({left:pl,top:pt});
			}
			addBg.css({width:wWidth,height:wHeight});
			
			if(s.isDelay){
				var delay=$('<div class="delay"></div>');
				var dWidth=pWidth>oWidth?pWidth:oWidth;
				var dHeight=pHeight>oHeight?pHeight:oHeight;
				delay.appendTo(document.body)
				delay.css({width:dWidth,height:dHeight});
				delay.click(function(){
					$.fn.popup.hide();
				})
			}
			
			$(".add-close",wrapGroup).click(function(){
				$.fn.popup.hide();
			})
			$(".cannel",wrapGroup).click(function(){
				$.fn.popup.hide();
			})
			$.fn.popup.hide=function(){
				$(".delay").remove();
				wrapGroup.hide();
			}
		})
	}
	$.fn.setCalendarOffset=function(options){
		return $(this).each(function(){
			var defaults={}
			var s = $.extend({}, defaults, options || {});
			var CalendarTarget=$(this);
			var ol=CalendarTarget.offset().left+30,ot=CalendarTarget.offset().top+25;
			$("#calendar").css({left:ol,top:ot});
		})
	}
	$.fn.waiting=function(options){
		return $(this).each(function(){
			var defaults={
				wait:true
				}
			var w = $.extend({}, defaults, options || {});
			var waitingBox=$('<div id="waiting"><img src="../images/waiting.gif" alt="waiting" /></div>');
			var base=$(this);
			if(w.wait){
				waitingBox.appendTo(base);
			}else{
				$("#waiting").remove();
			}
			
		})
	}
})(jQuery)
$(function(){
	$("#tabs").mytab({tab:"#tabs"});
    $("#updateUserSeekHelpForm").ajaxForm( {
        dataType : 'json',
        success : function(data) {
            switch (data.ec) {
            case 0:
                alert("已求助");
                break;
            default:
                alert("求助失败，错误代码=" + data.ec);
            }
        }
    });
    $("a.invite").click(function() {
       var url = $(this).attr("href");
       $.getJSON(url, {}, function(json) {
           if (0 == json.ec) {
               alert("邀请成功");
           } else {
               alert("邀请失败");
           }
       });
       return false;
    });
    

})

//height
function setHeight(){
	var h=$(".content").height()-2;
	$(".aside").css("height",h);
}