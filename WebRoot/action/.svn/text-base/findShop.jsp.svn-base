<%@ page language="java" pageEncoding="UTF-8"%>
<%@  page import="java.text.SimpleDateFormat"%>
<%@  page import="org.likelist.dao.*"%>
<%@  page import="org.likelist.dao.impl.*"%>
<%@  page import="org.likelist.po.*"%>
<%@  page import="java.util.*"%>
<%@  page import="org.likelist.struts.action.*"%>
<%@  page import="org.json.simple.JSONObject"%>
<%@  page import="org.likelist.type.*"%>

<%
    request.setCharacterEncoding("utf-8");
	try {
        int shopId = AttrParser.getParaInt(request, "shopId");

        int uid = AttrParser.getUid(request);

        IShopUserDAO dao = new ShopUserDAOImpl();
        SimpleDateFormat sdf = DateTimeUtil.getSimpleDateFormatInstance();

        JSONObject json = new JSONObject();
        if (uid > 0) {
            EsjShop e = dao.findShop(shopId);
            EsjShopDiscount o1 = dao.findDeals(shopId).get(0);
            EsjShopGrouprate o2 = dao.findGrouprates(shopId).get(0);

            
            if (null == e) {
                json.put("ec", EC.DAO_FAIL.toInt());
            } else {
                json.put("ec", EC.SUCCESS.toInt());
                dao.visitShop(uid, e.getShopId(), 1);
                List shops = new LinkedList();
                List friends;
                Map oneShop;
                Map oneFriend;
                Iterator<EsjUserInfo> friendsWhoLike;
                EsjUserInfo f;
                
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
                oneShop.put("latitude", e.getLatitude());
                oneShop.put("longitude", e.getLongitude());
                
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
                
                oneShop.put("createTime", new SimpleDateFormat("MM/dd/yyyy HH:mm:ss")
                .format(e.getLastUpdate()));
                
                shops.add(oneShop);
                
                json.put("shops", shops);
            }
        } else {
            json.put("ec", EC.UNAUTHORIZED.toInt());
        }
        
        //System.out.println(json.get("ec"));
        out.write(json.toJSONString());
	} catch (Exception e) {
		e.printStackTrace(response.getWriter());
	}
%>
