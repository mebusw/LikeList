package org.likelist.dao;

import java.util.Map;

import org.likelist.po.*;

public interface IAdminDAO {
	public void signup(String email, String password);
	public EsjAdminInfo login(String email, String password);
	public void findFeedback();
	public int findAllOnlineUser();
	public void findOnlindTreads();
	public EsjShopDiscount approveDeal(int dealId);
	public EsjShop approveShop(int shopId);
	public EsjShop createShop(EsjShop shop);
	public EsjShop updateShop(int shopId, EsjShop shop);
	public void transferShopOwner(int shopId, int bizId);
	public EsjShop promoteShop(int shopId, int bonusScore);
	public void promoteDeal(int dealId, int bonusScore);
	//public void createAd(Advertisement ad);
	public void delAd(int adId);
	public void adjustWeights(Map<String, Integer> weights);
	
}
