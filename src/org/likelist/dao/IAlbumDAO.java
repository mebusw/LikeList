package org.likelist.dao;

import java.util.List;
import org.likelist.po.EsjAlbum;
import org.likelist.po.EsjPhoto;

public interface IAlbumDAO {
	public EsjAlbum createAlbum(int ownerId);
	
	public EsjPhoto addPhoto(int ownerId, String photoPath, int albumId);

	public boolean removePhoto(int ownerId, int photoId);

	public EsjAlbum switchCoverPhoto(int ownerId, int albumId, int photoId);

	public EsjPhoto modifyPhotoDesc(int ownerId, int photoId, String newDesc);

	public EsjPhoto findPhoto(int photoId);

	public EsjAlbum findAlbum(int albumId);

	public List<EsjPhoto> findAllPhotos(int albumId);

	public EsjPhoto findCoverPhoto(int albumId);
}
