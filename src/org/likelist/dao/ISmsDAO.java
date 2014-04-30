package org.likelist.dao;

import java.util.List;

import org.likelist.po.EsjU2uSms;

public interface ISmsDAO {
	public long findSmsInboxCount(int uid);
	public List<EsjU2uSms> findSmsOutbox(int uid);

	public EsjU2uSms readSms(int uid, int smsId);

	public EsjU2uSms sendSms(int uid, int friendId, String subject, String content);

	public EsjU2uSms replySms(int uid, int smsId, String content);

	public long findUnreadSmsCount(int uid);
	public List<?> findSmsInboxByPage(int uid, int offset,
			int pageSize);
}
