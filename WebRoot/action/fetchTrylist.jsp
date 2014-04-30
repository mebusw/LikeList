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
	try {
      
        int offset = AttrParser.getParaInt(request, "offset");
        int pageSize = AttrParser.getParaInt(request, "pageSize");
        int friendId = AttrParser.getParaInt(request, "friendId");

        int uid = AttrParser.getUid(request);

        IShopUserDAO dao = new ShopUserDAOImpl();
        JSONObject json = new JSONObject();
		
        if (uid > 0) {
            List<?> shopList = dao.myTries(friendId, offset, pageSize, 0);
            
            if (null == shopList) {
                json.put("ec", EC.DAO_FAIL.toInt());
            } else {
                json.put("ec", EC.SUCCESS.toInt());
                List shops = new LinkedList();
                List friends;
                Map oneShop;
                Map oneFriend;
                Iterator<EsjUserInfo> friendsWhoLike;
                EsjUserInfo f;
                SimpleDateFormat sdf = DateTimeUtil.getSimpleDateFormatInstance();
        
                Iterator iterator1 = shopList.iterator();
                while (iterator1.hasNext()) {
                    Object[] o = (Object[]) iterator1.next();
                    EsjShop e = (EsjShop)o[0];
                    EsjShopDiscount o1 = (EsjShopDiscount)o[1];
                    EsjShopGrouprate o2 = (EsjShopGrouprate)o[2];

                    oneShop = new LinkedHashMap();
                    oneShop.put("feedFormatter", FeedFormatter.SHOP_ONLY.ordinal());

                    oneShop.put("dealSubject", o1.getSubject());
                    oneShop.put("dealContent", o1.getContent());
                    oneShop.put("dealPercent", o1.getPercent());
                    oneShop.put("dealTimeTo", sdf.format(o1.getTimeTo()));
                    
                    oneShop.put("grSubject", o2.getSubject());
                    oneShop.put("grContent", o2.getContent());
                    oneShop.put("grTimeTo", sdf.format(o2.getTimeTo()));
                    oneShop.put("grOrigPrice", o2.getOrigPrice());
                    oneShop.put("grCurrPrice", o2.getCurPrice());
 

					oneShop.put("avatarPath", e.getShopAvatarPath());
                    oneShop.put("shopId", e.getShopId());
                    oneShop.put("shopName", e.getShopName());
                    oneShop.put("fullAddress", e.getFullAddress());
                    oneShop.put("shopPhone", e.getShopPhone());
                    oneShop.put("description", e.getDescription());
                    oneShop.put("website", e.getWebsite());
                    oneShop.put("categroy1", e.getCategory1());
                    
                    friendsWhoLike = dao.shopOperationFromFriends(uid, e, 6).iterator();

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
                    
                    oneShop.put("likes", e.getShopLiked());
                    oneShop.put("tries", e.getShopTried());
                    
                    oneShop.put("likesFromFriends", dao.likedFriendsCount(uid, e.getShopId()));
                    oneShop.put("triesFromFriends", dao.triedFriendsCount(uid, e.getShopId()));
                    oneShop.put("visits", e.getShopVisited());

                    oneShop.put("isLikedByYou", dao.isLikedByMe(uid, e));
                    oneShop.put("isTriedByYou", dao.isTriedByMe(uid, e));
                    
                    oneShop.put("createTime", sdf.format(e.getLastUpdate()));
                    
                    ////////dummy part, the flag whether it's a true friend log
                    oneShop.put("opUserId", 0);
                    /////////dummy over/////////////

                    shops.add(oneShop);
                }
                json.put("shops", shops);
            }
        } else {
            json.put("ec", EC.UNAUTHORIZED.toInt());
        }
        out.write(json.toJSONString());
	} catch (Exception e) {
		e.printStackTrace(response.getWriter());
	}
%>
