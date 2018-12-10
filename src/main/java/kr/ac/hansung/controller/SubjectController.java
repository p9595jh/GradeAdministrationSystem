package kr.ac.hansung.controller;

import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import kr.ac.hansung.model.Subject;
import kr.ac.hansung.model.TermGrade;
import kr.ac.hansung.service.SubjectService;

@Controller
public class SubjectController {
	
	@Autowired
	private SubjectService subjectService;
	
	@RequestMapping("/checkall")
	public String showTermGrades(Model model) {
		List<TermGrade> termGrades = subjectService.getTermGradeList();
		model.addAttribute("termGrades", termGrades);
		return "checkall";
	}
	
	@RequestMapping("/apply")
	public String applySubject(Model model) {
		model.addAttribute("subject", new Subject());
		
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy");
		model.addAttribute("year", sdf.format(new Date(System.currentTimeMillis())));
		
		return "apply";
	}
	
	@RequestMapping("/handleapply")
	public String handleApply(Model model, @Valid Subject subject, BindingResult result) {
		if ( result.hasErrors() ) {
			return "apply";
		}
		
		subjectService.insert(subject);
		model.addAttribute("applynew", true);
		return "main";
	}
	
	@RequestMapping("/check")
	public String checkEachTerm(
			@RequestParam(value="year", required=true) int year,
			@RequestParam(value="term", required=true) int term,
			Model model) {
		
		List<Subject> list = new ArrayList<Subject>();
		List<Subject> subjects = subjectService.getCurrent();
		for ( Subject subject : subjects )
			if ( subject.getYear() == year && subject.getTerm() == term )
				list.add(subject);
		model.addAttribute("subjects", list);
		model.addAttribute("year", year);
		model.addAttribute("term", term);
		
		return "check";
	}
	
	@RequestMapping("/main")
	public String showMain(Model model) {
		return "main";
	}
	
}
