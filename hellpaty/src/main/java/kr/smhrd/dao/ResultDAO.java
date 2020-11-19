package kr.smhrd.dao;

import java.util.List;

import javax.servlet.http.HttpSession;

import kr.smhrd.vo.*;

public interface ResultDAO {
public List<CandidatesVO> candidateResultList();
public int rlogin(CandidatesVO m, HttpSession Hsession);
}