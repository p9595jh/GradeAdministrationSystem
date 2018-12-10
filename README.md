# 학점 관리 시스템
## 한성대학교 정보시스템공학과 1494054 박재훈 - 웹 프레임워크1 과제2
스프링 프레임워크를 이용해서 학점을 관리하는 웹 어플리케이션입니다.  
MySQL을 스프링 JDBC를 통해 연동시켜 로그인 인증 후 학점을 조회, 입력할 수 있습니다.  
  
  
#### MySQL
student 데이터베이스 내에 users, authorities, subjects 3개의 테이블로 구성되어 있습니다.
* users: username, password, enabled (PK: username)
* authorities: username, authority
* subjects: year, term, code, name, division, grade (PK: year, term, code)  
  
#### Model
모델은 Subject와 TermGrade가 있습니다. Subject는 subjects 테이블의 컬럼들을 값으로 갖고 있고, TermGrade는 year, term, grade를 값으로 갖고 있습니다. TermGrade에는 '학년/학기별 이수 총 학점'에 해당하는 값이 들어있습니다.  
('select year, term, sum(grade) as grade from subjects group by year, term' 쿼리 사용)  
  
#### View
JSP 파일은 apply(수강신청), check(특정 연도, 학기 조회), checkall(전체 조회), home, login, main으로 이루어져 있습니다.  
CSS 파일은 다른 웹프로젝트에서 만들었던 파일을 이용했습니다.  
  
#### Control
컨트롤러는 HomeController, LoginController, SubjectController가 있습니다.
* HomeController: '/'으로의 접속을 '/main'으로 연결
* LoginController: 로그인 커스텀 폼으로, 로그인에 대해 관할하며 로그인에 실패할 경우 에러메시지를 띄움
* SubjectController: 기타 페이지들로의 연결에 대해 관할하며 신청된 Subject의 insert 작업도 수행  
  
#### etc.
로그인 페이지 이외에는 모두 인증이 필요하여, 다른 페이지로 접속할 시 로그인 페이지가 띄워집니다.  
check 페이지에서는 GET 메소드로 year과 term을 받아서 해당하는 데이터를 출력합니다.  
