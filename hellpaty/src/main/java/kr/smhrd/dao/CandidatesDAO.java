package kr.smhrd.dao;

import java.util.List;

import kr.smhrd.vo.*;

public interface CandidatesDAO {
  //인터페이스형태로 spring 구조 중 하나(솔직히 왜필요한지모르겠다만..)
public List<CandidatesVO> candidatesList(SearchCriteria cri);
public int candidatesInsert(CandidatesVO vo);
public int candidatesDelete(int num);
public void cdInsertExcel(List<CandidatesVO> list);
public int cdListCount(SearchCriteria cri);
}
