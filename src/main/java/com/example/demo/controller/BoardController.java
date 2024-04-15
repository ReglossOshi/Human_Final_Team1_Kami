package com.example.demo.controller;

import com.example.demo.model.Board;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import jakarta.servlet.http.HttpServletRequest;

@Controller
@RequestMapping("/board")
public class BoardController {

	@Autowired
	private BoardRepository boardRepository;



	@GetMapping
	public String list(Model model) {
		model.addAttribute("boards", boardRepository.findAll());
		return "list";
	}

	@GetMapping("/{id}")
	public String detail(@PathVariable int id, Model model) {
		Board board = boardRepository.findById(id);
		model.addAttribute("board", board);
		return "detail";
	}

	@GetMapping("/new")
	public String newBoardForm() {
		return "new";
	}

	@PostMapping
	public String create(HttpServletRequest request) {
		String title = request.getParameter("title");
		String content = request.getParameter("content");
		String author = request.getParameter("author");

		Board board = new Board();
		board.setTitle(title);
		board.setContent(content);
		board.setAuthor(author);

		boardRepository.save(board);
		return "redirect:/board";
	}

	@GetMapping("/edit/{id}")
	public String editForm(@PathVariable int id, Model model) {
		Board board = boardRepository.findById(id);
		model.addAttribute("board", board);
		return "edit";
	}

	@PostMapping("/update")
	public String update(HttpServletRequest request) {
		int id = Integer.parseInt(request.getParameter("id"));
		String title = request.getParameter("title");
		String content = request.getParameter("content");
		String author = request.getParameter("author");

		Board board = new Board();
		board.setId(id);
		board.setTitle(title);
		board.setContent(content);
		board.setAuthor(author);

		boardRepository.update(board);
		return "redirect:/board";
	}

	@PostMapping("/delete/{id}")
	public String delete(@PathVariable int id) {
		boardRepository.delete(id);
		return "redirect:/board";
	}
}
