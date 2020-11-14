package kr.smhrd.dao;

import java.util.List;

import kr.smhrd.vo.*;

public interface CandidatesDAO {
public List<CandidatesVO> candidatesList(SearchCriteria cri);
public int candidatesInsert(CandidatesVO vo);
public int candidatesDelete(int num);
public void cdInsertExcel(List<CandidatesVO> list);
public int cdListCount(SearchCriteria cri);
}