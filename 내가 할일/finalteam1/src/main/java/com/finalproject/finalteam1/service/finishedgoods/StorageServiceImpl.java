package com.finalproject.finalteam1.service.finishedgoods;

import com.finalproject.finalteam1.domain.finishedgoods.StorageVO;
import com.finalproject.finalteam1.domain.paging.PagingVO;
import com.finalproject.finalteam1.mapper.finishedgoods.StorageMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class StorageServiceImpl implements StorageService{

    @Autowired
    private StorageMapper storageMapper;
    @Override
    public void storageInsert(StorageVO storageVO) {
        storageMapper.storageInsert(storageVO);
    }

    @Override
    public List<StorageVO> storageSelect(PagingVO pagingVO, StorageVO storageVO) {
        return storageMapper.storageSelect(pagingVO, storageVO);
    }

    @Override
    public int storageMaxCount(StorageVO storageVO) {
        return storageMapper.storageMaxCount(storageVO);
    }

    @Override
    public void storageRemove(StorageVO storageVO) {
        storageMapper.storageDelete(storageVO);
    }

    @Override
    public void storageChange(StorageVO storageVO) {
        storageMapper.storageUpdate(storageVO);
    }
}
