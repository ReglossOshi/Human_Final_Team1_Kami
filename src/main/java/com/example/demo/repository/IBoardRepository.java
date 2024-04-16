package com.example.demo.repository;

import com.example.demo.model.Board;

import java.util.List;

public interface BoardRepository {
    List<Board> findAll();
    Board findById(Long id);
    void save(Board board);
    void update(Board board);
    void delete(Long id);
}
