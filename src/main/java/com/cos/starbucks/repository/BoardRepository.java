package com.cos.starbucks.repository;

import java.util.List;

import com.cos.starbucks.model.Board;
import com.cos.starbucks.util.Pagination;
import com.cos.starbucks.util.Search;

public interface BoardRepository {
	List<Board> findAll(Search search);
	int getBoardListCnt(Search search);
	void writeProc(Board board); //글쓰기
	void updateProc(Board board); // 수정하기
	Board findById(int id); // 상세보기
	List<Board> prevAndNext(int id);//이전글다음글
	void delete(int id); //삭제하기

}
