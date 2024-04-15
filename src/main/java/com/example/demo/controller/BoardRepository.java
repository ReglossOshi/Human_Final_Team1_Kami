package com.example.demo.controller;

import com.example.demo.model.Board;
import com.example.demo.repository.BoardRowMapper;
import org.springframework.stereotype.Repository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import java.util.List;

@Repository
public class BoardRepository {

    @Autowired
    private JdbcTemplate jdbcTemplate;

    public List<Board> findAll() {
        String query = "SELECT * FROM board ORDER BY id DESC";
        return jdbcTemplate.query(query, new BoardRowMapper());
    }

    public Board findById(int id) {
        String query = "SELECT * FROM board WHERE id = ?";
        return jdbcTemplate.queryForObject(query, new Object[]{id}, new BoardRowMapper());
    }

    public void save(Board board) {
        String query = "INSERT INTO board (title, content, author) VALUES (?, ?, ?)";
        jdbcTemplate.update(query, board.getTitle(), board.getContent(), board.getAuthor());
    }

    public void update(Board board) {
        String query = "UPDATE board SET title = ?, content = ?, author = ? WHERE id = ?";
        jdbcTemplate.update(query, board.getTitle(), board.getContent(), board.getAuthor(), board.getId());
    }

    public void delete(int id) {
        String query = "DELETE FROM board WHERE id = ?";
        jdbcTemplate.update(query, id);
    }
}

