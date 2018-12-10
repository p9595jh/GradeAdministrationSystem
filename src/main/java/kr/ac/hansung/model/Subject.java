package kr.ac.hansung.model;

import javax.validation.constraints.Max;
import javax.validation.constraints.Min;
import javax.validation.constraints.NotEmpty;

import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@NoArgsConstructor
@ToString
public class Subject {
	private int year;
	
	@Min(value=1, message="학기는 1~2여야합니다")
	@Max(value=2, message="학기는 1~2여야합니다")
	private int term;
	
	@NotEmpty(message="과목코드가 비어있습니다")
	private String code;
	
	@NotEmpty(message="과목이름이 비어있습니다")
	private String name;
	
	@NotEmpty(message="구분이 비어있습니다")
	private String division;
	
	@Min(value=1, message="학기는 1~3이어야합니다")
	@Max(value=3, message="학기는 1~3이어야합니다")
	private int grade;
}
