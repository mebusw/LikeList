package org.likelist.dao;

import java.util.List;
import org.likelist.po.*;

public interface IShopDAO {


	/**
	 * 
	 * @param uid
	 * @param keyword
	 * @param category1
	 * @param category2
	 * @param province
	 * @param city
	 * @param district
	 * @param offset
	 * @param pageSize
	 * @param sortBy
	 * @return List&lt;Object [EsjShop, EsjShopDiscount, EsjShopGrouprate]&gt;
	 */
	public List<?> searchShopByPage(int uid, String keyword,
			String category1, String category2, String province, String city,
			String district, int offset, int pageSize, int sortBy);


	
	public long searchShopCount(int uid, String keyword, String category1, 
			String category2, String province, String city, String district);

	public EsjHotSearch addHotSearch(int uid, String keyword);

	public EsjShop findShop(int shopId);

	public List<String> findCategory(int level);

	/**
	 * search and fill the count of like/try/visit into the input EsjShop, also
	 * search the friends who like this shop
	 * 
	 * @param uid
	 *            (set to 0 if call by business member)
	 * @param esjShop
	 * @return the friend list who like this shop
	 */
	public List<EsjUserInfo> shopOperationFromFriends(int uid, EsjShop esjShop, int friendLimit);

	public long getLikeCount(int shopId);

	public long getTryCount(int shopId);

	
	public List<?> searchDealByPage(int uid, String keyword, String category1, 
			String category2, String province, String city, String district,
			int offset,	int pageSize, int sortBy);
	public long searchDealCount(int uid, String keyword, String category1, 
			String category2, String province, String city, String district);

	
	
	public EsjShopDiscount findDeal(int dealId);
	public List<EsjShopDiscount> findDeals(int shopId);
	public EsjShopGrouprate findGrouprate(int grId);
	public List<EsjShopGrouprate> findGrouprates(int shopId);

}
