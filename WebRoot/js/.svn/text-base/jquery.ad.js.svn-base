// JavaScript Document
(function($){
	$.fn.extend({
		ad:function(options){
			var defaults={
				speed:"2000",
			}
			var ad=$(this)
			ad.options=$.extend(defaults,options);
			///*sort*/
			var al=$(".ad_con li",ad),ac=$(".ad_con",ad),aa=$(".ad_nav a",ad);
			ad.options.ht=al.eq(0).height();
			al.each(function(i){
			    $(this).attr("index",i);
		        })
			ad.animate=function(){
				ac.animate({top:-ad.options.ht},500,ad.re());
			}
			ad.re=function(){
				ac.css("top","0px");
				ac.domdo(1);
				al=$(".ad_con li");
				var cur=al.eq(0).attr("index");
				aa.removeClass("current").eq(cur).addClass("current");
			}
			ad.auto=function(){
				ad.interval=window.setInterval(ad.animate,2000);
			}
			ad.stop=function(){
				window.clearInterval(ad.interval);
			}
			ad.auto();
			ac.hover(ad.stop,ad.auto);
			aa.hover(function(){
				ad.stop();
				var f=parseInt($(".ad_con li").eq(0).attr("index"));
				var tarnum=parseInt($(this).text())-1;
				//alert(-f)
				var di=-tarnum*ad.options.ht;
				ac.domdo(-f).stop().animate({top:di},500);
				$(this).siblings().removeClass("current").end()
				.addClass("current");
			},function(){
				var tarnum=parseInt($(this).text())-1;
				ac.domdo(tarnum)
				ad.auto();
			})
			return this;
		},
		domdo:function(num){
			var num= parseInt(num);
			if(num>0){
				for(var i=0;i<num;i++){
				$(this).find("li:first").appendTo($(this));
			    }
			}else if(num<0){
				for(var i=0;i<Math.abs(num);i++){
				$(this).find("li:last").prependTo($(this));
				}
			}else if(num==0){
				return $(this);
			}
			return this;
		}
	})
})(jQuery)