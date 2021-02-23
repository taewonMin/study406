-- --------------------------------------------------------
-- 호스트:                          127.0.0.1
-- 서버 버전:                        10.5.8-MariaDB - mariadb.org binary distribution
-- 서버 OS:                        Win64
-- HeidiSQL 버전:                  11.0.0.5919
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8 */;
/*!50503 SET NAMES utf8mb4 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;


-- info 데이터베이스 구조 내보내기
CREATE DATABASE IF NOT EXISTS `info` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci */;
USE `info`;

-- 테이블 info.board 구조 내보내기
CREATE TABLE IF NOT EXISTS `board` (
  `board_no` int(11) NOT NULL DEFAULT 0,
  `board_group` varchar(50) NOT NULL DEFAULT '0',
  `board_title` varchar(100) DEFAULT NULL,
  `board_date` date DEFAULT NULL,
  `board_cnt` int(11) DEFAULT NULL,
  `mem_id` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`board_no`),
  KEY `FK_board_member` (`mem_id`),
  CONSTRAINT `FK_board_member` FOREIGN KEY (`mem_id`) REFERENCES `member` (`mem_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- 테이블 데이터 info.board:~0 rows (대략적) 내보내기
/*!40000 ALTER TABLE `board` DISABLE KEYS */;
/*!40000 ALTER TABLE `board` ENABLE KEYS */;

-- 테이블 info.member 구조 내보내기
CREATE TABLE IF NOT EXISTS `member` (
  `mem_id` varchar(50) NOT NULL,
  `mem_pass` varchar(20) DEFAULT NULL,
  `mem_name` varchar(15) DEFAULT NULL,
  `study_no` int(11) DEFAULT NULL,
  PRIMARY KEY (`mem_id`),
  KEY `FK_member_study` (`study_no`),
  CONSTRAINT `FK_member_study` FOREIGN KEY (`study_no`) REFERENCES `study` (`study_no`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- 테이블 데이터 info.member:~1 rows (대략적) 내보내기
/*!40000 ALTER TABLE `member` DISABLE KEYS */;
INSERT INTO `member` (`mem_id`, `mem_pass`, `mem_name`, `study_no`) VALUES
	('lalaru', '123', '김태원', 1),
	('test', 'test', '폰상원', NULL);
/*!40000 ALTER TABLE `member` ENABLE KEYS */;

-- 테이블 info.my_quiz 구조 내보내기
CREATE TABLE IF NOT EXISTS `my_quiz` (
  `mem_id` varchar(50) DEFAULT NULL,
  `quiz_id` int(11) DEFAULT NULL,
  KEY `FK_my_quiz_member` (`mem_id`),
  KEY `FK_my_quiz_quiz` (`quiz_id`),
  CONSTRAINT `FK_my_quiz_member` FOREIGN KEY (`mem_id`) REFERENCES `member` (`mem_id`),
  CONSTRAINT `FK_my_quiz_quiz` FOREIGN KEY (`quiz_id`) REFERENCES `quiz` (`quiz_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- 테이블 데이터 info.my_quiz:~0 rows (대략적) 내보내기
/*!40000 ALTER TABLE `my_quiz` DISABLE KEYS */;
/*!40000 ALTER TABLE `my_quiz` ENABLE KEYS */;

-- 테이블 info.quiz 구조 내보내기
CREATE TABLE IF NOT EXISTS `quiz` (
  `quiz_id` int(11) NOT NULL,
  `quiz_group` int(11) NOT NULL,
  `quiz_no` int(11) NOT NULL,
  `quiz_title` varchar(100) DEFAULT NULL,
  `quiz_prob` varchar(900) DEFAULT NULL,
  `quiz_answer` varchar(300) DEFAULT NULL,
  `mem_id` varchar(50) NOT NULL,
  `sub_no` varchar(50) DEFAULT NULL,
  `quiz_regdate` date DEFAULT NULL,
  `quiz_viewcnt` int(11) DEFAULT 0,
  `quiz_tag` varchar(600) DEFAULT NULL,
  PRIMARY KEY (`quiz_id`),
  KEY `quiz_subjectCode_fk` (`sub_no`),
  KEY `FK_quiz_member` (`mem_id`),
  CONSTRAINT `FK_quiz_member` FOREIGN KEY (`mem_id`) REFERENCES `member` (`mem_id`),
  CONSTRAINT `quiz_subjectCode_fk` FOREIGN KEY (`sub_no`) REFERENCES `subject` (`sub_no`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- 테이블 데이터 info.quiz:~3 rows (대략적) 내보내기
/*!40000 ALTER TABLE `quiz` DISABLE KEYS */;
INSERT INTO `quiz` (`quiz_id`, `quiz_group`, `quiz_no`, `quiz_title`, `quiz_prob`, `quiz_answer`, `mem_id`, `sub_no`, `quiz_regdate`, `quiz_viewcnt`, `quiz_tag`) VALUES
	(1, 1, 3, '1회 모의고사', '리팩토링이란??', '유지보수', 'lalaru', 'P01S06', '2021-02-20', 17, '소프트웨어설계,화면설계'),
	(2, 2, 1, '2번째 문제', '과연', '제발', 'lalaru', 'P01S06', '2021-02-20', 15, '하하,호호'),
	(3, 2, 2, '2번째 문제', '소주\n', '막걸리', 'lalaru', 'P02S03', '2021-02-20', 15, 'gigi,hihi');
/*!40000 ALTER TABLE `quiz` ENABLE KEYS */;

-- 테이블 info.study 구조 내보내기
CREATE TABLE IF NOT EXISTS `study` (
  `study_no` int(11) NOT NULL,
  `study_name` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`study_no`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- 테이블 데이터 info.study:~2 rows (대략적) 내보내기
/*!40000 ALTER TABLE `study` DISABLE KEYS */;
INSERT INTO `study` (`study_no`, `study_name`) VALUES
	(0, '없음'),
	(1, '1기');
/*!40000 ALTER TABLE `study` ENABLE KEYS */;

-- 테이블 info.subject 구조 내보내기
CREATE TABLE IF NOT EXISTS `subject` (
  `sub_no` varchar(50) NOT NULL,
  `sub_parent_code` varchar(50) DEFAULT NULL,
  `sub_parent_name` varchar(50) DEFAULT NULL,
  `sub_code` varchar(50) DEFAULT NULL,
  `sub_name` varchar(50) DEFAULT NULL,
  `sub_descript` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`sub_no`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- 테이블 데이터 info.subject:~11 rows (대략적) 내보내기
/*!40000 ALTER TABLE `subject` DISABLE KEYS */;
INSERT INTO `subject` (`sub_no`, `sub_parent_code`, `sub_parent_name`, `sub_code`, `sub_name`, `sub_descript`) VALUES
	('P01S01', 'P01', '소프트웨어 설계', 'S01', '요구사항 확인', '쉿'),
	('P01S06', 'P01', '소프트웨어 설계', 'S06', '화면 설계', NULL),
	('P02S02', 'P02', '소프트웨어 개발', 'S02', '데이터입출력구현', NULL),
	('P02S03', 'P02', '소프트웨어 개발', 'S03', '통합 구현', NULL),
	('P02S07', 'P02', '소프트웨어 개발', 'S07', '애플리케이션 테스트 관리', NULL),
	('P02S11', 'P02', '소프트웨어 개발', 'S11', '제품 소프트웨어 패키징', NULL),
	('P03S08', 'P03', '데이터베이스 구축', 'S08', 'SQL 응용', NULL),
	('P04S04', 'P04', '프로그래밍 언어 활용', 'S04', '프로그래밍 언어 활용', NULL),
	('P04S05', 'P04', '프로그래밍 언어 활용', 'S05', '서버 프로그램 구현', NULL),
	('P04S10', 'P04', '프로그래밍 언어 활용', 'S10', '응용 SW 기초 기술 활용', NULL),
	('P05S09', 'P05', '정보시스템 구축 관리', 'S09', '소프트웨어 개발 보안 구축', NULL);
/*!40000 ALTER TABLE `subject` ENABLE KEYS */;

/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IF(@OLD_FOREIGN_KEY_CHECKS IS NULL, 1, @OLD_FOREIGN_KEY_CHECKS) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
