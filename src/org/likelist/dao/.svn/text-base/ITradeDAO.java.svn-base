package org.likelist.dao;

import org.likelist.po.*;

public interface ITradeDAO {
	public EsjOrderInfo createOrder(EsjOrderInfo order);
	public EsjOrderInfo findOrder(int orderId);
	public EsjOrderInfo updateOrder(EsjOrderInfo order);
	
	public boolean isOrderPaid(int orderId);
	public long grPaidCount(int grId);
	public EsjOrderInfo findGrByCode(String code);
}
