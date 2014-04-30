// JavaScript Document
//by Litian
(function($){
	$.fn.extend({
		sl:function(options){
			var defaults={
				bnum:5,    //Number;
				way:"lr",  //or"tb";
				loc:0,     //Number;
				speed:700
			}
			var base=$(this);
			base.options=$.extend(defaults,options);
			var items=$(".sl_con>li",base),
			    prevbtn=$(".prev",base),
				tprevbtn=$(".tprev",base),
				nextbtn=$(".next",base),
				bnextbtn=$(".bnext",base),
				con=$(".sl_con",base),
				num=items.length;
			//bnum
			base.options.bnum=num<=base.options.bnum?num-2:base.options.bnum;
			if(num<=3){
				base.options.bnum=num;
				prevbtn.hide();
				nextbtn.hide();
				tprevbtn.hide();
				bnextbtn.hide();
			}
			//box
			var w=base.options.way || "lr";
			base.options.iWidth=parseInt(items.eq(0).outerWidth());
			base.options.iHeight=parseInt(items.eq(0).outerHeight());
			switch(w){
				case "lr":
				base.options.width=base.options.bnum*base.options.iWidth;
				base.options.height=base.options.iHeight;
				items.css({float:"left"});
				con.css({width:num*base.options.iWidth,height:base.options.height});
				base.options.loc=parseInt(con.css("left"));
				break;
				case "tb":
				base.options.width=base.options.iWidth;
				base.options.height=base.options.bnum*base.options.iHeight;
				items.css({float:"none"});
				con.css({width:base.options.width,height:num*base.options.iHeight});
				base.options.loc=parseInt(con.css("top"));
				break;
			}
			base.css({width:base.options.width,height:base.options.height});
			//btn
			nextbtn.css({height:base.options.iHeight});
			prevbtn.css({height:base.options.iHeight});
			tprevbtn.css({width:base.options.iWidth});
			bnextbtn.css({width:base.options.iWidth});
			//animate
			base.animate=function(direction){//direction "left","right","up","down"
				var dir=direction || "left",dis,speed=base.options.speed,locarr=[];
				switch(dir){
					case "left":
					dis=parseInt(base.options.loc-base.options.iWidth);
					if(!con.is(":animated")){
						con.animate({left:dis},speed,function(){
							con.css({left:base.options.loc}).domdo(1);
						});
					}else{
						alert("你点的速度太快了！！！");
						con.css({left:base.options.loc});
					}
					break;
					case "right":
					base.options.loc=parseInt(con.css("left"))==0?0:-base.options.iWidth;
					if(base.options.loc==0){con.domdo(-1);}
					var bloc=base.options.loc==0?-base.options.iWidth:base.options.loc;
					dis=parseInt(bloc+base.options.iWidth);
					con.stop().css({left:bloc}).animate({left:dis},speed,function(){
						con.css({left:bloc}).domdo(-1)
					});
					break;
					case "up":
					dis=parseInt(base.options.loc-base.options.iHeight);
					con.animate({top:dis},speed,function(){
						con.css({top:base.options.loc}).domdo(1);
					});
					break;
					case "down":
					base.options.loc=parseInt(con.css("left"))==0?0:-base.options.iHeight;
					if(base.options.loc==0){con.domdo(-1);}
					var bloc=base.options.loc==0?-base.options.iHeight:base.options.loc;
					dis=parseInt(bloc+base.options.iHeight);
					con.css({top:bloc}).animate({top:dis},speed,function(){
						con.css({top:bloc}).domdo(-1);
					});
					break;
				}
			}
			prevbtn.click(function(){
				base.animate();
				return false;
			})
			tprevbtn.click(function(){
				base.animate("up");
				return false;
			})
			nextbtn.click(function(){
				base.animate("right");
				return false;
			})
			bnextbtn.click(function(){
				base.animate("down");
				return false;
			})
		}
	})
})(jQuery)