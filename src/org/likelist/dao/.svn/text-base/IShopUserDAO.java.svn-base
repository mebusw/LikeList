package org.likelist.dao;

import java.util.List;
import org.likelist.po.*;
import org.likelist.type.OperationType;

public interface IShopUserDAO extends IShopDAO {

	public EsjUserLikeit ILike(int uid, int shopId);

	public EsjUserTryit ITry(int uid, int shopId);

	public boolean IShare(int uid, int shopId);
	
	public boolean isLikedByMe(int uid, EsjShop esjShop);

	public boolean isTriedByMe(int uid, EsjShop esjShop);

	/**
	 * 
	 * @param uid
	 * @param offset
	 * @param pageSize
	 * @param sortBy
	 * @return List&lt;Object [EsjUserLog, EsjUserFriend, EsjUserInfo]&gt;
	 */
	public List<?> myLikes(int uid, int offset, int pageSize, int sortBy);

	/**
	 * 
	 * @param uid
	 * @param offset
	 * @param pageSize
	 * @param sortBy
	 * @return List&lt;Object [EsjUserLog, EsjUserFriend, EsjUserInfo]&gt;
	 */
	public List<?> myTries(int uid, int offset, int pageSize, int sortBy);

	/**
	 * count my friends who like the shop
	 * 
	 * @param uid
	 * @param shopId
	 * @return long
	 */
	public long likedFriendsCount(int uid, int shopId);

	public long triedFriendsCount(int uid, int shopId);

	public boolean disLike(int uid, int shopId);

	public boolean disTry(int uid, int shopId);

	public long updateLikeCount(int shopId);

	public long updateTryCount(int shopId);

	public long myTriesCount(int uid);

	public long myLikesCount(int uid);

	/**
	 * for shop reputation. visitType: browse=0, enter=1, clickURL=2
	 */
	public EsjShopVisitor visitShop(int uid, int shopId, int visitType);
	public boolean IGroupPurchase(int uid, int shopId);

	public boolean IForward(int uid, int shopId);

	public EsjUserLog createUserLog(int uid, OperationType type, int shopId, int friendId, String destContent);
	
	/**
	 * 
	 * @param uid
	 * @param offset
	 * @param pageSize
	 * @return List&lt;Object [EsjShop, EsjShopDiscount, EsjShopGrouprate]&gt;
	 */
	public List<?> findRecentDeal(int uid, int offset, int pageSize);

	/**
	 * 
	 * @param uid
	 * @param offset
	 * @param pageSize
	 * @return List&lt;Object [EsjShop, EsjShopDiscount, EsjShopGrouprate]&gt;
	 */
	public List<?> findRecentGr(int uid, int offset, int pageSize);

}
