package org.likelist.dao;

import java.util.List;
import org.likelist.po.*;

public interface IFriendDAO {
	/**
	 * uid invites friendId
	 * @param uid
	 * @param friendId
	 * @return
	 */
	public EsjUserFriend inviteFriend(int uid, int friendId);

	/**
	 * let uid accept invitation from friendId
	 * @param uid
	 * @param friendId
	 * @return
	 */
	public EsjUserFriend acceptInvitation(int uid, int friendId);

	/**
	 * let uid deny friendId's invitation
	 * @param uid
	 * @param friendId
	 * @return
	 */
	public EsjUserFriend denyInvitation(int uid, int friendId);
	
	

	/**
	 * <u>Recommend Rule #1:</u> randomly pick 3 strangers 
	 * 		( neither accepted nor inviting friends ) from most active members 
	 * @param uid
	 * @return
	 */
	public List<EsjUserInfo> findRecommendFriend(int uid);

	
	
	/**
	 * <u>Recommend Rule #2:</u>  pick strangers 
	 * 		( neither accepted nor inviting friends ) from most active members 
	 * @param uid
	 * @param offset
	 * @param pageSize
	 * @return
	 */
	public List<EsjUserInfo> findRecommendFriend(int uid, int offset, int pageSize);
	
	/**
	 * <u>Recommend Rule #3:</u> pick strangers 
	 * 		( neither accepted nor inviting friends ) who have the same city or university or company 
	 * @param uid
	 * @param offset
	 * @param pageSize
	 * @return
	 */
	public List<EsjUserInfo> findPossibleKnownFriend(int uid, int offset, int pageSize);
	
	
	public List<EsjUserInfo> findNearbyFriend(int uid);

	public List<EsjUserInfo> findFriend(int uid, String keyword);

	public List<EsjUserInfo> findFriend(int uid);

	/**
	 * 
	 * @param uid
	 * @param offset
	 * @param pageSize
	 * @return List&lt;Object [EsjShop, EsjShopDiscount, EsjShopGrouprate, EsjUserLog, EsjUserInfo]&gt;
	 */
	public List<?> findRecentLog(int uid, int offset, int pageSize);
	
	/**
	 * 
	 * @param uid
	 * @param offset
	 * @param pageSize
	 * @return List&lt;Object [EsjShop, EsjShopDiscount, EsjShopGrouprate, EsjUserLog, EsjUserInfo]&gt;
	 */
	public List<?> findFriendLog(int uid, int offset, int pageSize);
	
	public long findUnhandledInviteCount(int uid);
	
	public List<EsjUserInfo> findUnhandledInvites(int uid);

	public boolean isFriend(int uid, int friendId);
	
}
