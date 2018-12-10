package kr.ac.hansung.dao;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.List;

import javax.sql.DataSource;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.RowMapper;
import org.springframework.stereotype.Repository;

import kr.ac.hansung.model.Subject;
import kr.ac.hansung.model.TermGrade;

@Repository
public class SubjectDAO {
	
	private JdbcTemplate jdbcTemplate;
	
	@Autowired
	public void setDataSource(DataSource dataSource) {
		jdbcTemplate = new JdbcTemplate(dataSource);
	}
	
	public Subject getSubject(int year, int term, String code) {
		String sqlStatement = "select * from subjects where year=? and term=? and code=?";
		return jdbcTemplate.queryForObject(sqlStatement, new Object[] {year, term, code}, new RowMapper<Subject>() {
			public Subject mapRow(ResultSet rs, int rowNum) throws SQLException {
				Subject subject = new Subject();
				subject.setYear(rs.getInt("year"));
				subject.setTerm(rs.getInt("term"));
				subject.setCode(rs.getString("code"));
				subject.setName(rs.getString("name"));
				subject.setDivision(rs.getString("division"));
				subject.setGrade(rs.getInt("grade"));
				return subject;
			}
			
		});
	}

	public List<Subject> getCurrent() {
		String sqlStatement = "select * from subjects";
		return jdbcTemplate.query(sqlStatement, new RowMapper<Subject>() {
			public Subject mapRow(ResultSet rs, int rowNum) throws SQLException {
				Subject subject = new Subject();
				subject.setYear(rs.getInt("year"));
				subject.setTerm(rs.getInt("term"));
				subject.setCode(rs.getString("code"));
				subject.setName(rs.getString("name"));
				subject.setDivision(rs.getString("division"));
				subject.setGrade(rs.getInt("grade"));
				return subject;
			}
		});
	}
	
	public List<TermGrade> getTermGradeList() {
		String sqlStatement = "select year, term, sum(grade) as grade from subjects group by year, term";
		return jdbcTemplate.query(sqlStatement, new RowMapper<TermGrade>() {
			public TermGrade mapRow(ResultSet rs, int rowNum) throws SQLException {
				TermGrade termGrade = new TermGrade();
				termGrade.setYear(rs.getInt("year"));
				termGrade.setTerm(rs.getInt("term"));
				termGrade.setGrade(rs.getInt("grade"));
				return termGrade;
			}
		});
	}

	public boolean insert(Subject subject) {
		int year = subject.getYear();
		int term = subject.getTerm();
		String code = subject.getCode();
		String name = subject.getName();
		String division = subject.getDivision();
		int grade = subject.getGrade();
		
		String sqlStatement = "insert into subjects (year, term, code, name, division, grade) values (?,?,?,?,?,?)";
		return jdbcTemplate.update(sqlStatement, new Object[] {year, term, code, name, division, grade}) == 1;
	}

}
