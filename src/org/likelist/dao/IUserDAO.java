package org.likelist.dao;

import java.util.List;
import org.likelist.po.*;

public interface IUserDAO {

	public EsjUserInfo signup(EsjUserInfo user);
	
	public boolean emailExist(String email);

	public EsjUserInfo login(String email, String password);

	public EsjUserInfo readProfile(int uid);

	public boolean updateProfile(EsjUserInfo pf);

	public EsjUserInfo updateAvatar(int uid, String avatarPath);
	
	public EsjUserInfo validEmail(int userId, int validCode);

	public List<EsjUserLog> findFriendLog(int friendId);

	public List<EsjUserLog> findMyFriendsLog(int uid);

	public EsjUserInfo findUser(int userId);
	public EsjUserInfo findUserByEmail(String email);
}
