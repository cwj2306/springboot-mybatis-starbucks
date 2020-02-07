package com.cos.starbucks.appController;

import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import com.cos.starbucks.model.Board;
import com.cos.starbucks.repository.BoardRepository;

@RestController
@RequestMapping("/android")
public class AWhatsNewController {
	
	@Autowired
	private BoardRepository bRepo;
	
	@GetMapping("/whatsnew")
	public HashMap<String, Object> json() {
		List<Board> boards = bRepo.AfindAll();
		
		HashMap<String, Object> BoardDTO = new HashMap<>();
		
		BoardDTO.put("boards", boards);
		return BoardDTO;
	}
	
	@PostMapping("/whatsnew/next")
	public HashMap<String, Object> next(@RequestParam int position) {
		List<Board> boards = bRepo.AfindNext(position+1);
		
		HashMap<String, Object> BoardDTO = new HashMap<>();
		
		BoardDTO.put("boards", boards);
		return BoardDTO;
	}

}
