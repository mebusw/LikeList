<%@ page language="java" pageEncoding="UTF-8"%>
<%@  page import="java.text.SimpleDateFormat"%>
<%@  page import="org.likelist.dao.*"%>
<%@  page import="org.likelist.dao.impl.*"%>
<%@  page import="org.likelist.po.*"%>
<%@  page import="java.util.*"%>
<%@  page import="org.likelist.struts.action.*"%>
<%@  page import="org.json.simple.JSONObject"%>
<%@  page import="org.likelist.type.*"%>
<%@ page import="org.springframework.context.ApplicationContext" %>
<%@ page import="org.springframework.web.context.support.WebApplicationContextUtils" %>



<%
    request.setCharacterEncoding("utf-8");

    int offset = AttrParser.getParaInt(request, "offset");
    int pageSize = AttrParser.getParaInt(request, "pageSize");       

    JSONObject json = new JSONObject();
    int uid = AttrParser.getUid(request);

    ApplicationContext ctx = WebApplicationContextUtils.getWebApplicationContext(session.getServletContext());
    IShopUserDAO dao = (ShopUserDAOImpl) ctx.getBean("shopUserDAO");
    IFriendDAO dao1 = (FriendDAOImpl) ctx.getBean("friendDAO");

    SimpleDateFormat sdf = DateTimeUtil.getSimpleDateFormatInstance();

    if (uid > 0){
        List<?> dealList = dao.findRecentDeal(uid, offset, pageSize);
    	
     if (null == dealList) {
         json.put("ec", EC.DAO_FAIL.toInt());
     } else {
         json.put("ec", EC.SUCCESS.toInt());
         
            List shops = new LinkedList();
            List friends;
            Map oneShop;
            Map oneFriend;
            Iterator<EsjUserInfo> friendsWhoLike;
            EsjUserInfo f;

         Iterator iterator1 = dealList.iterator();
         while (iterator1.hasNext()) {
             Object[] o = (Object[]) iterator1.next();
                EsjShop o0 = (EsjShop)o[0];
                EsjShopDiscount o1 = (EsjShopDiscount)o[1];
                EsjShopGrouprate o2 = (EsjShopGrouprate)o[2];
             
             oneShop = new LinkedHashMap();
                oneShop.put("feedFormatter", FeedFormatter.DISCOUNT.ordinal());
             
                oneShop.put("dealSubject", o1.getSubject());
                oneShop.put("dealContent", o1.getContent());
                oneShop.put("dealPercent", o1.getPercent());
                oneShop.put("dealTimeTo", sdf.format(o1.getTimeTo()));
                
                oneShop.put("grSubject", o2.getSubject());
                oneShop.put("grContent", o2.getContent());
                oneShop.put("grTimeTo", sdf.format(o2.getTimeTo()));
                oneShop.put("grOrigPrice", o2.getOrigPrice());
                oneShop.put("grCurrPrice", o2.getCurPrice());
             
                oneShop.put("opLogId", 0);
                oneShop.put("opTypeId", 0);
                oneShop.put("createTime", sdf.format(o1.getCreateTime()));
             
                oneShop.put("opFullName", "");
                oneShop.put("opAvatarDir", "");
                oneShop.put("opUserId", 0);
                oneShop.put("destContent", "");
     
                oneShop.put("shopName", o0.getShopName());
                oneShop.put("avatarPath", o0.getShopAvatarPath());
                oneShop.put("shopId", o0.getShopId());
                oneShop.put("shopName", o0.getShopName());
                oneShop.put("fullAddress", o0.getFullAddress());
                oneShop.put("shopPhone", o0.getShopPhone());
                oneShop.put("description", o0.getDescription());
                oneShop.put("website", o0.getWebsite());
                oneShop.put("categroy1", o0.getCategory1());
                

                
                friendsWhoLike = dao.shopOperationFromFriends(uid, o0, 6).iterator();

                friends = new LinkedList();
                while(friendsWhoLike.hasNext()){
                    oneFriend = new LinkedHashMap();
                    f = friendsWhoLike.next();
                    oneFriend.put("avatarDir", f.getAvatarDir());
                    oneFriend.put("userId", f.getUserId());
                    oneFriend.put("fullName", f.getFullName());
                    friends.add(oneFriend);
                }
                oneShop.put("likedFriends", friends);
                
                oneShop.put("likes", o0.getShopLiked());
                oneShop.put("tries", o0.getShopTried());
                
                oneShop.put("likesFromFriends", dao.likedFriendsCount(uid, o0.getShopId()));
                oneShop.put("triesFromFriends", dao.triedFriendsCount(uid, o0.getShopId()));
                oneShop.put("visits", o0.getShopVisited());

                oneShop.put("isLikedByYou", dao.isLikedByMe(uid, o0));
                oneShop.put("isTriedByYou", dao.isTriedByMe(uid, o0));
                
                
             //////////////
             shops.add(oneShop);
         }
         json.put("shops", shops);
    }
    } else {
    	json.put("ec", EC.UNAUTHORIZED.toInt());
    }

 out.write(json.toJSONString());
	
	

%>
