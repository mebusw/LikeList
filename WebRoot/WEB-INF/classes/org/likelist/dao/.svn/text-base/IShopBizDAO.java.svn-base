package org.likelist.dao;

import java.util.Date;
import java.util.List;

import org.likelist.po.EsjShop;
import org.likelist.po.EsjShopDiscount;
import org.likelist.po.EsjShopGrouprate;

/**
 * 
 * @author j1shen
 * @see ShopBizDAOImpl
 */
public interface IShopBizDAO extends IShopDAO {
	/**
	 * Create a new shop and wait for approve from admin
	 * 
	 * @param bid
	 *            Business owner
	 * @param shop
	 * @return
	 */
	public EsjShop createShop(EsjShop shop);

	public boolean isShopExist(String keyword);

	public boolean updateShop(EsjShop shop);

	public boolean removeShop(int shopId);

	public EsjShop renewDealPublishExpire(int shopId, Date newExpire);

	public boolean isDealPublishExpired(int shopId);

	public EsjShopDiscount createDeal(EsjShopDiscount deal);

	public boolean removeDeal(int dealId);


	public EsjShopDiscount updateDeal(EsjShopDiscount deal);
	public EsjShopGrouprate updateGrouprate(EsjShopGrouprate gr);

	public List<EsjShop> findMyShops(int bid);

	public EsjShopGrouprate createGrouprate(EsjShopGrouprate gr);

	/**
	 * only shop owner can view such detailed trends.
	 * 
	 * @param shopId
	 * @param beginTime
	 * @param endTime
	 */
	public void findTrends(int shopId, Date beginTime, Date endTime);

	/**
	 * 
	 * @param bid
	 * @param shopId
	 * @return List&lt;Long&gt; <br>
	 *         [0] amount of like<br>
	 *         [1] amount of try<br>
	 *         [2] friends amount of liked people<br>
	 *         [3] deal click times<br>
	 *         [4] browse times of today<br>
	 *         [5] browse times of yesterday<br>
	 *         [6] enter times of today<br>
	 *         [7] enter times of yesterday<br>
	 *         [8] URLClick times of today<br>
	 *         [9] URLClick times of yesterday<br>
	 *         [10] browse times of this week<br>
	 *         [11] browse times of last week<br>
	 *         [12] enter times of this week<br>
	 *         [13] enter times of last week<br>
	 *         [14] URLClick times of this week<br>
	 *         [15] URLClick times of last week<br>
	 *         [16] browse times of this month<br>
	 *         [17] browse times of last month<br>
	 *         [18] enter times of this month<br>
	 *         [19] enter times of last month<br>
	 *         [20] URLClick times of this month<br>
	 *         [21] URLClick times of last month<br>
	 */
	public List<Long> shopReputation(int bid, int shopId);
	

}
