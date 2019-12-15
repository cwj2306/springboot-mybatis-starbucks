package com.cos.starbucks.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.cos.starbucks.model.Board;
import com.cos.starbucks.repository.BoardRepository;
import com.cos.starbucks.util.Pagination;
import com.cos.starbucks.util.Search;

@Controller
@RequestMapping("/board")
public class BoardController {
	@Autowired
	private BoardRepository mBoardRepo;
	
	
	@GetMapping("")
	public String getBoardList(
			Model model,
			@RequestParam(required = false, defaultValue = "1") int page,
			@RequestParam(required = false, defaultValue = "1") int range,
			@RequestParam(required = false, defaultValue = "search") String searchType,
			@RequestParam(required = false) String keyword)
	{
		Search search = new Search();
		search.setSearchType(searchType);
		search.setKeyword(keyword);
			
		int listCnt = mBoardRepo.getBoardListCnt(search);
		
		search.pageInfo(page, range, listCnt);
		model.addAttribute("pagination", search);

		model.addAttribute("boards", mBoardRepo.findAll(search));
		return "board/list";
	}
	
	@GetMapping("/write")
	public String write() {
		return "board/write";
	}
	
	@PostMapping("/writeProc")
	public String writeProc(Board board) {
		try {
			mBoardRepo.writeProc(board);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return "redirect:/board";
	}
	
	@GetMapping("/update/{id}")
	public String update(@PathVariable int id, Model model) {
		Board board = mBoardRepo.findById(id);
		model.addAttribute("board", board);

		return "board/update";
	}

	
	@PostMapping("/updateProc")
	public String updateProc(Board board) { 
		try {
			mBoardRepo.updateProc(board);	
			return "redirect:/board";
		} catch (Exception e) {
			e.printStackTrace();
		}
		return "redirect:/board";
	}
	
	@GetMapping("/delete/{id}")
	public String delete(@PathVariable int id) {
		try {
			mBoardRepo.delete(id);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return "redirect:/board";
	}
	


	@GetMapping("/{id}")
	public String post(@PathVariable int id, Model model) {
		Board board = mBoardRepo.findById(id);
		model.addAttribute("board", board);
		List<Board> pan = mBoardRepo.prevAndNext(id);
		model.addAttribute("pan", pan);
		return "board/detail";
	}

}
