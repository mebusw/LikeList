package org.likelist.dao;

import org.likelist.po.EsjBizInfo;

public interface IBizDAO {

	public EsjBizInfo signup(EsjBizInfo bizInfo);
	
	public boolean emailExist(String email);

	public EsjBizInfo login(String email, String password);

	public EsjBizInfo readProfile(int bid);

	public boolean updateProfile(EsjBizInfo bizInfo);
	public EsjBizInfo findUserByEmail(String email);

}
