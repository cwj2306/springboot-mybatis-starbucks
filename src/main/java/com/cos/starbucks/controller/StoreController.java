package com.cos.starbucks.controller;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.annotation.AuthenticationPrincipal;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.cos.starbucks.model.Mycafe;
import com.cos.starbucks.repository.StoreRepository;
import com.cos.starbucks.security.MyUserDetails;
import com.fasterxml.jackson.databind.ObjectMapper;

@Controller
@RequestMapping("/store_map")
public class StoreController {
	
	@Autowired
	private StoreRepository storeRepo;
	
	@GetMapping("")
	public String storeMap(@AuthenticationPrincipal MyUserDetails userDetail, Model model) {
		
//		if(userDetail != null) {
//			List<Mycafe> myCafes = storeRepo.findAll(userDetail.getUser().getId());
//			model.addAttribute("myCafes", myCafes);
//		}
		
		return "store/store_map";
	}
	
	
	@PostMapping("/save")
	public @ResponseBody String storeMapSave(Mycafe myCafe, @AuthenticationPrincipal MyUserDetails userDetail) {
		
		if(userDetail == null) {
			return "나만의 매장 등록은 로그인 후 이용이 가능합니다.";
		}
		
		try {
			myCafe.setUserId(userDetail.getUser().getId());
			storeRepo.save(myCafe);	
			return "ok";
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return "fail";
	}
	
	
	@PostMapping("/delete")
	public @ResponseBody String storeMapDelet(Mycafe myCafe, @AuthenticationPrincipal MyUserDetails userDetail) {
		
		if(userDetail == null) {
			return "나만의 매장 등록은 로그인 후 이용이 가능합니다.";
		}
		
		try {
			myCafe.setUserId(userDetail.getUser().getId());
			storeRepo.delete(myCafe);	
			return "ok";
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return "fail";
	}

	
	@GetMapping("/mycafe")
	public @ResponseBody String storeMapMyCafe(Mycafe myCafe, @AuthenticationPrincipal MyUserDetails userDetail) {
		
		if(userDetail == null) {
			return "not login";
		}
		
		try {
			List<Mycafe> myCafes = storeRepo.findAll(userDetail.getUser().getId());
			
			ObjectMapper objectMapper = new ObjectMapper();
			
			return objectMapper.writeValueAsString(myCafes);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return "fail";
	}
}
