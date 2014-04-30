package org.likelist.dao;
import java.util.List;

import org.likelist.po.EsjU2sComment;;

public interface ICommentDAO {
	public EsjU2sComment addComment(int shopId, String text, int uid);
	public long findCommentsCount(int shopId);
	public List<EsjU2sComment> findCommentsByPage(int shopId, int offset,
			int pageSize);
}
