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
		if (userDetail.getUser().getUsername().equals("admin")) {
			return "admin/select";
		}
		return "index";
	}

	@GetMapping("/admin")
	public String adminadmin(@AuthenticationPrincipal MyUserDetails userDetail) {
		if (userDetail.getUser().getUsername().equals("admin"))
			return "admin/selectUpload";

		return null;
	}

	@GetMapping("/uploadcoffee")
	public String uploadForm(@AuthenticationPrincipal MyUserDetails userDetail) {
		if (userDetail.getUser().getUsername().equals("admin"))
			return "admin/uploadCoffee";

		return null;
	}

	@GetMapping("/uploadbev")
	public String uploadForm2(@AuthenticationPrincipal MyUserDetails userDetail) {
		if (userDetail.getUser().getUsername().equals("admin"))
			return "admin/uploadBev";

		return null;
	}

	@PostMapping("/upload/coffee")
	public String uploadCoffee(@AuthenticationPrincipal MyUserDetails userDetail,
			@RequestParam("file") MultipartFile file, @RequestParam("name") String name,
			@RequestParam("detail") String detail, @RequestParam("price") int price,
			@RequestParam("flavor") String flavor, @RequestParam("feel") String feel,
			@RequestParam("strong") String strong, @RequestParam("roast") String roast) {
		if (userDetail.getUser().getUsername().equals("admin")) {
			UUID uuid = UUID.randomUUID();
			String uuidFilename = uuid + "_" + file.getOriginalFilename();

			Path filePath = Paths.get(fileRealPath + uuidFilename);
			System.out.println(filePath);
			try {
				Files.write(filePath, file.getBytes());// 하드디스크 기록
			} catch (IOException e) {
				e.printStackTrace();
			}

			cRepo.uploadCoffee(name, detail, price, flavor, feel, strong, roast,"/upload/"+uuidFilename);

			return "redirect:/coffee/product_list";
		}

		return null;
	}

	@PostMapping("/upload/bev")
	public String uploadBev(@AuthenticationPrincipal MyUserDetails userDetail, @RequestParam("file") MultipartFile file,
			@RequestParam("name") String name, @RequestParam("price") int price,
			@RequestParam("category") String category) {

		if (userDetail.getUser().getUsername().equals("admin")) {
			UUID uuid = UUID.randomUUID();
			String uuidFilename = uuid + "_" + file.getOriginalFilename();

			Path filePath = Paths.get(fileRealPath + uuidFilename);
			System.out.println(filePath);
			try {
				Files.write(filePath, file.getBytes());// 하드디스크 기록
			} catch (IOException e) {
				e.printStackTrace();
			}

			mRepo.uploadBev(name, price, category,"/upload/"+uuidFilename);

			return "redirect:/menu/drink_list";
		}

		return null;
	}
	
	@GetMapping("/index")
	public String index() {
		return "admin/index";
	}
	@GetMapping("/login")
	public String login() {
		return "admin/login";
	}
	@GetMapping("/register")
	public String register() {
		return "admin/register";
	}
	@GetMapping("/tables")
	public String tables() {
		return "admin/tables";
	}
	@GetMapping("/forgot")
	public String forgot() {
		return "admin/forgot-password";
	}
	@GetMapping("/charts")
	public String charts() {
		return "admin/charts";
	}
	@GetMapping("/blank")
	public String blank() {
		return "admin/blank";
	}
}
