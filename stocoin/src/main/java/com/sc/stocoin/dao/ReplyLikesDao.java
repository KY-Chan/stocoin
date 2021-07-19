package com.sc.stocoin.dao;

import java.util.List;

import com.sc.stocoin.model.ReplyLikes;

public interface ReplyLikesDao {

	void insertLikes(ReplyLikes rl);

	ReplyLikes select(ReplyLikes rl);

	void deleteLikes(ReplyLikes rl);

	List<ReplyLikes> selectMno(int mno, int bno);

}
