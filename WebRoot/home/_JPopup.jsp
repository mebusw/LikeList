<%@ page language="java" pageEncoding="UTF-8"%>
<%@  page import="java.text.SimpleDateFormat"%>
<%@  page import="org.likelist.dao.*"%>
<%@  page import="org.likelist.dao.impl.*"%>
<%@  page import="org.likelist.struts.action.AttrParser"%>
<%@  page import="org.likelist.po.*"%>
<%@  page import="java.util.*"%>
<%@  page import="java.text.SimpleDateFormat"%>
<%@ taglib uri="http://struts.apache.org/tags-bean" prefix="bean"%>
<%@ taglib uri="http://struts.apache.org/tags-html" prefix="html"%>
<%@ taglib uri="http://struts.apache.org/tags-logic" prefix="logic"%>
<%@ taglib uri="http://struts.apache.org/tags-tiles" prefix="tiles"%>

<input type="hidden" id="targetShopId"/>
<div id="like-context-popup" class="popup-container hidden">
  <div class="popup-container-wrapper">
    <div class="popup-container-header hidden">
      <div class="popup-container-header-carrot">&nbsp;</div>
    </div>
    <div class="popup-container-content">
      <div class="error-message" style="display:none;"></div>
      <div class="elements-area">
        <div id="like-context-element">
          <input class="shop-id" type="hidden" />
          <input class="shop-liked" type="hidden" />
          <input class="shop-tried" type="hidden" />
          <input class="shop-feed-anchor" type="hidden" />
          <div id="like-context-element-custom"></div>
          <div class="feed-like-program">分享到：
            <ul class="share-list">
              <li><a href="#" class="rr" target="_blank">人人</a></li>
              <li><a href="#" class="kx" target="_blank">开心</a></li>
              <li><a href="#" class="qqwb" target="_blank">QQ微博</a></li>
              <li><a href="#" class="snwb" target="_blank">sina微博</a></li>
              <li><a href="#" class="qqpy" target="_blank">QQ朋友</a></li>
              <li><a href="#" class="qqkj" target="_blank">QQ空间</a></li>
              <!--<li><a href="#" class="ty" target="_blank">天涯</a></li>
            <li><a href="#" class="db" target="_blank">豆瓣</a></li>
            <li><a href="#" class="tb" target="_blank">淘宝</a></li>-->
            </ul>
          </div>
          <p class="feed-like-program"><a id="like-context-element-try">尝试</a></p>
          <p class="feed-like-program"><a id="like-context-element-alikelist" target="_blank">制作卡片</a></p>
          <p class="feed-like-program"><a id="like-context-element-remove">不喜欢了</a></p>
          <a class="close"></a>
          <textarea id="like-context-element-comment"></textarea>
          <br />
          <p><a class="bt-submit bt-round" id="like-context-element-comment-submit"><span>点评</span></a></p>
        </div>
      </div>
    </div>
  </div>
</div>
<!--help-box start-->
<div class="help-box hidden" id="help">
  <div class="help-hd">您可以回应<span class="help-title"></span></div>
  <div class="help-con">谁知道哪里可以吃到便宜的海鲜吗？</div>
  <div class="help-canel tr fix"><span class="l">用鼠标拖拉商家头像到这里即可</span><a href="#" class="r">关闭</a></div>
</div>

<!--help-box end--> 