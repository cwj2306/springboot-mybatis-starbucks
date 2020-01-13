package com.cos.starbucks.controller;

import java.io.IOException;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.util.List;
import java.util.UUID;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.security.core.annotation.AuthenticationPrincipal;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;


import com.cos.starbucks.model.Beverage;
import com.cos.starbucks.model.Coffee;
import com.cos.starbucks.model.Trade;
import com.cos.starbucks.model.User;
import com.cos.starbucks.repository.AdminRepository;
import com.cos.starbucks.repository.CoffeeRepository;
import com.cos.starbucks.repository.MenuRepository;
import com.cos.starbucks.repository.UserRepository;
import com.cos.starbucks.security.MyUserDetails;
import com.cos.starbucks.util.Script;

@Controller
@RequestMapping("/admin")
public class AdminController {

	@Autowired
	private CoffeeRepository cRepo;
	@Autowired
	private MenuRepository mRepo;
	@Autowired
	private AdminRepository aRepo;
	@Autowired
	private UserRepository uRepo;
	@Autowired
	BCryptPasswordEncoder passwordEncoder;

	@Value("${file.path}")
	private String fileRealPath;

	@GetMapping("")
	public String admin(@AuthenticationPrincipal MyUserDetails userDetail, Model model) {
		if (userDetail.getUser().getUsername().equals("admin")) {
			List<User> userList = uRepo.findAll();
			int sum=uRepo.findSum();
			model.addAttribute("userList", userList);
			model.addAttribute("sum",sum);
			return "admin/index";
		}

		return null;
	}

	@GetMapping("/tables")
	public String tables(@AuthenticationPrincipal MyUserDetails userDetail, Model model) {
		if (userDetail.getUser().getUsername().equals("admin")) {
			List<Trade> tradeList = aRepo.findTrade();
			System.out.println(tradeList);
			if (tradeList.size()==0) {
				return "admin/notable";
			}else {
				int sum=aRepo.findSum();
				model.addAttribute("tradeList",tradeList);
				model.addAttribute("sum",sum);
				return "admin/tables";
			}
		}
		return null;
	}

	@GetMapping("/changePwForm")
	public String register(@AuthenticationPrincipal MyUserDetails userDetail) {
		if (userDetail.getUser().getUsername().equals("admin"))
			return "admin/changePwForm";

		return null;
	}

	@GetMapping("/bevUpload")
	public String bevUpload(@AuthenticationPrincipal MyUserDetails userDetail) {
		if (userDetail.getUser().getUsername().equals("admin"))
			return "admin/bevUpload";

		return null;
	}

	@GetMapping("/coffeeUpload")
	public String coffeeUpload(@AuthenticationPrincipal MyUserDetails userDetail) {
		if (userDetail.getUser().getUsername().equals("admin"))
			return "admin/coffeeUpload";

		return null;
	}

	@GetMapping("/bevDelete")
	public String bevDelete(@AuthenticationPrincipal MyUserDetails userDetail, Model model) {
		if (userDetail.getUser().getUsername().equals("admin")) {
			List<Beverage> bever = mRepo.findAll();
			List<Beverage> cold = mRepo.findCold();
			List<Beverage> brud = mRepo.findBrud();
			List<Beverage> espr = mRepo.findEspr();
			List<Beverage> prap = mRepo.findPrap();
			List<Beverage> blend = mRepo.findBlend();
			List<Beverage> fiz = mRepo.findFiz();
			List<Beverage> etc = mRepo.findEtc();
			List<Beverage> tea = mRepo.findTea();
			List<Beverage> juice = mRepo.findJuice();

			model.addAttribute("bever", bever);
			model.addAttribute("cold", cold);
			model.addAttribute("brud", brud);
			model.addAttribute("espr", espr);
			model.addAttribute("prap", prap);
			model.addAttribute("blend", blend);
			model.addAttribute("fiz", fiz);
			model.addAttribute("tea", tea);
			model.addAttribute("etc", etc);
			model.addAttribute("juice", juice);
			return "admin/bevDelete";
		}

		return null;
	}
	
	@GetMapping("/coffeeDelete")
	public String coffeeDelete(@AuthenticationPrincipal MyUserDetails userDetail, Model model) {
		if (userDetail.getUser().getUsername().equals("admin")) {
			List<Coffee> coffee= cRepo.findAll();
			List<Coffee> blonde= cRepo.findBlonde();
			List<Coffee> medium= cRepo.findMedium();
			List<Coffee> dark= cRepo.findDark();
			model.addAttribute("blonde",blonde);
			model.addAttribute("coffees",coffee);
			model.addAttribute("medium",medium);
			model.addAttribute("dark",dark);
			return "admin/coffeeDelete";
		}
		return null;
	}

	@PostMapping("/bev/delete")
	public String deletebev(@AuthenticationPrincipal MyUserDetails userDetail, @RequestParam String[] check) {
		if (userDetail.getUser().getUsername().equals("admin")) {
		for (String ids : check) {
			int id=Integer.parseInt(ids);
			mRepo.deleteBev(id);
		}
		return "redirect:/admin/bevDelete";
	}
		return null;
	}
	@PostMapping("/coffee/delete")
	public String deletecoffee(@AuthenticationPrincipal MyUserDetails userDetail, @RequestParam String[] check) {
		if (userDetail.getUser().getUsername().equals("admin")) {
		for (String ids : check) {
			int id=Integer.parseInt(ids);
			cRepo.deleteCoffee(id);
		}
		return "redirect:/admin/coffeeDelete";
	}
		return null;
	}
	@PostMapping("/changePw")
	public @ResponseBody String changePw(@AuthenticationPrincipal MyUserDetails userDetail,
			@RequestParam("password") String password) {
		if (userDetail.getUser().getUsername().equals("admin")) {
			String encPassword = passwordEncoder.encode(password);
			uRepo.changePw(encPassword);

			return Script.alertAndHref("비밀번호 변경 완료 다시로그인 해주세요.", "/logout");
		}

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

			cRepo.uploadCoffee(name, detail, price, flavor, feel, strong, roast, "/upload/" + uuidFilename);

			return "redirect:/admin";
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

			mRepo.uploadBev(name, price, category, "/upload/" + uuidFilename);

			return "redirect:/admin";
		}

		return null;
	}

	@GetMapping("/forgot")
	public String forgot() {
		return "admin/forgot-password";
	}

	@GetMapping("/charts")
	public String charts() {
		return "admin/charts";
	}

}
