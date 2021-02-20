package kr.or.ddit.common.util;

public class LoginException extends Exception {

	public LoginException() {
		super("아이디 또는 패스워드가 일치하지 않습니다.");
	}
}
