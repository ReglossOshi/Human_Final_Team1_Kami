package com.finalproject.finalteam1.mapper.finishedgoods;

import com.finalproject.finalteam1.domain.finishedgoods.StorageVO;
import com.finalproject.finalteam1.domain.paging.PagingVO;
import org.apache.ibatis.annotations.Param;

import java.util.List;

public interface StorageMapper {
    public void storageInsert(StorageVO storageVO);
    public List<StorageVO> storageSelect(@Param("paging") PagingVO paging,@Param("storage") StorageVO storage);

    public int storageMaxCount(@Param("storage") StorageVO storageVO);
    public void storageDelete(StorageVO storageVO);
    public void storageUpdate(StorageVO storageVO);
}
