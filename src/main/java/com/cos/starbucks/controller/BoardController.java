package com.cos.starbucks.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.annotation.AuthenticationPrincipal;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.cos.starbucks.model.Board;
import com.cos.starbucks.repository.BoardRepository;
import com.cos.starbucks.security.MyUserDetails;
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
	public String write(@AuthenticationPrincipal MyUserDetails userDetail) {
		if(userDetail.getUser().getUsername().equals("admin"))
		return "board/write";
		
		return null;
	}
	
	@PostMapping("/writeProc")
	public String writeProc(@AuthenticationPrincipal MyUserDetails userDetail,Board board) {
		try {
		if(userDetail.getUser().getUsername().equals("admin"))
			mBoardRepo.writeProc(board);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return "redirect:/board";
	}
	
	@GetMapping("/update/{id}")
	public String update(@AuthenticationPrincipal MyUserDetails userDetail,@PathVariable int id, Model model) {
		if(userDetail.getUser().getUsername().equals("admin")) {
		Board board = mBoardRepo.findById(id);
		model.addAttribute("board", board);	
		return "board/update";
		}
		return null;
	}

	
	@PostMapping("/updateProc")
	public String updateProc(@AuthenticationPrincipal MyUserDetails userDetail,Board board) { 
		try {
			if(userDetail.getUser().getUsername().equals("admin")) {
			mBoardRepo.updateProc(board);	
			return "redirect:/board";}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return "redirect:/board";
	}
	
	@GetMapping("/delete/{id}")
	public String delete(@AuthenticationPrincipal MyUserDetails userDetail,@PathVariable int id) {
		try {
			if(userDetail.getUser().getUsername().equals("admin"))
			mBoardRepo.delete(id);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return "redirect:/board";
	}
	


	@GetMapping("/detail/{id}")
	public String post(@PathVariable int id, Model model) {
		Board board = mBoardRepo.findById(id);
		model.addAttribute("board", board);
		List<Board> pan = mBoardRepo.prevAndNext(id);
		model.addAttribute("pan", pan);
		return "board/detail";
	}

}
