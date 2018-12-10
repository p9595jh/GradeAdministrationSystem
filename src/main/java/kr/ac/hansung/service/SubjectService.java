package kr.ac.hansung.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.ac.hansung.dao.SubjectDAO;
import kr.ac.hansung.model.Subject;
import kr.ac.hansung.model.TermGrade;

@Service
public class SubjectService {
	
	@Autowired
	private SubjectDAO subjectDao;
	
	public List<Subject> getCurrent() {
		return subjectDao.getCurrent();
	}
	
	public List<TermGrade> getTermGradeList() {
		return subjectDao.getTermGradeList();
	}

	public void insert(Subject subject) {
		subjectDao.insert(subject);
	}

}
