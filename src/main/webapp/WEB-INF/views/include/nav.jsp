<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!-- header 시작 -->
    <header>
        <div class="top_logo">
            <a href="/"><img src="/img/logo.png"/></a>
        </div>
        <!-- 메뉴 1 시작 -->
        <div class="nav_div">
            <nav class="top_first_nav">
                <ul>
                    <li class="top_fNav_01"><a href="#">Sign In</a></li>
                    <li class="top_fNav_02">｜</li>
                    <li class="top_fNav_03"><a href="#">My Starbucks</a></li>
                </ul>
            </nav>
        </div>
        <!-- 메뉴 1 끝 -->
        <!-- 메뉴 2 시작 -->
        <div class="nav_div">
            <nav class="top_second_nav">
                <ul>
                    <li class="top_sNav_li">
                        <a class="menuLink" href="/coffee/product_list">COFFEE</a>
                        <ul class="submenu">
                            <li><a href="/coffee/product_list" class="submenuLink longLink">커피</a></li>
                            <li><a href="/coffee/productFinder" class="submenuLink longLink">나와 어울리는 커피</a></li>
                            <li><a href="/coffee/espresso" class="submenuLink longLink">에스프레소 음료</a></li>
                        </ul>
                    </li>
                    <li class="top_sNav_li"> <a class="menuLink" href="/menu/drink_list">MENU</a>
                        <ul class="submenu">
                            <li><a href="/menu/drink_list" class="submenuLink">음료</a></li>
                            <li><a href="/menu/food_list" class="submenuLink">푸드</a></li>
                            <li><a href="/menu/card_list" class="submenuLink">카드</a></li>
                        </ul>
                    </li>
                    <li class="top_sNav_li"> <a class="menuLink" href="#">STORE</li>
                    <li class="top_sNav_li"> <a class="menuLink" href="#">WHAT'S NEW</a> </li>
                </ul>
            </nav>
        </div>
        <!-- 메뉴 2 끝 -->
    </header>
    <!-- header 끝 -->