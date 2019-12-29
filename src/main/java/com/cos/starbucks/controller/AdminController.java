package com.cos.starbucks.controller;

import java.io.IOException;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.util.UUID;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.security.core.annotation.AuthenticationPrincipal;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import com.cos.starbucks.model.Coffee;
import com.cos.starbucks.repository.CoffeeRepository;
import com.cos.starbucks.repository.MenuRepository;
import com.cos.starbucks.security.MyUserDetails;

@Controller
@RequestMapping("/admin")
public class AdminController {

	@Autowired
	private CoffeeRepository cRepo;
	@Autowired
	private MenuRepository mRepo;
	
	@Value("${file.path}")
	private String fileRealPath;
	
	@GetMapping("")
	public String admin(@AuthenticationPrincipal MyUserDetails userDetail) {
		if(userDetail.getUser().getUsername().equals("admin")) {
			return "admin/select";
		}
		return "index";
	}

	@GetMapping("/upload")
	public String imageUpload() {

		return "admin/uploadForm";
	}
	
	@PostMapping("/uploadProc")
	public String imageUploadProc(@AuthenticationPrincipal MyUserDetails userDetail,
			@RequestParam("file") MultipartFile file,Coffee coffee) {

		UUID uuid = UUID.randomUUID();
		String uuidFilename = uuid + "_" + file.getOriginalFilename();

		Path filePath = Paths.get(fileRealPath + uuidFilename);

		try {
			Files.write(filePath, file.getBytes());// 하드디스크 기록
		} catch (IOException e) {
			e.printStackTrace();
		}
		coffee.setImage(uuidFilename);
		cRepo.uploadCoffee(coffee);
		
		
		return "redirect:/coffee/product_list";
	}
}
