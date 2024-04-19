package com.finalproject.finalteam1.service.finishedgoods;

import com.finalproject.finalteam1.domain.finishedgoods.StorageVO;
import com.finalproject.finalteam1.domain.paging.PagingVO;

import java.util.List;

public interface StorageService {
    public void storageInsert(StorageVO storageVO);
    public List<StorageVO> storageSelect(PagingVO pagingVO, StorageVO storageVO);

    public int storageMaxCount(StorageVO storageVO);
    public void storageRemove(StorageVO storageVO);
    public void storageChange(StorageVO storageVO);
}
